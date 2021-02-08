{-# LANGUAGE QuasiQuotes #-}

module GenerateLucid where

import Carbon.Tools

main :: IO ()
main = generateModule moduleFile moduleFileHeader typeDef bodyDef
  where
    typeDef = "Term arg result => arg -> result"
    bodyDef tag = "term \"" <> tag <> "\""
    moduleFile = "../carbon-lucid/src/Lucid/Carbon.hs"
    moduleFileHeader =
      [untrimming|{-# LANGUAGE OverloadedStrings #-}
                 
                 module Lucid.Carbon where
                 
                 import Lucid.Base (Term (term))
                 |]
