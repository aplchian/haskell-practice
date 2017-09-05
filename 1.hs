

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


elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
  | a == x    = True
  | otherwise = a `elem'` xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerOrEqual = [ a | a <- xs, a <= x ]
      larger = [ a | a <- xs, a > x ]
  in quicksort smallerOrEqual ++ [x] ++ quicksort larger


divideByTen = (/10)

applyTwice :: (a -> a) -> a -> a
applyTwice f x  = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y 

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
    | f x = x : filter' f xs
    | otherwise = filter' f xs

sum' :: (Num a) => [a] -> a
sum' xs = foldl (+) 0 xs 

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc ) [] xs

elem'' :: (Eq a) => a -> [a] -> Bool
elem'' y ys = foldr (\x acc -> if x == y then True else acc ) False ys

maximum'' :: (Ord a) => [a] -> a
maximum'' = foldl1 max

reverse''' :: [a] -> [a]
reverse''' xs = foldl (\acc val -> val : acc) [] xs

reverse'''' :: [a] -> [a]
reverse'''' = foldl (flip(:)) []

product'' :: (Num a) => [a] -> a 
product'' = foldl (*) 1


last'' :: [a] -> a
last'' = foldl1 (\_ x -> x)


