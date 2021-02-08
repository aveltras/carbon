{-# LANGUAGE OverloadedStrings #-}

module Main where

import Carbon.Icons
import Carbon.Pictograms
import Data.Text
import Lib
import Lucid
import Lucid.Carbon

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
            bxHeaderName [prefix_ "Carbon"] "Components"
            bxHeaderNav $ do
              bxHeaderNavItem "Link1"
              bxHeaderNavItem "Link2"
              bxHeaderNavItem "Link3"
              bxHeaderMenu [menuLabel_ "label", triggerContent_ "label"] $ do
                bxHeaderMenuItem "Link1"
                bxHeaderMenuItem "Link2"
                bxHeaderMenuItem "Link3"
          bxSideNav [collapseMode_ "responsive"] $
            bxSideNavItems $ do
              bxSideNavLink [href_ "javascript:void(0);"] "First link"
              bxSideNavLink [href_ "javascript:void(0);"] "Second link"

          main_ [class_ "bx--content bx-ce-demo-devenv--ui-shell-content"] $ do
            "Main content here"
            bxSvg' iconChargingStationFilled16 [] $ title_ "Icon title"
            bxSvg iconAccessibility16
            bxSvg pictogramBag
