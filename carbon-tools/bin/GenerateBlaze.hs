{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RecordWildCards #-}

module GenerateLucid where

import Carbon.Tools

main :: IO ()
main = generateModule ModuleOpts {..}
  where
    _moduleOptsTagType = "Html -> Html"
    _moduleOptsTagBody tag = "Parent \"" <> tag <> "\" \"<" <> tag <> "\" \"</" <> tag <> ">\""
    _moduleOptsAttrType = "AttributeValue -> Attribute"
    _moduleOptsAttrBody attr = "attribute " <> show attr <> " \" " <> attr <> "=\\\"\""
    _moduleOptsAttrFuncName = id
    _moduleOptsFile = "../carbon-blaze-html/src/Text/Blaze/Carbon.hs"
    _moduleOptsFileHeader =
      [untrimming|{-# LANGUAGE LambdaCase #-}
                 {-# LANGUAGE OverloadedStrings #-}
                 {-# LANGUAGE RecordWildCards #-}
                 
                 module Text.Blaze.Carbon where

                 import Carbon.Svg
                 import Control.Monad
                 import Data.Text
                 import Data.Text.Lazy.Builder
                 import Text.Blaze.Html
                 import Text.Blaze.Internal
                 import qualified Text.Blaze.Svg11 as S
                 import qualified Text.Blaze.Svg11.Attributes as S hiding (path)
                 
                 bxSvg :: Svg -> Html
                 bxSvg svg = bxSvg' svg [] mempty

                 bxSvg' :: Svg -> [Attribute] -> Html -> Html
                 bxSvg' Svg {..} attrs inner =
                   ( Prelude.foldl (!) S.svg $
                       attrs
                         <> [ S.xmlSpace (toValue . fromString . unpack $ svgNamespace),
                              S.viewbox (toValue . fromString . unpack $ svgViewBox),
                              S.fill (toValue . fromString . unpack $ svgFill),
                              S.width (toValue . fromString . unpack $ svgWidth),
                              S.height (toValue . fromString . unpack $ svgHeight)
                            ]
                   )
                     $ do
                       forM_ svgContent $ \case
                         SvgElementPath SvgPath {..} ->
                           S.path
                             ! S.d (toValue . fromString . unpack $ svgPathD)
                         SvgElementCircle SvgCircle {..} ->
                           S.circle
                             ! S.cx (toValue . fromString . unpack $ svgCircleX)
                             ! S.cy (toValue . fromString . unpack $ svgCircleY)
                             ! S.r (toValue . fromString . unpack $ svgCircleRadius)
                         SvgElementRect SvgRect {..} ->
                           S.rect
                             ! S.width (toValue . fromString . unpack $ svgRectWidth)
                             ! S.height (toValue . fromString . unpack $ svgRectHeight)
                             ! S.x (toValue . fromString . unpack $ svgRectX)
                             ! S.y (toValue . fromString . unpack $ svgRectY)
                             ! maybe mempty S.rx (toValue . fromString . unpack <$> svgRectRX)
                             ! maybe mempty S.ry (toValue . fromString . unpack <$> svgRectRY)
                       inner
                 |]
