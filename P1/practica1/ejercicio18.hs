--Ejercicio 18
--Definir la lista infinita paresDeNat::[(Int,Int)], que contenga todos los pares de números naturales: (0,0),(0,1), (1,0), etc.

paresDeNat::[(Int,Int)]
paresDeNat = [(x, y) | n <- [0..], x <- [0..n], let y = n - x ]  --n es la suma que va incrementando y X e Y tienen que dar esa suma
--paresDeNat = [(x, y-x) | y <- [0..], x <- [0..y]]
--paresDeNat = concatMap (\n -> [(x, n-x) | x <- [0..n]]) [0..]
