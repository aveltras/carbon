{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Data.ByteString.Lazy
import Data.Text
import Network.HTTP.Types
import Network.Wai
import Network.Wai.Handler.Warp
import Network.Wai.Middleware.Static

runExample :: (Text -> Text -> ByteString) -> IO ()
runExample = run 3000 . static . app

app :: (Text -> Text -> ByteString) -> Application
app content _ res = res $ responseLBS ok200 [(hContentType, "text/html")] $ content "/static/main.css" "/static/main.js"
