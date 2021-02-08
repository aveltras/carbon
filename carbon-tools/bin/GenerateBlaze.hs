{-# LANGUAGE QuasiQuotes #-}

module GenerateLucid where

import Carbon.Tools

main :: IO ()
main = generateModule moduleFile moduleFileHeader typeDef bodyDef
  where
    typeDef = "Html -> Html"
    bodyDef tag = "Parent \"" <> tag <> "\" \"<" <> tag <> "\" \"</" <> tag <> ">\""
    moduleFile = "../carbon-blaze-html/src/Text/Blaze/Carbon.hs"
    moduleFileHeader =
      [untrimming|{-# LANGUAGE OverloadedStrings #-}
                 
                 module Text.Blaze.Carbon where
                 
                 import Text.Blaze.Html
                 import Text.Blaze.Internal
                 |]
