-- |
-- Module      : Core.STuple
-- License     : BSD-style
-- Maintainer  : Vincent Hanquez <vincent@snarc.org>
-- Stability   : experimental
-- Portability : portable
--
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
module Core.Tuple
    ( Tuple2(..)
    , Tuple3(..)
    , Tuple4(..)
    , Fstable(..)
    , Sndable(..)
    , Thdable(..)
    ) where

import Core.Internal.Base
import Data.Data

-- | Strict tuple (a,b)
data Tuple2 a b = Tuple2 !a !b
    deriving (Show,Eq,Ord,Typeable,Data,Generic)

-- | Strict tuple (a,b,c)
data Tuple3 a b c = Tuple3 !a !b !c
    deriving (Show,Eq,Ord,Typeable,Data,Generic)

-- | Strict tuple (a,b,c,d)
data Tuple4 a b c d = Tuple4 !a !b !c !d
    deriving (Show,Eq,Ord,Typeable,Data,Generic)

-- | Class of product types that have a first element
class Fstable a where
    type FstTy a
    fst :: a -> FstTy a

-- | Class of product types that have a second element
class Sndable a where
    type SndTy a
    snd :: a -> SndTy a

-- | Class of product types that have a third element
class Thdable a where
    type ThdTy a
    thd :: a -> ThdTy a

instance Fstable (a,b) where
    type FstTy (a,b) = a
    fst (a,_) = a
instance Fstable (a,b,c) where
    type FstTy (a,b,c) = a
    fst (a,_,_) = a
instance Fstable (a,b,c,d) where
    type FstTy (a,b,c,d) = a
    fst (a,_,_,_) = a
instance Fstable (Tuple2 a b) where
    type FstTy (Tuple2 a b) = a
    fst (Tuple2 a _) = a
instance Fstable (Tuple3 a b c) where
    type FstTy (Tuple3 a b c) = a
    fst (Tuple3 a _ _) = a
instance Fstable (Tuple4 a b c d) where
    type FstTy (Tuple4 a b c d) = a
    fst (Tuple4 a _ _ _) = a

instance Sndable (a,b) where
    type SndTy (a,b) = b
    snd (_,b) = b
instance Sndable (a,b,c) where
    type SndTy (a,b,c) = b
    snd (_,b,_) = b
instance Sndable (a,b,c,d) where
    type SndTy (a,b,c,d) = b
    snd (_,b,_,_) = b
instance Sndable (Tuple2 a b) where
    type SndTy (Tuple2 a b) = b
    snd (Tuple2 _ b) = b
instance Sndable (Tuple3 a b c) where
    type SndTy (Tuple3 a b c) = b
    snd (Tuple3 _ b _) = b
instance Sndable (Tuple4 a b c d) where
    type SndTy (Tuple4 a b c d) = b
    snd (Tuple4 _ b _ _) = b

instance Thdable (a,b,c) where
    type ThdTy (a,b,c) = c
    thd (_,_,c) = c
instance Thdable (a,b,c,d) where
    type ThdTy (a,b,c,d) = c
    thd (_,_,c,_) = c
instance Thdable (Tuple3 a b c) where
    type ThdTy (Tuple3 a b c) = c
    thd (Tuple3 _ _ c) = c
instance Thdable (Tuple4 a b c d) where
    type ThdTy (Tuple4 a b c d) = c
    thd (Tuple4 _ _ c _) = c
