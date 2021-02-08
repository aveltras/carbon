{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RecordWildCards #-}

module Carbon.Tools
  ( module Carbon.Tools,
    untrimming,
    trimming,
  )
where

import Carbon.Svg
import Control.Monad
import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import Data.Char (toUpper)
import Data.Text (Text, pack, unpack)
import NeatInterpolation
import Text.Casing

generateContent :: String -> (String -> String) -> IO ()
generateContent contentType moduleNameBuilder = do
  let moduleName = (toUpper . head) contentType : tail contentType
      file = "../carbon-" <> contentType <> "/src/Carbon/" <> moduleName <> ".hs"
      svgFile svgModule = "../carbon-" <> contentType <> "/src/Carbon/" <> moduleName <> "/" <> svgModule <> ".hs"
      cabalFile = "../carbon-" <> contentType <> "/carbon-" <> contentType <> ".cabal"
      prefix = init contentType

  fileContent <- BL.readFile $ "../node_modules/@carbon/" <> contentType <> "/metadata.json"
  -- fileContent <- BL.readFile $ "../test.json"

  case eitherDecode fileContent of
    Left err -> error err
    Right (Metadata allSvgs) -> do
      writeFile file $
        "-- ! Don't edit this file as it is generated automatically !\n\
        \{-# LANGUAGE OverloadedStrings #-}\n\n\
        \module Carbon."
          <> moduleName
          <> " (module Exports) where\n\n"

      writeFile cabalFile $ unpack $ cabalTemplate (pack contentType) (pack moduleName)

      forM_ allSvgs $ \svgs -> do
        let singular = init moduleName
            svgModuleName = singular <> moduleNameBuilder (unpack . svgName $ head svgs)

        writeFile (svgFile svgModuleName) $ unpack $ svgFileHeader (pack moduleName) (pack svgModuleName)
        appendFile file $ "import Carbon." <> moduleName <> "." <> svgModuleName <> " as Exports\n"
        appendFile cabalFile $ "\n    Carbon." <> moduleName <> "." <> svgModuleName

        forM_ svgs $ \svg@Svg {..} -> do
          let singular = init moduleName
              fnName = prefix <> unpack svgName
              typeDef = fnName <> " :: Svg\n"
              bodyDef = fnName <> " = " <> show svg
          -- svgDef = "svg_ [xmlSpace_ \"" <> svgNamespace <> "\", viewBox_ \"" <> svgViewBox <> "\", fill_ \"" <> svgFill <> "\", width_ \"" <> svgWidth <> "\", height_ \"" <> svgHeight <> "\"] $ do\n"
          -- contentDef =
          -- flip fmap svgContent $
          -- \case
          -- SvgElementPath item -> lucidShow item
          -- SvgElementCircle item -> lucidShow item
          -- SvgElementRect item -> lucidShow item

          appendFile (svgFile svgModuleName) $ "\n\n" <> typeDef <> bodyDef

-- appendFile file $ "\n\n" <> typeDef <> bodyDef <> "  " <> svgDef <> "    " <> intercalate "\n    " contentDef

newtype Metadata = Metadata [[Svg]]
  deriving (Show)

instance FromJSON Metadata where
  parseJSON = withObject "Metadata" $ \v -> do
    icons <- v .: "icons" >>= parseJSONList
    allSvgs <- forM icons $ \i ->
      i .: "output" >>= parseJSONList
    pure $ Metadata allSvgs

instance FromJSON Svg where
  parseJSON = withObject "SVG" $ \v -> do
    descriptor <- v .: "descriptor"
    attrs <- descriptor .: "attrs"
    Svg <$> v .: "moduleName"
      <*> attrs .: "xmlns"
      <*> attrs .: "viewBox"
      <*> attrs .: "fill"
      <*> (toString <$> attrs .: "width")
      <*> (toString <$> attrs .: "height")
      <*> descriptor .: "content"
      <*> pure Nothing

toString :: Value -> Text
toString = \case
  Number n -> pack . show $ n
  String t -> t
  _ -> error "no need to handle"

instance FromJSON SvgElement where
  parseJSON = withObject "SvgElement" $ \v -> do
    svgElement <- v .: "elem"
    case svgElement of
      "path" -> SvgElementPath <$> v .: "attrs"
      "circle" -> SvgElementCircle <$> v .: "attrs"
      "rect" -> SvgElementRect <$> v .: "attrs"
      _ -> fail $ "unknown element type: " <> svgElement

instance FromJSON SvgPath where
  parseJSON = withObject "SvgPath" $ \v ->
    SvgPath <$> v .: "d"
      <*> v .:? "fill"
      <*> v .:? "data-icon-path"

instance FromJSON SvgCircle where
  parseJSON = withObject "SvgCircle" $ \v ->
    SvgCircle <$> v .: "cx"
      <*> v .: "cy"
      <*> v .: "r"

instance FromJSON SvgRect where
  parseJSON = withObject "SvgRect" $ \v ->
    SvgRect <$> v .: "width"
      <*> v .: "height"
      <*> v .: "x"
      <*> v .: "y"
      <*> v .:? "rx"
      <*> v .:? "ry"

cabalTemplate :: Text -> Text -> Text
cabalTemplate packageName moduleName =
  [trimming|
    cabal-version: 2.2
    name: carbon-${packageName}
    version: 0.1.0
    build-type: Simple

    library
      hs-source-dirs: src
      default-language: Haskell2010
      build-depends: base
                   , carbon-svg
      exposed-modules: Carbon.${moduleName}
      other-modules:
  |]

svgFileHeader :: Text -> Text -> Text
svgFileHeader package name =
  [trimming|
     {-# LANGUAGE OverloadedStrings #-}
     
     module Carbon.${package}.${name} where

     import Carbon.Svg
  |]

generateModule :: FilePath -> Text -> String -> (String -> String) -> IO ()
generateModule moduleFile moduleFileHeader typeDef bodyDef = do
  writeFile moduleFile $ unpack moduleFileHeader
  forM_ tags $ \tag -> do
    let funcName = pack $ toCamel . fromKebab $ tag
        funcType = pack typeDef
        funcBody = pack $ bodyDef tag

    appendFile moduleFile $
      unpack
        [untrimming|${funcName} :: ${funcType}
                    ${funcName} = ${funcBody}
                     |]

tags :: [String]
tags =
  [ "bx-accordion",
    "bx-accordion-item",
    "bx-breadcrumb",
    "bx-breadcrumb-item",
    "bx-breadcrumb-link",
    "bx-btn",
    "bx-checkbox",
    "bx-code-snippet",
    "bx-combo-box",
    "bx-combo-box-item",
    "bx-content-switcher",
    "bx-content-switcher-item",
    "bx-copy-button",
    "bx-data-table",
    "bx-table",
    "bx-table-head",
    "bx-table-header-row",
    "bx-table-header-cell",
    "bx-table-body",
    "bx-table-row",
    "bx-table-cell",
    "bx-table-toolbar",
    "bx-table-batch-actions",
    "bx-table-toolbar-content",
    "bx-table-toolbar-search",
    "bx-date-picker",
    "bx-date-picker-input",
    "bx-dropdown",
    "bx-dropdown-item",
    "bx-file-uploader",
    "bx-file-drop-container",
    "bx-file-uploader-item",
    "bx-form-item",
    "bx-inline-loading",
    "bx-input",
    "bx-link",
    "bx-ordered-list",
    "bx-unordered-list",
    "bx-list-item",
    "bx-loading",
    "bx-modal",
    "bx-modal-header",
    "bx-modal-close-button",
    "bx-modal-label",
    "bx-modal-heading",
    "bx-modal-body",
    "bx-modal-footer",
    "bx-multi-select",
    "bx-multi-select-item",
    "bx-inline-notification",
    "bx-toast-notification",
    "bx-number-input",
    "bx-overflow-menu",
    "bx-overflow-menu-body",
    "bx-overflow-menu-item",
    "bx-pagination",
    "bx-page-sizes-select",
    "bx-pages-select",
    "bx-progress-indicator",
    "bx-progress-step",
    "bx-radio-button",
    "bx-radio-button-group",
    "bx-search",
    "bx-select",
    "bx-select-item",
    "bx-select-item-group",
    "bx-skeleton-placeholder",
    "bx-skeleton-text",
    "bx-skip-to-content",
    "bx-slider",
    "bx-slider-input",
    "bx-structured-list",
    "bx-structured-list-head",
    "bx-structured-list-header-row",
    "bx-structured-list-header-cell",
    "bx-structured-list-body",
    "bx-structured-list-row",
    "bx-structured-list-cell",
    "bx-tabs",
    "bx-tab",
    "bx-tag",
    "bx-filter-tag",
    "bx-textarea",
    "bx-tile",
    "bx-clickable-tile",
    "bx-expandable-tile",
    "bx-selectable-tile",
    "bx-radio-tile",
    "bx-tile-group",
    "bx-toggle",
    "bx-tooltip",
    "bx-tooltip-body",
    "bx-tooltip-definition",
    "bx-tooltip-footer",
    "bx-tooltip-icon",
    "bx-header",
    "bx-header-nav",
    "bx-header-nav-item",
    "bx-header-name",
    "bx-header-menu",
    "bx-header-menu-item",
    "bx-header-menu-button",
    "bx-side-nav",
    "bx-side-nav-menu",
    "bx-side-menu-item",
    "bx-side-nav-link",
    "bx-side-nav-items"
  ]
