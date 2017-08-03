# Haskell

## Function Application


function application is assumed to have higher priority than all other operators

```
f a + b
```

meanns `(f a) + b`

## Syntax in Functions

### Pattern Matching

`Pattern Matching` is used to speciffy patterns to which some data should conform and to deconstruct the data according to those patterns.

When defining functions in haskell, you can create speaarate function bodies for different patterns

```
lucky 7 = "Lucky number seven!"
lucky x = "You aint got no luck!"
```

#### Pattern Matching with Tuples

```
addVector :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors a b = (fst a + fst b, snd a + snd b)
```

 with pattern matching
```
addVector :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) b = (x1 + y1, x2 + y2)
```

```
first :: (a,b,c) -> a
first (x, _, _) = x
```

You can also use pattern matching in list comprehensions

```
let xs = [(1,3),(4,3),(2,4),(5,3),(5,6),(3,1)]
[a + b | (a, b) <- xs]


=> [4,7,6,8,11,4]
```

### Guards

```
bmiTell :: Double -> String

bmiTell height weight
  | height * weight <= 18.5 = "You're underweight, eat more!"
  | height * weight <= 25.0 = "Looking good!"
  | height * weight <= 30.0 = "Work out!"
  | otherwise = "You're obese!"
```
### Where keyword 
Used to store variables

```
bmiTell :: Double -> String

bmiTell height weight
  | bmi <= skinny = "You're underweight, eat more!"
  | bmi <= normal = "Looking good!"
  | bmi <= overweight = "Work out!"
  | otherwise = "You're obese!"
  where bmi = height * weight
        skinny = 18.5
        normal = 25.0
        overweight = 30.0
        ///or
        (skinny, normal, overweight) = (18.5,25.0,30.0)
```

**Functions in Where Blocks**

```
calcBmis xs = [bmi w h | (w, h) <- xs]
  where bmi width height = height * width
```

### Let

Let expressions are similar to where. Where allows you to bind to variables at the end of a function, and those variables are visible to the entire function, including all its guards. let allows you to bind anywhere, but are very local and dont span across guards.

```
let cylinder r h = 
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
  in sideArea + 2 * topArea
```

let <bindings> in <expression>
The variables that you define with let are visible withing the entire let expression

So what's the difference between let and where, rather than their order? let is an expression, and where is just a binding. if something is an expression then it has a value. 

```
(let (a,b,c) = (1,2,3) in a+b+c) * 100
=> 600
```
So if lets are so good, why not use them all the time? Well they are local, so cant be used across guards


#### Let in list comprehensions 

```
calcBmis = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi > 25.0]
```
the `(w, h) <- xs` is called the generator. We can't reger to the bmi variable in the generator, because thatis defined prior to the let binding.

### Case Expressions

`case expressions` allow you to execute blocks of code for specific values of a particular variable.  Essentially, they are a way to use pattern matching almost anywhere in your code. 

these 2 are the same thing

```
head [] = error "the list is empty!"
head (x:_) = x
```

```
head xs = case xs of [] -> "the list is empty!"
                     (x:_) -> x
```

sytax for a case expression:

```
case expression of pattern -> result
                   pattern -> result
                   pattern -> result
                   pattern -> result
```

Pattern matching on function params can be done only when defining functions, but case expressions can be used anywhere. For instance you can use them to perform pattern matching in the middle of an expression

```
describle ls = "The list is" ++ case ls of [] -> "empty"
                                           [x] -> "a singleton list"
                                           xs -> "a longer list"
```

```
describeList ls = "The list is " ++ what ls
  where what [] = "empty."
        what [x] = "a singleton list."
        what xs = "a longer list."
```

## Hello Recursion!

Recursion is a way of defining functions in which a function is applied inside its own definition. The function calls itself.

The strategy is to break down the problem into smaller problems of the same kind, and then solve those problems... breaking them down further if necessary. Eventually we reach the `base case` of the problem, which can't be broken down anymore, and whose solution needs to be explicity (non-recursively) defined by the programmer.

Recursion is important in haskell, because unlike with imperative languages, you do computations in Haskell by declaring `what` something is, rather than specifying `how` you compute it.

That's why haskell isnt about issueing your computer a sequence of steps to execute, but rather correctly defining what the desired result is, often in a recursive manner.

### Maximum Awesome


```
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list!"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
```

### some more recursive functions

**replicate**
