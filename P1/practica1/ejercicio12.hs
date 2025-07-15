--Ejercicio 12
--Considerar el siguiente tipo, que representa a los árboles binarios:
data AB a = Nil | Bin (AB a) a (AB a)

--i. Usando recursión explícita, definir los esquemas de recursión estructural (foldAB) y primitiva (recAB), y dar sus tipos.
foldAB :: b -> (b -> a -> b -> b) -> AB a -> b
foldAB fNil fBin ab = case ab of
    Nil         -> fNil
    (Bin i r d) -> fBin (rec i) r (rec d)
    where
        rec = foldAB fNil fBin

recAB :: b -> (AB a -> b-> a -> b -> b) -> AB a -> b
recAB fNil fBin ab = case ab of
    Nil         -> fNil
    (Bin i r d) -> fBin ab (rec i) r (rec d)
    where
        rec = recAB fNil fBin

--ii. Definir las funciones esNil, altura y cantNodos (para esNil puede utilizarse case en lugar de foldAB o recAB).

esNil :: AB a -> Bool
esNil ab = case ab of
    Nil -> True
    _   -> False

altura :: AB a -> Int
altura = foldAB 0 (\recI x recD -> 1 + (max recI recD))

cantNodos :: AB a -> Int
cantNodos = foldAB 0 (\recI x recD -> 1 + recI + recD)

--iii. Definir la función mejorSegún :: (a -> a -> Bool) -> AB a -> a, análoga a la del ejercicio 3, para árboles.
--Se recomienda definir una función auxiliar para comparar la raíz con un posible resultado de la recursión para un árbol que puede o no ser Nil.
--Asumo que no hay arbol vacio

mejorSegun :: (a -> a -> Bool) -> AB a -> a
mejorSegun f (Bin i r d) = foldAB r (\recI x recD -> compararCon f (compararCon f x recI) recD) (Bin i r d)

compararCon :: (a -> a -> Bool) -> a -> a -> a
compararCon f r h = if f r h then r else h

arbol= Bin (Bin Nil 3 Nil) 4 (Bin (Bin Nil 6 Nil) 8 Nil)
mayorNodo a b = a>=b
menorNodo a b = a<=b

--iv. Definir la función esABB :: Ord a => AB a -> Bool que chequea si un árbol es un árbol binario de búsqueda.
--Recordar que, en un árbol binario de búsqueda, el valor de un nodo es mayor o igual que los valores que aparecen en el subárbol izquierdo y es estrictamente menor que los valores que aparecen en el subárbol derecho.

--Asume que no es Nil
getRoot :: AB a -> a
getRoot (Bin i r d) = r

esABB :: Ord a => AB a -> Bool
esABB = recAB True (\(Bin i r d) recI x recD -> if esNil i then True else (getRoot i) <= r && if esNil d then True else r < (getRoot d) && recI && recD)

--v. Justificar la elección de los esquemas de recursión utilizados para los tres puntos anteriores.
--Because yes
--En los primeros 3 era muy sensillo y no habia necesidad de ver mas alla de la estructura, por lo tanto no uso rec
--Mejor segun es polemico, creo que lo que se esperaba era usar recAB, salio asi y anda, pero habia quilombo con los tipos, por el nil y bla bla y usar un either o algo asi
--Ni idea a esta altura no me sale jajaja asi que la otra opcion era si uesar recAB y hacer comparaciones como las que hice en esABB
--esABB usa recursion primitiva porque accedemos a ab que es el arbol, digamos que es como acceder a la lista en vez de usar solo el rec. eso para chear que no sea nil lo que vamos a comparar, eso mismo podriamos haber hecho en mejorsegun