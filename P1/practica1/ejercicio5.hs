{-Considerar las siguientes funciones:
elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares [] = []
elementosEnPosicionesPares (x:xs) = if null xs
                                    then [x]
                                    else x : elementosEnPosicionesPares (tail xs)
No es estructural
-}



{-
entrelazar :: [a] -> [a] -> [a]
entrelazar [] = id
entrelazar (x:xs) = \ys -> if null ys
                           then x : entrelazar xs []
                           else x : head ys : entrelazar xs (tail ys)

Indicar si la recursión utilizada en cada una de ellas es o no estructural. Si lo es, reescribirla utilizando foldr.
En caso contrario, explicar el motivo.
-}
--Entrelazar es recursion estructural porque entrelazar xs se llama correctamente y nunca se usa el xs para otra cosa,
--La recursion es sobre xs, no ys por eso es válido

entrelazar :: [a] -> [a] -> [a]
entrelazar = foldr (\x r -> \ys -> if null ys then x: r [] else x:head ys:r (tail ys)) id

{-
[1,2] [5,6,7,8]
1:5:((fold f (id) xs) ys)
1:5:2:6:((fold f (id) []) ys) xs=[]
1:5:2:6:(id ys)

[1,2,3,4] [5,6]
1:5((fold f (id) xs) ys)
1:5:3:6:((fold f (id) xs) []) ys=[]
1:5:3:6:3:((fold f (id) xs) [])
1:5:3:6:3:4:((fold f (id) []) []) xs=[]
1:5:3:6:3:4:(id ys) ys=[]
    -}