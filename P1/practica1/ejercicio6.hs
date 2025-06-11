------------------------- Ejercicio 6 -------------------------
-- El siguiente esquema captura la recursión primitiva sobre listas

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z []       = z
recr f z (x : xs) = f x xs (recr f z xs)

--a. Definir la función sacarUna :: Eq a => a -> [a] -> [a], que dados un elemento y una lista devuelve el
--resultado de eliminar de la lista la primera aparición del elemento (si está presente).

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna e xs = recr (\x xs r -> if e==x then xs else x:r) [] xs

--Nota: x es el valor actual, xs lo que queda sin paso recursivo, r es lo que queda pero continuando recursion

--b. Explicar por qué el esquema de recursión estructural (foldr) no es adecuado para implementar la función
--sacarUna del punto anterior.

{-Porque para cortar la recursion yo devuelvo xs, eso no se podian antes, pero aca yo puedo hacer cuaquier cosa con xs
  Mientras no se otro llamado recursivo. -}

--c. Definr la función insertarOrdenado :: Ord a => a -> [a] -> [a] que inserta un elemento en una lista
--ordenada (de manera creciente), de manera que se preserva el ordenamiento

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado n = recr(\x xs r -> if n > x && xs /= [] then x:r else n:x:xs) [] 