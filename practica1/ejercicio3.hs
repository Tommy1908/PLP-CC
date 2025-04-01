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
--foldr1 :: Foldable t => (a -> a -> a) -> t a -> a
mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f xs = foldr1 (\x r -> if f x r then x else r) xs

------------------------- Ejercicio 3 -------------------------
{-Definir la función sumasParciales :: Num a => [a] -> [a], que dada una lista de números devuelve
otra de la misma longitud, que tiene en cada posición la suma parcial de los elementos de la lista original
desde la cabeza hasta la posición actual. Por ejemplo, sumasParciales [1,4,-1,0,5] -> [1,5,4,4,9].-}

sumasParciales :: Num a => [a] -> [a]
sumasParciales xs = scanl1 (+) xs

sumasParciales' :: Num a => [a] -> [a]
sumasParciales' xs = foldr (\x r -> (x + sum(r)) : r) [] xs
--se puede sacar el xs
------------------------- Ejercicio 4 -------------------------
{-Definir la función sumaAlt, que realiza la suma alternada de los elementos de una lista. Es decir, da como
resultado: el primer elemento, menos el segundo, más el tercero, menos el cuarto, etc. Usar foldr.-}

sumaAlt :: Num a => [a] -> a
sumaAlt xs = head(foldr (\x r -> if (mod (length r) 2 == 0) then (-x+(head r):r) else (x+(head r)):r) [0] (reverse xs))

--pasamos la lista dada vuelta, vamos contruyendo, empiezo con un 0 y para los casos impares sumo y para los otros resto,
--voy acumulando y agarro la cabeza

--Un loco hizo esto
sumaAlt' :: (Num a) => [a] -> a 
sumaAlt' = foldr (-) 0
-- (1-(2-(3-0))) = (1-(2-3)) = (1-(-1)) = 2 ...todavia no caigo

------------------------- Ejercicio 5 -------------------------
{-Hacer lo mismo que en el punto anterior, pero en sentido inverso (el último elemento menos el anteúltimo,etc.). 
Pensar qué esquema de recursión conviene usar en este caso.-}

sumaAltOp :: Num a => [a] -> a
sumaAltOp xs = head(foldr (\x r -> if (mod (length r) 2 == 0) then (-x+(head r):r) else (x+(head r)):r) [0] xs)