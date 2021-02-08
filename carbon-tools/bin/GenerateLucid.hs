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
      [untrimming|{-# LANGUAGE OverloadedStrings #-}
                 
                 module Lucid.Carbon where
                 
                 import Data.Text (Text)
                 import Lucid.Base (Attribute, Term (term), makeAttribute)
                 |]
