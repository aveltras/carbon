{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RecordWildCards #-}

module GenerateLucid where

import Carbon.Tools

main :: IO ()
main = generateModule ModuleOpts {..}
  where
    _moduleOptsTagType = "Term arg result => arg -> result"
    _moduleOptsTagBody tag = "term " <> show tag
    _moduleOptsAttrType = "Text -> Attribute"
    _moduleOptsAttrBody attr = "makeAttribute " <> show attr
    _moduleOptsAttrFuncName attr = attr <> "_"
    _moduleOptsFile = "../carbon-lucid/src/Lucid/Carbon.hs"
    _moduleOptsFileHeader =
      [untrimming|{-# LANGUAGE LambdaCase #-}
                 {-# LANGUAGE OverloadedStrings #-}
                 {-# LANGUAGE RecordWildCards #-}
                 
                 module Lucid.Carbon where
                 
                 import Carbon.Svg
                 import Control.Monad (forM_)
                 import Data.Map (fromList, toList, union)
                 import Data.Maybe (catMaybes)
                 import Data.Text (Text)
                 import Lucid (data_)
                 import Lucid.Base (Attribute (..), HtmlT, Term (term), makeAttribute)
                 import qualified Lucid.Svg as S

                 bxSvg :: Monad m => Svg -> HtmlT m ()
                 bxSvg svg = bxSvg' svg [] mempty

                 bxSvg' :: Monad m => Svg -> [Attribute] -> HtmlT m a -> HtmlT m a
                 bxSvg' Svg {..} attrs inner =
                   let svgAttrs =
                         [ S.xmlSpace_ svgNamespace,
                           S.viewBox_ svgViewBox,
                           S.fill_ svgFill,
                           S.width_ svgWidth,
                           S.height_ svgHeight
                         ]
                       finalAttrs =
                         if Prelude.null attrs
                           then svgAttrs
                           else
                             ( fmap (uncurry Attribute) . toList $
                                 union
                                   (fromList $ toPair <$> attrs)
                                   (fromList $ toPair <$> svgAttrs)
                             )
                    in S.svg_ finalAttrs $
                         do
                           forM_ svgContent $ \case
                             SvgElementPath SvgPath {..} ->
                               S.path_
                                 ( [ S.d_ svgPathD
                                   ]
                                     <> catMaybes
                                       [ S.fill_ <$> svgPathFill,
                                         data_ "icon-path" <$> svgPathDataIconPath
                                       ]
                                 )
                             SvgElementCircle SvgCircle {..} ->
                               S.circle_
                                 [ S.cx_ svgCircleX,
                                   S.cy_ svgCircleY,
                                   S.r_ svgCircleRadius
                                 ]
                             SvgElementRect SvgRect {..} ->
                               S.rect_
                                 ( [ S.width_ svgRectWidth,
                                     S.height_ svgRectHeight,
                                     S.x_ svgRectX,
                                     S.y_ svgRectY
                                   ]
                                     <> catMaybes
                                       [ S.rx_ <$> svgRectRX,
                                         S.ry_ <$> svgRectRY
                                       ]
                                 )
                           inner
                   where
                     toPair (Attribute x y) = (x, y)
                 |]
