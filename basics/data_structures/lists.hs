import Data.List

-- all are linked lists
xs = [1,3,11]
-- "texas ranges"
fstTen = [1..10]
evenList = [0,2..11]
letterList = ['A', 'B'..'J']

concated = xs ++ fstTen

a = 4
b = 5
c = 6
combined = a : b :[]
combined2 = a : fstTen

twoDList = [[1,3,4],[3,4,5]]

--functions
sumXs = sum fstTen
lengthXs = length fstTen
is4There = elem 11 xs
elemOnIndex = xs !! 11
isEmpty = null []
reverseIt = reverse fstTen
rep = repeat xs
fst5fInfinite = take 5 [1..]
tenTwos = replicate 10 2
many123 = take 4 (cycle [1,2,3])
sorted = sort [1,4,5,2,7,2]
sumOfLists = zipWith (+) [2,3] [2,3,5]
filterBigger5 = filter (>5) [1..10]
frst50 = takeWhile (<=50) [1..]
mult = foldl (*) 1 [1,2,4,9]
-- many others: head, tail, last, init, length, reverse, null, maximum,
  -- minimum, sum, product, drop, cycle, repeat, replicate


{-
  List comprehensions
syntax: [outoutFunction | inputSet, predicate]
-}

multEvens = [x * 2 | x <- fstTen]
idemMinus10 = [x * 2 | x <- fstTen, x * 2 /= 10]
divBy9n13 = [x | x <- [1..500], mod x 9 == 0, x `mod` 13 == 0]

multTable = [ [x * y | y <- [1..10]] | x <- [1..20] ]

