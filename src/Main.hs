{-# LANGUAGE GADTs #-}

module Main where


data Query a where
  SelectUserById            :: Int  -> Query User
  SelectTransactionsForUser :: User -> Query [Transaction]

runQuery :: Query a -> IO a
runQuery (SelectUserById uid)             = getUser uid
runQuery (SelectTransactionsForUser user) = getTransactions user

--------------------------------------------------------------------------------
-- Mock data and functions for illustration purposes
data User = User
data Transaction = Transaction

getUser :: Int -> IO User
getUser _ = return User

getTransactions :: User -> IO [Transaction]
getTransactions _ = return []

--------------------------------------------------------------------------------
-- Boilerplate
main :: IO ()
main =
  putStrLn "This program doesn't do anything interesting. Just look at the source."
