{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_haskell_bio (
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

bindir     = "/home/a2/code/haskell-env/haskell-bio/.stack-work/install/x86_64-linux-tinfo6/lts-13.18/8.6.4/bin"
libdir     = "/home/a2/code/haskell-env/haskell-bio/.stack-work/install/x86_64-linux-tinfo6/lts-13.18/8.6.4/lib/x86_64-linux-ghc-8.6.4/haskell-bio-0.1.0.0-KrN3u7of47VGZJbVfctQp2"
dynlibdir  = "/home/a2/code/haskell-env/haskell-bio/.stack-work/install/x86_64-linux-tinfo6/lts-13.18/8.6.4/lib/x86_64-linux-ghc-8.6.4"
datadir    = "/home/a2/code/haskell-env/haskell-bio/.stack-work/install/x86_64-linux-tinfo6/lts-13.18/8.6.4/share/x86_64-linux-ghc-8.6.4/haskell-bio-0.1.0.0"
libexecdir = "/home/a2/code/haskell-env/haskell-bio/.stack-work/install/x86_64-linux-tinfo6/lts-13.18/8.6.4/libexec/x86_64-linux-ghc-8.6.4/haskell-bio-0.1.0.0"
sysconfdir = "/home/a2/code/haskell-env/haskell-bio/.stack-work/install/x86_64-linux-tinfo6/lts-13.18/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_bio_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_bio_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskell_bio_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskell_bio_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_bio_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_bio_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)