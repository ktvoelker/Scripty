
module Main where

import Data.List
import System.Environment
import System.Exit
import System.IO.Error
import System.Posix.Files
import System.Process

headerFileName = "Header.hs"

main = do
  fileName : scriptArgs <- getArgs
  if ".sy" `isSuffixOf` fileName
  then do
    let hsFileName = reverse $ ("sh." ++) $ drop 3 $ reverse fileName
    syStat <- getFileStatus fileName
    hsStat <- try $ getFileStatus hsFileName
    case hsStat of
      Right hsStat | modificationTime hsStat > modificationTime syStat -> return ()
      Left _ -> do
        header <- readFile headerFileName
        script <- readFile fileName
        writeFile hsFileName $ header ++ script
    proc <- runProcess
      "runghc" ("-fglasgow-exts" : hsFileName : scriptArgs)
      Nothing Nothing Nothing Nothing Nothing
    code <- waitForProcess proc
    exitWith code
  else do
    putStrLn "That's not a scriptyfile!"
    exitFailure

