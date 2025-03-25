--merge :: [a] -> Int -> Int -> Int -> [a]
--merge (x:xs) p q r = 
--    where nl = q - (p + 1) --Longitud de subarray izq
--          nr = r - q
--          l = subsec (x:xs) p q 
--          r = subsec (x:xs) (q+1) r

subsec :: [a] -> Int -> Int -> [a]
subsec [] _ _ = []
subsec xs a b = take (b+1-a) (drop a xs)

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