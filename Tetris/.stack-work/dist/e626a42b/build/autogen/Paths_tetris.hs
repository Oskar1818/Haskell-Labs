{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_tetris (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Clara Josefsson\\Documents\\GitHub\\Labs-Haskell\\tetris\\Tetris\\.stack-work\\install\\10241736\\bin"
libdir     = "C:\\Users\\Clara Josefsson\\Documents\\GitHub\\Labs-Haskell\\tetris\\Tetris\\.stack-work\\install\\10241736\\lib\\x86_64-windows-ghc-8.6.5\\tetris-0.1.0.0-FmxaQcsD7i22dfZvwjKdCH"
dynlibdir  = "C:\\Users\\Clara Josefsson\\Documents\\GitHub\\Labs-Haskell\\tetris\\Tetris\\.stack-work\\install\\10241736\\lib\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\Clara Josefsson\\Documents\\GitHub\\Labs-Haskell\\tetris\\Tetris\\.stack-work\\install\\10241736\\share\\x86_64-windows-ghc-8.6.5\\tetris-0.1.0.0"
libexecdir = "C:\\Users\\Clara Josefsson\\Documents\\GitHub\\Labs-Haskell\\tetris\\Tetris\\.stack-work\\install\\10241736\\libexec\\x86_64-windows-ghc-8.6.5\\tetris-0.1.0.0"
sysconfdir = "C:\\Users\\Clara Josefsson\\Documents\\GitHub\\Labs-Haskell\\tetris\\Tetris\\.stack-work\\install\\10241736\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tetris_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tetris_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "tetris_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "tetris_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tetris_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tetris_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)