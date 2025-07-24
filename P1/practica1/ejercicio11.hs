--Ejercicio 11
--Definir el esquema de recursión estructural para el siguiente tipo:
data Polinomio a = X | Cte a | Suma (Polinomio a) (Polinomio a)| Prod (Polinomio a) (Polinomio a)
--Luego usar el esquema definido para escribir la función evaluar :: Num a => a -> Polinomio a -> a 
--que, dado un número y un polinomio, devuelve el resultado de evaluar el polinomio dado en el número dado

--No pide fold asi que hacemos pattern matchin para hacer mas facil el ej 12 de la guia 2

evaluar :: Num a => a -> Polinomio a -> a
evaluar n X          = n
evaluar n (Cte v)    = v
evaluar n (Suma a b) = (evaluar n a) + (evaluar n b)
evaluar n (Prod a b) = (evaluar n a) * (evaluar n b)