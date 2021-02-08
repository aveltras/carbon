{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Lucid.Carbon.Tooling where

import Control.Monad
import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import Data.Char (toUpper)
import Data.List (intercalate)
import Data.Text (unpack)

generateContent :: String -> IO ()
generateContent contentType = do
  let moduleName = (toUpper . head) contentType : tail contentType
      file = "../lucid-carbon-" <> contentType <> "/src/Lucid/Carbon/" <> moduleName <> ".hs"

  fileContent <- BL.readFile $ "../node_modules/@carbon/" <> contentType <> "/metadata.json"

  case eitherDecode fileContent of
    Left err -> error err
    Right (Metadata svgs) -> do
      writeFile file $
        "-- ! Don't edit this file as it is generated automatically !\n\
        \{-# LANGUAGE OverloadedStrings #-}\n\n\
        \module Lucid.Carbon."
          <> moduleName
          <> " where\n\n\
             \import Lucid.Svg"

      forM_ svgs $ \Svg {..} -> do
        let singular = init moduleName
            fnName = "bx" <> singular <> svgName <> "_"
            typeDef = fnName <> " :: Monad m => SvgT m ()\n"
            bodyDef = fnName <> " = \n"
            svgDef = "svg_ [xmlSpace_ \"" <> svgNamespace <> "\", viewBox_ \"" <> svgViewBox <> "\", fill_ \"" <> svgFill <> "\", width_ \"" <> svgWidth <> "\", height_ \"" <> svgHeight <> "\"] $ do\n"
            contentDef =
              flip fmap svgContent $
                \case
                  SvgElementPath item -> lucidShow item
                  SvgElementCircle item -> lucidShow item
                  SvgElementRect item -> lucidShow item
        appendFile file $ "\n\n" <> typeDef <> bodyDef <> "  " <> svgDef <> "    " <> intercalate "\n    " contentDef

newtype Metadata = Metadata [Svg]
  deriving (Show)

instance FromJSON Metadata where
  parseJSON = withObject "Metadata" $ \v -> do
    icons <- v .: "icons" >>= parseJSONList
    allSvgs <- forM icons $ \i -> do
      i .: "output" >>= parseJSONList
    pure $ Metadata $ concat allSvgs

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

toString :: Value -> String
toString = \case
  Number n -> show n
  String t -> unpack t
  _ -> error "no need to handle"

data Svg = Svg
  { svgName :: String,
    svgNamespace :: String,
    svgViewBox :: String,
    svgFill :: String,
    svgWidth :: String,
    svgHeight :: String,
    svgContent :: [SvgElement]
  }
  deriving (Show)

data SvgElement
  = SvgElementPath SvgPath
  | SvgElementCircle SvgCircle
  | SvgElementRect SvgRect
  deriving (Show)

instance FromJSON SvgElement where
  parseJSON = withObject "SvgElement" $ \v -> do
    svgElement <- v .: "elem"
    case svgElement of
      "path" -> SvgElementPath <$> v .: "attrs"
      "circle" -> SvgElementCircle <$> v .: "attrs"
      "rect" -> SvgElementRect <$> v .: "attrs"
      _ -> fail $ "unknown element type: " <> svgElement

newtype SvgPath = SvgPath
  { svgPathD :: String
  }
  deriving (Show)

instance FromJSON SvgPath where
  parseJSON = withObject "SvgPath" $ \v ->
    SvgPath <$> v .: "d"

instance LucidShow SvgPath where
  lucidShow SvgPath {..} =
    "path_ ["
      <> renderAttr "d" (map (\c -> if c == '\t' then ' ' else c) svgPathD)
      <> "]"

data SvgCircle = SvgCircle
  { svgCircleX :: String,
    svgCircleY :: String,
    svgCircleRadius :: String
  }
  deriving (Show)

instance FromJSON SvgCircle where
  parseJSON = withObject "SvgCircle" $ \v ->
    SvgCircle <$> v .: "cx"
      <*> v .: "cy"
      <*> v .: "r"

instance LucidShow SvgCircle where
  lucidShow SvgCircle {..} =
    "circle_ ["
      <> ( intercalate
             ", "
             [ renderAttr "cx" svgCircleX,
               renderAttr "cy" svgCircleX,
               renderAttr "r" svgCircleRadius
             ]
         )
      <> "]"

data SvgRect = SvgRect
  { svgRectWidth :: String,
    svgRectHeight :: String,
    svgRectX :: String,
    svgRectY :: String,
    svgRectRX :: Maybe String,
    svgRectRY :: Maybe String
  }
  deriving (Show)

instance FromJSON SvgRect where
  parseJSON = withObject "SvgRect" $ \v ->
    SvgRect <$> v .: "width"
      <*> v .: "height"
      <*> v .: "x"
      <*> v .: "y"
      <*> v .:? "rx"
      <*> v .:? "ry"

class LucidShow a where
  lucidShow :: a -> String

instance LucidShow SvgRect where
  lucidShow SvgRect {..} =
    "rect_ ["
      <> ( intercalate ", " $
             filter
               ("" ==)
               [ renderAttr "width" svgRectWidth,
                 renderAttr "height" svgRectHeight,
                 renderAttr "x" svgRectX,
                 renderAttr "y" svgRectY,
                 renderMaybeAttr "rx" svgRectRX,
                 renderMaybeAttr "ry" svgRectRY
               ]
         )
      <> "]"

renderAttr :: String -> String -> String
renderAttr key value = key <> "_ \"" <> value <> "\""

renderMaybeAttr :: String -> Maybe String -> String
renderMaybeAttr key = maybe "" (renderAttr key)
