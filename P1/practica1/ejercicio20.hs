--Ejercicio 20
--Escribir la función listasQueSuman :: Int -> [[Int]] que, dado un número natural n, devuelve todas las listas de enteros positivos (es decir, mayores o iguales que 1) cuya suma sea n. 
--Para este ejercicio se permite usar recursión explícita. Pensar por qué la recursón utilizada no es estructural. (Este ejercicio no es de generación infinita, pero puede ser útil para otras funciones que generen listas infinitas de listas).

listasQueSuman :: Int -> [[Int]]
listasQueSuman 0 = [[]]
listasQueSuman n = [ x:xs | x <- [1..n], xs <- listasQueSuman (n-x)]
--Pero en la comprensión, xs ← [[]] → te da xs = [] 
    --qcyo creele a chat gpt




--listasQueSuman2 :: Int -> [[Int]]
--listasQueSuman2 n
--  | n < 1     = []                -- Caso base: si n < 1, no hay listas válidas
--  | otherwise = listasQueSuman' n n
--  where
--    listasQueSuman' n maxVal
--      | n == 0    = [[]]          -- Caso base: suma 0 se logra con la lista vacía
--      | n < 0     = []            -- Caso base: suma negativa no es posible
--      | otherwise = concat [ [x:xs] | x <- [1..min n maxVal], xs <- listasQueSuman' (n - x) x ]