{-
  Export a data type
-}
module Types
( Shape(..)
, surface
) where


{-
  Define a cusotm data type
-}

-- Cirlc/Float are value constrcutors.
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
  deriving (Show)
-- :t Circle is Float -> Float -> Float -> Shape
-- deriving Show means that haskell can now print its text representation

-- pattern match against constructors.
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- other example
data RPS = Rock | Paper | Scissors

shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper beats Rock"
shoot Paper Scissors = "Scissors beats Paper"
shoot Scissors Rock = "Rock beats Scissors"
shoot Rock Rock = "Paper Beats Rock"
shoot _ _ = "Error"

{-
  Record Syntax
-}

data Car = Car {
  company :: String
  ,model :: String
  ,year :: Int
} deriving (Show)
-- haskell automatically creates functions from the above fields.
-- :t year :: Car -> Int
-- create a new Car
myCar = Car {company="Ford", model="Mustang", year=1967}


{-
Type Parameters
-}

-- Maybe: a "type constructor" from Prelude:
-- data Maybe a = Nothing | Just a
myMaybe = Just 34
newCar = Just Car {company="GM", model="Mustang", year=1967}


{-
Typeclasses
-}
-- make sense for Person to have Eq behavior to compare if two Persons are the same
-- all fields must be Eq instances also
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show)

mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}
adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}

areNotEq = mikeD == adRock
areEq = mikeD == Person {firstName = "Michael", lastName = "Diamond", age = 43}

group = [adRock, mikeD]
haveIn = elem mikeD group


-- Maybe is instance of Ord
comp = Just 3 `compare` Just 5
-- comp = compare (Just 3) (Just 2)


-- ad useful behavior to Typeclasses
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)
-- Eq
isDayEq = Saturday == Sunday
-- Ord
isGT = Saturday > Sunday
-- Bounded
minValofDay = minBound :: Day
-- Enum
giveSucc = succ Monday
consRange = [Thursday .. Sunday]


{-
Type Aliases/Synonyms
-}

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name,PhoneNumber)]

phoneBook = [("betty","555-2938")
            ,("joe","555-2938")
            ]

{-
  Typeclasses
-}

-- example of functor
class Functor f where
    fmap :: (a -> b) -> f a -> f b

-- lists are instances which implement the Functor typeclass (with it function
-- fmap which is called map for lists.)
-- Types. is to refer to custom class and not Prelude's
instance Types.Functor [] where
    fmap = map

-- the following are the same
map1 = Types.fmap (*2) [1..3]
map2 = map (*2) [1..3]


-- the maybe functor
instance Types.Functor Maybe where
    fmap f (Just x) = Just (f x)
    fmap f Nothing = Nothing

maybeMap = Types.fmap (*2) (Just 200)