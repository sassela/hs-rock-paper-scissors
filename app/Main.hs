{-# LANGUAGE OverloadedStrings #-}

import           CodeWorld
import           Data.Text (Text, pack)
import           Lib (randomMove)
import           System.Random (Random (randomIO))

type State = Text

picture :: State -> Picture
picture state = lettering state

change :: Event -> State -> State
change event state = state

initial :: Double -> State
initial random = randomMove random ["R", "P", "S"]

main :: IO ()
main = do
  random <- randomIO :: IO Double
  activityOf (initial random) change picture
