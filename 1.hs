

myLast x = last x

myButLast x = x !! (pred (pred (length x)))
myButLast' x = reverse x !! 1
myButLast'' =  head . tail . reverse

elementAt x y = x !! pred y

-- sum xs = foldl (\acc x -> acc + x) 0 xs

length' xs = [ succ x | x <- xs ]

removeNonUpperCase xs = [ x | x <- xs, x `elem` ['A'..'Z'] ]



addIndex x = zip [1..] x

-- let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]


lucky 7 = "Lucky number seven!"
lucky x = "You aint got no luck!"


addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, x2) (y1, y2) = (x1 + y1, x2 + y2)

first :: (a,b,c) -> a
first (a, _, _) = a

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list!"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)


replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0 = []
  | n > 0 = x : replicate' (n - 1) x

take' :: Int -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n - 1) xs 


reverse' :: [a] -> [a]
reverse' [] = []
reverse' x =
  let lastElem = last x
      initArr = init x
  in lastElem : reverse' initArr

reverse'' :: [a] -> [a]
reverse'' [] = []
reverse'' (x:xs) = reverse'' xs ++ [x]

zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (a:ax) (b:bx) = (a,b):zip' ax bx


