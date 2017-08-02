

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