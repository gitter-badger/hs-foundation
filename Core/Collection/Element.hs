-- |
-- Module      : Core.Array.Element
-- License     : BSD-style
-- Maintainer  : Vincent Hanquez <vincent@snarc.org>
-- Stability   : experimental
-- Portability : portable
--
module Core.Collection.Element
    ( Element
    ) where

import Core.Array.Unboxed (UArray)

-- | Element type of a collection
type family Element container
type instance Element [a] = a
type instance Element (UArray ty) = ty
