{-# LANGUAGE OverloadedStrings #-}

import           CodeWorld
import           Data.Text (Text, pack)
import           Lib (randomMove)
import           System.Random (Random (randomIO))

picture :: Text -> Picture
picture state = lettering state

change :: Event -> Text -> Text
change event state = state

initial :: Double -> Text
initial random = pack (show random)

main :: IO ()
main = drawingOf codeWorldLogo
