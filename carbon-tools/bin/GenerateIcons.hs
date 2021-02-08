module GenerateIcons where

import Carbon.Tools

main :: IO ()
main = generateContent "icons" (init . init)
