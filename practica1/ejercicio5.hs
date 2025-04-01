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

entrelazar :: [a] -> [a] -> [a]
entrelazar (x:xs) (y:ys) = (if (null ys) then x: entrelazar xs [] else x: (head ys) : entrelazar xs (tail ys)) [] 