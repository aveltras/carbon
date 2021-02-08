{-# LANGUAGE OverloadedStrings #-}

module Main where

import Carbon.Icons
import Carbon.Pictograms
import Data.Text
import Data.Text.Lazy.Builder
import Lib
import Text.Blaze.Carbon
import Text.Blaze.Html.Renderer.Utf8
import Text.Blaze.Html5 hiding (main)
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

main :: IO ()
main = runExample $ \css js -> renderHtml $ template css js

template :: Text -> Text -> Html
template cssFile jsFile =
  docTypeHtml $ do
    H.head $ do
      H.meta ! A.charset "utf-8"
      H.title "Carbon components"
      H.link ! A.rel "stylesheet" ! A.href (toValue . fromString . unpack $ cssFile) ! A.type_ "text/css"
      H.script ! A.src (toValue . fromString . unpack $ jsFile) ! A.defer "" $ mempty
    body $ do
      H.div
        ! A.id "main-content"
        ! A.class_ "bx--body bx-ce-demo-devenv--container bx-ce-demo-devenv--rail-expanded"
        ! dataAttribute "floating-menu-container" ""
        $ do
          bxHeader $ do
            bxHeaderMenuButton mempty
            bxHeaderName ! prefix "Carbon" $ "Components"
            bxHeaderNav $ do
              bxHeaderNavItem "Link1"
              bxHeaderNavItem "Link2"
              bxHeaderNavItem "Link3"
              bxHeaderMenu ! menuLabel "label" ! triggerContent "label" $ do
                bxHeaderMenuItem "Link1"
                bxHeaderMenuItem "Link2"
                bxHeaderMenuItem "Link3"
          bxSideNav ! collapseMode "responsive" $ do
            bxSideNavItems $ do
              bxSideNavLink "First link"
              bxSideNavLink "Second link"

          H.main
            ! A.class_
              "bx--content bx-ce-demo-devenv--ui-shell-content"
            $ do
              "Main content here"
              bxSvg' iconAccessibility32 [] $ H.title "icon title"
              bxSvg iconAccessibility16
              bxSvg pictogramBag
