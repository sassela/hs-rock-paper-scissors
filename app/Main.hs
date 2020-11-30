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

initial :: Double -> State
initial random = randomMove random ["R", "P", "S"]

main :: IO ()
main = do
  random <- randomIO :: IO Double
  activityOf (initial random) change picture
