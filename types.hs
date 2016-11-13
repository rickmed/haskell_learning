{-
  Union Type
 -}
data BaseBallPlayer = Pitcher
                    | Catcher
                    | Infielder
                    | Outfielder
                deriving Show

barryBonds :: BaseBallPlayer -> Bool
barryBonds Outfielder = True

barryInOf = print(barryBonds Outfielder)

{-
  Custom Types
-}
data Customer = Customer String String Double
  deriving Show

tomSmith :: Customer
tomSmith = Customer "Tom Smith" "123 Main" 20.50

getBalance :: Customer -> Double
-- we only care of the balance data
getBalance (Customer _ _ b) = b


-- other example
data RPS = Rock | Paper | Scissors

shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper beats Rock"
shoot Paper Scissors = "Scissors beats Paper"
shoot Scissors Rock = "Rock beats Scissors"
shoot Rock Rock = "Paper Beats Rock"
shoot Paper Rock = "Paper Beats Rock"
shoot _ _ = "Error"


-- other example
data Shape = Circle Float Float Float | Rectangle Float Float
  deriving Show


