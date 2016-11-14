-- to export module
-- this would be in the folder "Geometry" file "Cube.hs"
module Geometry.Cube
( fn1
  ,fn2
) where

-- import all functions in the global namespace
import Data.List
import System.IO
-- import selected ones
import Data.List (nub, sort)
-- all except
import Data.List hiding (nub)
-- to avoid collision of other moudles function namespace
import qualified Data.Map as M





fn1 x = x
fn2 x y = x * y
