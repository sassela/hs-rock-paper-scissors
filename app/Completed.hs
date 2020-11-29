{-# LANGUAGE OverloadedStrings #-}

module Completed where

import           CodeWorld
import           Data.Text (Text)
import           Lib (randomMove)
import           System.Random (Random (randomIO))

main :: IO ()
main = do
  random <- randomIO :: IO Double
  activityOf (initial random) change picture

initial :: Double -> Text
initial random = randomMove random ["R", "P", "S"]

change :: Event -> Text -> Text
change (KeyPress "R") "S" = "Rock beats Scissors. You win!"
change (KeyPress "R") "P" = "Paper beats Rock. Computer wins!"
change (KeyPress "P") "R" = "Paper beats Rock. You win!"
change (KeyPress "P") "S" = "Scissors beats Paper. Computer wins!"
change (KeyPress "S") "P" = "Scissors beats Paper. You win!"
change (KeyPress "S") "R" = "Rock beats Scissors. Computer wins!"
change event state =
  if event == KeyPress state
    then "DRAW!"
    else state

startingMessage :: Text
startingMessage = "Rock, Paper or Scissors?"

picture :: Text -> Picture
picture "R"   = lettering startingMessage
picture "P"   = lettering startingMessage
picture "S"   = lettering startingMessage
picture state = lettering state
