
module Main where

import Control.Monad
import Control.Monad.State
import Data.Either
import Data.List
import Data.Map (Map(..))
import qualified Data.Map as Map
import Data.Maybe
import Data.Set (Set(..))
import qualified Data.Set as Set
import System.Environment
import System.Exit
import System.IO
import System.IO.Error
import System.Posix.Files
import System.Process

main :: IO ()
main = getArgs >>= Main.prog >>= exitWith . intToCode
  where
    intToCode :: Int -> ExitCode
    intToCode 0 = ExitSuccess
    intToCode n = ExitFailure n

