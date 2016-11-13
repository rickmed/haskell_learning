{-
  Constants -there are no variables
-}
-- Num: Int | Integer | Float | Double

boundedInt :: Int
boundedInt = 5
int2 = ( 3 + (-5) - 5 * 6 ) ^ 4

unboundedInt :: Integer
unboundedInt = 3120371237218947324968256439813729137129873321904721904

float :: Float  -- 11 precision decimals
float = 0.32135 + 0.656565

doub :: Double
doub = 0.32135 + 0.656565

aBool :: Bool
aBool = True && True
aBool2 = True || False
aBool3 = not(True)
aBool4 = True == True
aBool5 = True /= True

aChar :: Char
aChar = 'c'

aString :: String  --is really a list of Chars
aString = "First Name " ++ "Last Name"
string2 = "First Name " > "Last Name"


{-
  Prefix vs infix operators
-}
someFun = mod boundedInt int2
modulo p1 p2 = p1 `mod` p2

-- show converts a type to its string representaiton
stringShow = "A list: " ++ show [1,2,3]

-- show converts string to type
bool4 = True || read "False"
add = 3.0 + read "7.2"
