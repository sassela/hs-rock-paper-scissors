{-# LANGUAGE OverloadedStrings #-}

import           CodeWorld
import           Data.Text (Text, pack)
import           Lib (randomMove)
import           System.Random (Random (randomIO))

initial :: Double -> Text
initial random = pack (show random)

main :: IO ()
main = drawingOf codeWorldLogo
