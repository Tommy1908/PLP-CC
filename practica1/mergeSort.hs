--Un ejercicio propuesto en clase

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] [] = [] 
merge [] y = y 
merge x [] = x 
merge (x:xs) (y:ys) = if (x < y) then x : merge xs (y:ys) else y : merge (x:xs) ys

mergeSort :: (Ord a) => [a] -> [a]
mergeSort []  = []
mergeSort [x] = [x]
mergeSort xs  = merge (mergeSort (take mitad xs)) (mergeSort (drop mitad xs)) 
               where mitad = div (length xs) 2