module GenerateLucid where

import Carbon.Tools

main :: IO ()
main = generateModule "lucid" typeDef bodyDef
  where
    typeDef = "Term arg result => arg -> result"
    bodyDef tag = "term \"" <> tag <> "\""
