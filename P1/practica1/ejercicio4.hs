--I. Definir la función permutaciones :: [a] -> [[a]], que dada una lista devuelve todas sus permutaciones. Se recomienda utilizar concatMap :: (a -> [b]) -> [a] -> [b], y también take y drop.



--Ejemplo de uso de concatMap
--ghci> concatMap (\x -> [x, x*2]) [1,2,3,4]
--[1,2,2,4,3,6,4,8]
--ghci> concatMap (\x -> [x, 4]) [1,2,3,4]
--[1,4,2,4,3,4,4,4]
--ghci> concatMap (\x -> [x, 5]) [1,2,3,4]
--[1,5,2,5,3,5,4,5]
--ghci> concatMap (\x -> [x, 5,7]) [1,2,3,4]
--[1,5,7,2,5,7,3,5,7,4,5,7]
--ghci> concatMap (\c -> [c, c]) "hola"
--"hhoollaa"
--ghci> concatMap (\x -> [x, -x]) [4,7]
--[4,-4,7,-7]


--permutaciones' :: [a] -> [[a]]
--permutaciones' [] = [[]]
--permutaciones' xs = concatMap (\i -> map ((xs !! i):) (permutaciones' (take i xs ++ drop (i+1) xs))) [0..length xs - 1]

permutaciones :: [a] -> [[a]]
permutaciones = foldr (\y res -> concatMap (permutarElem y) res) [[]]
                where permutarElem x l = [ (take n l) ++ [x] ++ (drop n l) | n <- [0..length l]]

partes :: [a] -> [[a]]
partes = foldr (\x rec -> (map (x :) rec) ++ rec) [[]]

prefijos :: [a] -> [[a]]
prefijos xs = [take i xs | i <- [0..length xs]]

sublistas :: [a] -> [[a]]
sublistas xs = [] : [take j sufijo | sufijo <- sufijos xs, j <- [1..length sufijo]] 
         where sufijos [] = []
                     sufijos (x:xs) = (x:xs) : sufijos xs


--No los hice yo, tengo q repasarlos