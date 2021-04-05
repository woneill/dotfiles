module Alfred (
  begin ,
  end ,
  addItem ,
  addItemBasic ,
  condAddItemSubTitle ,
  condAddItemTitle ,
  condAddItemBasicSubTitle ,
  condAddItemBasicTitle ,
  getAlfredDataFileContents ,
  putAlfredDataFileContents ,
  getAlfredCacheFileContents ,
  putAlfredCacheFileContents
) where

import System.Process
import System.Directory
import System.Environment
import Data.List
import Data.Char

toWordLower :: String -> String
toWordLower a = map toLower a

cacheDirBasic :: String
cacheDirBasic = "/Library/Caches/com.runningwithcrayons.Alfred-2/Workflow Data/"

dataDirBasic :: String
dataDirBasic = "/Library/Application Support/Alfred 2/Workflow Data/"

begin :: String
begin = "<?xml version=\"1.0\"?><items>"

end :: String
end = "</items>"

addItem :: String -> String -> String -> String -> String -> String -> String -> String
addItem a b c d e f g = "<item uid=\"" ++ a ++ "\" arg=\""++ b ++ "\" valid=\""++ c ++ "\" autocomplete=\"" ++ d ++ "\"><title>" ++ e ++ "</title><subtitle>" ++ f ++ "</subtitle><icon>" ++ g ++ "</icon></item>"

addItemBasic ::  String -> String -> String -> String -> String
addItemBasic a b c d = addItem a b "yes" "" c d "icon.png"

condAddItemTitle :: String -> String -> String -> String -> String -> String -> String -> String -> String
condAddItemTitle con a b c d e f g
  | (isInfixOf (toWordLower con) (toWordLower e)) = addItem a b c d e f g
  | otherwise = ""

condAddItemBasicTitle :: String -> String -> String -> String -> String -> String
condAddItemBasicTitle con a b c d = condAddItemTitle con a b "yes" "" c d "icon.png"

condAddItemSubTitle :: String -> String -> String -> String -> String -> String -> String -> String -> String
condAddItemSubTitle con a b c d e f g
  | (isInfixOf (toWordLower con) (toWordLower f)) = addItem a b c d e f g
  | otherwise = ""

condAddItemBasicSubTitle :: String -> String -> String -> String -> String -> String
condAddItemBasicSubTitle con a b c d = condAddItemSubTitle con a b "yes" "" c d "icon.png"

getDataDir = getEnv "alfred_workflow_data"

getCacheDir = getEnv "alfred_workflow_cache"

getAlfredDataFileContents :: String -> IO (String)
getAlfredDataFileContents fileName = do
  dir <- getDataDir
  let fPath = dir ++ "/" ++ fileName
  fExist <- doesFileExist fPath
  if fExist
    then do
       contents <- readFile fPath
       return contents
    else
       return ""

putAlfredDataFileContents :: String -> String -> IO ()
putAlfredDataFileContents fileName dataStr = do
  dir <- getDataDir
  writeFile (dir ++ "/" ++ fileName)  dataStr

getAlfredCacheFileContents :: String -> IO (String)
getAlfredCacheFileContents fileName = do
  dir <- getCacheDir
  let fPath = dir ++ "/" ++ fileName
  fExist <- doesFileExist fPath
  if fExist
    then do
       contents <- readFile fPath
       return contents
    else
       return ""

putAlfredCacheFileContents :: String -> String -> IO ()
putAlfredCacheFileContents fileName dataStr = do
  dir <- getCacheDir
  writeFile (dir ++ "/" ++ fileName)  dataStr

