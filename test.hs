chain :: (Integral a) => a -> [a]  
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd n  =  n:chain (n*3 + 1) 

numLongChains :: Int  
numLongChains = length (filter isLong (map chain [1..100]))  
    where isLong xs = length xs > 15  

firstBiggerThan :: Int -> Int
firstBiggerThan n = head (filter (\x -> length (chain x) > n) [626331..])