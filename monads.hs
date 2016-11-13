import System.IO()

main :: IO()
main = do
  putStrLn "What's your name"
  name <- getLine
  putStrLn ("Hello silly you " ++ name)

{-
do notation desugars to lamdas continuations and closures:
>>= is the bind/chain implementation of the monad.

action1
  >>=
    \ x1 -> action2
      >>=
        \ x2 -> action3 x1 x2
-}