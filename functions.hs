-- type declartions are not necessary but highly recommended.

add :: Int -> Int -> Int
add x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)


-- pattern matching (from top to bottom)
-- always include a bottom catch-else clause.
whatAge :: Int -> String
whatAge 15 = "You can not vote"
whatAge 18 = "You can vote"
whatAge 3 = "You are a baby"
whatAge _ = "Everything else"


-- recursion
-- since runtime has the pattern fact 0 = 1, there's no need to base/edge condition in recursion scheme.
fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n - 1)
--another way
facto n = product [1..n]


--guards (like switch case)
plusOrLess10 :: Int -> String
plusOrLess10 age
  | (0 <= age) && (age >= 10) = "MinusTen"
  | otherwise = "PlusTen"

batAvgRating :: Double -> Double -> String
batAvgRating hits atBats
  | avg <= 0.200 = "You suck"
  | avg <= 0.250 = "You're ok"
  | avg <= 0.330 = "You rock"
  | otherwise = "You are a superstar"
  where avg = hits / atBats


bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)


-- access list items
getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (x:[]) = "Frst elem in list is " ++ show x
getListItems (x:y:[]) = "First is " ++ show x ++ " and Second is " ++ show y
getListItems (x:xs) = "1st is: " ++ show x ++ ", the rest is: " ++ show xs
-- with recursion
areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) =
  x == y && areStringsEq xs ys
areStringsEq _ _ = False


-- with the "@" pattern
getFirstItem :: String -> String
getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) = "1st letter in " ++ all ++ " is " ++ [x]


{-
  map
-}

times4 :: Int -> Int
times4 x = x * 4
-- map
listTimes4 xs = map times4 xs


{-
  Partial Application
-}
addTwo :: Int -> Int -> Int
addTwo x y = x + y

incBy2 = add 2
multBy2 = (*2)


{-
  Lambdas
-}
multListBy2 = map (\x -> x * 2)
-- you can use partially applied infix operators
multListByv2 = map multBy2



{-
  Conditionals
-}
-- if: use only for binary cases, need to go with else
doubleEvenNumb y =
  if (mod y 2 /= 0)
    then y
    else y * 2

-- case
getLevel n =  case n of
  5 -> "You are in 2nd grade"
  15 -> "You are in high school"
  _ -> "go away"



{-
  Function Application
-}
-- a way to avoid parenthesis
-- to
withoutAp = sum (filter (> 10) (map (*2) [2..10]))
-- to
withAp = sum $ filter (> 10) $ map (*2) [2..10]



{-
  Function Composition
-}
-- from
someFunc = map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
-- to
withComp = map (negate . sum . tail) [[1..5],[3..6],[1..7]]


{-
Let: bind variables to functions.
-}
oddSquareSum :: Integer
oddSquareSum =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<10000) oddSquares
    in  sum belowLimit