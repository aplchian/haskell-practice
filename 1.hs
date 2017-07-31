

myLast x = last x

myButLast x = x !! (pred (pred (length x)))
myButLast' x = reverse x !! 1
myButLast'' =  head . tail . reverse
