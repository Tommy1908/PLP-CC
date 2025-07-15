--Ejercicio 15 ⋆
--i. Definir el tipo RoseTree de árboles no vacíos, con una cantidad indeterminada de hijos para cada nodo.
data RoseTree a = Rose a [RoseTree a] deriving (Show, Eq)
--ii. Escribir el esquema de recursión estructural para RoseTree. Importante escribir primero su tipo.
foldRose :: (a -> [b] -> b) -> RoseTree a -> b  -- es [b] porque cada rosa hijo tiene que ser una recursion
foldRose fRosa (Rose r rs) = fRosa r (map (foldRose fRosa) rs) 
--Para hacer la recursion tenemos que llamar como antes a foldRose y la funcion pero como es una lista hay que usar un map para cada elemento de la lista 

--iii. Usando el esquema definido, escribir las siguientes funciones:
--a) hojas, que dado un RoseTree, devuelva una lista con sus hojas ordenadas de izquierda a derecha, según su aparición en el RoseTree.

hojas :: RoseTree a -> [a]
hojas = foldRose (\r recR -> if null recR then [r] else concat recR)
--Null para ver si es vacio, porque aparentemente para que ande a tendria que ser eq creo

--b) distancias, que dado un RoseTree, devuelva las distancias de su raíz a cada una de sus hojas.

distancias :: RoseTree a -> [Int]
distancias = foldRose (\r recR -> if null recR then [0] else map (+1) (concat recR))
--Las hojas no tiene que sumar para que cuando sea el arbol solo hoja la distancia de la raiz a la hoja sea 0 y luego todo coordine

--c) altura, que devuelve la altura de un RoseTree (la cantidad de nodos de la rama más larga). Si el RoseTree es una hoja, se considera que su altura es 1.

altura :: RoseTree a -> Int
altura = foldRose (\r recR -> if null recR then 1 else maximum(map (+1) recR))

ej1 = Rose 1 []
ej2 = Rose 1 [Rose 2 [], Rose 3 [Rose 4 [], Rose 5 []]]
ej3 = Rose 'a' [Rose 'b' [Rose 'd' [], Rose 'e' []],Rose 'c' [Rose 'f' [Rose 'g' []]],Rose 'h' []]
ej4 = Rose 1 [Rose 2 [], Rose 3 [Rose 4 [], Rose 5 []], Rose 6 []]
