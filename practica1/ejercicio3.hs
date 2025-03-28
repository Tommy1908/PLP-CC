-------------------- Esquemas de recursion --------------------
------------------------- Ejercicio 1 -------------------------

--Redefinir usando foldr las funciones sum, elem, (++), filter y map.

--foldr :: (a -> b -> b) -> b -> [a] -> b
--foldr _ z [] = z
--foldr f z (x:xs) = f x (foldr f z xs)

sum' :: (Num a) => [a] -> a
--sum' xs = foldr (\x r-> x + r) 0 xs
--sum' xs = foldr (+) 0 xs  -- f x (foldr f z xs) -> (+) x + (foldr (+) 0 xs)
sum' = foldr (+) 0

elem' :: (Eq a) =>  a -> [a] -> Bool
--elem' n xs = foldr (\x r -> if x==n then True else r) False xs
elem' n = foldr (\x r -> if x==n then True else r) False

masmas :: [a] -> [a] -> [a]
masmas xs ys = foldr (\x r -> x:r) ys xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = foldr (\x r -> if p x then x:r else r) [] xs 

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x r -> (f x):r) [] xs

------------------------- Ejercicio 2 -------------------------
--Definir la función mejorSegún :: (a -> a -> Bool) -> [a] -> a, que devuelve el máximo elemento de la lista según una función de comparación, utilizando foldr1. 
--Por ejemplo, maximum = mejorSegún (>).
