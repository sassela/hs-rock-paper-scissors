{-# LANGUAGE OverloadedStrings #-}

module Lib where

import           CodeWorld (drawingOf, lettering)
import           Data.Text (Text)
import           System.Random

main :: IO ()
main = do
  random <- randomIO :: IO Double
  drawingOf (lettering $ randomMove random possibleMoves)

possibleMoves :: [Text]
possibleMoves = ["Rock", "Paper", "Scissors"]

randomMove :: Double -> [a] -> a
randomMove random moves = moves !! floor (random * fromIntegral (length moves))
