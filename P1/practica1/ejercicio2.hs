--i. Definir la función curry, que dada una función de dos argumentos, devuelve su equivalente currificada.

--Pasar de una funcion que toma una tupla a una que toma parametros sueltos
curry' :: ((a,b) -> c) -> a -> b -> c
curry' f x y = f (x,y)
-- Alternativas:
-- curry f = \x -> \y -> f (x,y)
-- curry f = \x y -> f (x,y)

--ii. Definir la función uncurry, que dada una función currificada de dos argumentos, devuelve su versión no currificada equivalente. Es la inversa de la anterior.
uncurry' :: (a -> b -> c) -> (a,b) -> c
uncurry' f (x,y) = f x y 

--iii. Se podría definir una función curryN, que tome una función de un número arbitrario de argumentos y devuelva su versión currificada?
--Sugerencia: pensar cuál sería el tipo de la función.

--No, no se puede porque es imposible tipar algo infinito.

