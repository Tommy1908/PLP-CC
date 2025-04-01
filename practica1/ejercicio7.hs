------------------------- Ejercicio 7 ------------------------------------------
-- Definir las siguientes funciones para trabajar sobre listas, y dar su tipo --
-- Todas ellas deben poder aplicarse a listas finitas e infinitas             --
--------------------------------------------------------------------------------

--1.mapPares, una versión de map que toma una función currificada de dos argumentos y una lista de pares de valores, 
--  y devuelve la lista de aplicaciones de la función a cada par. Pista: recordar curry y uncurry

mapPares :: (a -> b -> (a,b)) -> [(a,b)] -> [(a,b)]
mapPares _ [] = []
mapPares f ((a,b):xs) = (f a b): mapPares f xs 

{--2.armarPares, que dadas dos listas arma una lista de pares que contiene, en cada posición, el elemento
correspondiente a esa posición en cada una de las listas. Si una de las listas es más larga que la otra,
ignorar los elementos que sobran (el resultado tendrá la longitud de la lista más corta). 
Esta función en Haskell se llama zip. Pista: aprovechar la currificación y utilizar evaluación parcial.-}

armarPares :: [a] -> [b] -> [(a,b)]
armarPares [] _ = []
armarPares _ [] = []
armarPares (x:xs) (y:ys) = (x,y):(armarPares xs ys)