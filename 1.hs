

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