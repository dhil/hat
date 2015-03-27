{-- Haskell implementation of the unix program "cat" --}
import System.Environment
import System.IO
import System.Exit


main :: IO ()
main = getArgs >>= dispatch

hat :: FilePath -> IO ()
hat file = do
         fh <- openFile file ReadMode
         hSetBuffering fh $ BlockBuffering (Just 4096)
         contents <- hGetContents fh
         putStr contents
         hClose fh
         return ()

dispatch :: [String] -> IO ()
dispatch ["-h"] = usage >> exit
dispatch ["-v"] = version >> exit
dispatch ["--help"] = usage >> exit
dispatch ["--version"] = version >> exit
dispatch [] = do
               ready <- hReady stdin
               if ready then hGetLine stdin >>= putStr
               else usage >> exit
dispatch fs = do mapM hat fs
                 return ()

usage :: IO ()
usage = putStrLn "usage: hat <file1> [.. <fileN>]"

version :: IO ()
version = putStrLn $ "hat v1.0, small Haskell cat clone.\n"
          ++ "Written by Daniel Hillerström 2015.\n"
          ++ "License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.\n"
          ++ "This is free software: you are free to change and redistribute it.\n"
          ++ "There is NO WARRANTY, to the extent permitted by law."

exit = exitWith ExitSuccess
