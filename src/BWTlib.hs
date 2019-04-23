module BWTlib (
    constructBWT,
    decodeBWT,
    rotate
) where

    
import Data.List

constructBWT :: String -> String
constructBWT s = [last x | x <- sort $ map ((\x y -> zipWith const (drop y (cycle x)) x) (s++"$")) [0..(length s)]]


rotate :: [a] -> Int -> [a]
rotate [] _ = []
rotate xs n = zipWith const (drop n (cycle xs)) xs

decodeBWT :: String -> String
decodeBWT bwt = head [l | l <- (foldl (\b a -> sort $ zipWith (++) [[x] | x <- a] b) (replicate (length(bwt)) "") (replicate (length(bwt)) bwt)), last l == '$']
