sum' :: Num a => [a] -> a
--sum' xs = folrd (+) 0 xs
sum' = foldr (+) 0

elem' :: Eq a => a -> [a] -> Bool
elem' e xs = foldr (\x rec -> x == e || rec) False xs

masmas :: [a] -> [a] -> [a]
masmas xs ys = foldr (:) ys xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' f xs = foldr (\x rec -> if (f x) then x:rec else rec) [] xs

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x rec -> f x:rec) [] xs


mejorSegun :: Ord a => (a -> a -> Bool) -> [a] -> a
mejorSegun f xs = foldr1 (\x rec -> if f x rec then x else rec) xs 


permutaciones