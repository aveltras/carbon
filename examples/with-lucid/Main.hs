{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Main where

import Carbon.Icons
import Carbon.Pictograms
import Carbon.Svg
import Control.Monad
import Data.Maybe (catMaybes)
import Data.Text
import Lib
import Lucid
import Lucid.Base
import Lucid.Carbon
import qualified Lucid.Svg as S

main :: IO ()
main = runExample $ \css js -> renderBS $ template css js

template :: Text -> Text -> Html ()
template cssFile jsFile =
  doctypehtml_ $ do
    head_ $ do
      meta_ [charset_ "utf-8"]
      title_ "Carbon components"
      link_ [rel_ "stylesheet", href_ cssFile, type_ "text/css"]
      script_ [src_ jsFile, defer_ ""] (mempty :: Text)
    body_ $
      div_
        [ id_ "main-content",
          class_ "bx--body bx-ce-demo-devenv--container bx-ce-demo-devenv--rail-expanded",
          name_ "main-content",
          data_ "floating-menu-container" "",
          role_ "none"
        ]
        $ do
          bxHeader $ do
            bxHeaderMenuButton mempty
            bxHeaderName [makeAttribute "prefix" "Carbon"] "Components"
            bxHeaderNav $ do
              bxHeaderNavItem "Link1"
              bxHeaderNavItem "Link2"
              bxHeaderNavItem "Link3"
              bxHeaderMenu [makeAttribute "menu-label" "label", makeAttribute "trigger-content" "label"] $ do
                bxHeaderMenuItem "Link1"
                bxHeaderMenuItem "Link2"
                bxHeaderMenuItem "Link3"
          bxSideNav [makeAttribute "collapse-mode" "responsive"] $ do
            bxSideNavItems $ do
              bxSideNavLink [href_ "javascript:void(0);"] "First link"
              bxSideNavLink [href_ "javascript:void(0);"] "Second link"

          main_ [class_ "bx--content bx-ce-demo-devenv--ui-shell-content"] $ do
            "Main content here"
            bxSvg iconChargingStationFilled16
            bxSvg iconAccessibility16
            bxSvg pictogramBag

bxSvg :: Monad m => Svg -> HtmlT m ()
bxSvg Svg {..} =
  svg_
    [ S.xmlSpace_ svgNamespace,
      S.viewBox_ svgViewBox,
      S.fill_ svgFill,
      S.width_ svgWidth,
      S.height_ svgHeight
    ]
    $ do
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
