{-# LANGUAGE OverloadedStrings #-}

import           CodeWorld
import           Data.Text (Text, pack)
import           Lib (randomMove)
import           System.Random (Random (randomIO))

type State = Text

startingMessage :: State
startingMessage = "Rock, Paper or Scissors?"

picture :: State -> Picture
picture "R"   = lettering startingMessage
picture "P"   = lettering startingMessage
picture "S"   = lettering startingMessage
picture state = lettering state

change :: Event -> State -> State
change event state = state

initial :: Double -> State
initial random = randomMove random ["R", "P", "S"]

main :: IO ()
main = do
  random <- randomIO :: IO Double
  activityOf (initial random) change picture
