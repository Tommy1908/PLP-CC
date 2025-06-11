-- Recursion en simultaneo sobre mas de una estructura --
{-
Definir la siguiente funcion usando foldr. (No tan facil).
zip :: [a] -> [b] -> [(a, b)]
zip [] [] = []
zip (x : xs) (y : ys) = (x, y) : zip xs ys
-}

-- Relacion entre recursion estructural y primitiva --
--1. Definir foldr en terminos de recr. (Facil).--
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr f z []     = z
recr f z (x:xs) = f x xs (recr f z xs)

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f z xs= recr (\x xs r -> f x xs) z xs 

--2. Definir recr en terminos de foldr. (No tan facil). Idea: devolver una tupla con una copia de la lista original.--
