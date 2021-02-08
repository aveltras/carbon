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
      [untrimming|{-# LANGUAGE OverloadedStrings #-}
                 
                 module Text.Blaze.Carbon where
                 
                 import Text.Blaze.Html
                 import Text.Blaze.Internal
                 |]
