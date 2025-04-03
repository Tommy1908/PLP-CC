maximoL :: Ord a => [a] -> a
maximoL (x:xs) = foldr max x xs

--Caso base es x y le paso la lista entera
--Pero foldr1 al comparar con todos los elementos de la lista sin neceistar un caso base extra
--Aca la respuesta es un elemento del tipo de la lista (un elemento de la lista) y se  rompe en el caso de lista vacia
--al llegar a [a] devuelve a

maximoL' :: Ord a => [a] -> a
maximoL' = foldr1 max

----------------------------------------------------------------------------------------------------
-----Recursicion estructural-----
{-
take Int -> ([a] -> [a])
take n []
take n (x:xs) = if n == 0 then [] else x : take (n-1) xs
-}
--No es recursion estructral!! porque take(n-1) /= take(n) entonces no es estructural, no es la misma funcion
--Por evaluacion lazy, tomaba primero take n y despues la lista. Al menos sintacticamente, no cumple.
--Para solucionarlos
{-
take' [a] -> (Int -> [a])
take' [] n = []
take' (x:xs) n = if n == 0 then [] else x : take xs (n-1)
-}
--Ahi aunque parezca lo mismo, take toma la lista y luego (n-1) y por eso cumple take xs, y es estructural

{-
take3 [a] -> (Int -> [a])
take3 [] = const [] --(\n -> []) es lo mismo, dice que tiene que recibir un n, pero que lo ignores
take3 (x:xs) = (\n -> if n==0 then [] else x:take3 xs (n-1))
-}
--aca damos un paso mas, hacia foldr

{-
take4 [a] -> (Int -> [a])
take4 = foldr (\x rec -> (\n -> if n==- then [] else x: rec (n-1))) (const [])
-}

--take4 [a] -> (Int -> [a])
--take4 = foldr (\x r -> (\n -> if n==- then [] else x: r (n-1))) (const [])
--b, el tipo de salida, es el mismo q el recursivo. Mi funcion le pasa un n por separado y por eso usamos el const []
--take tiene una funcion a->b->b, y mi b es (\n -> if n==- then [] else x: rec (n-1)), que es de tipo int->[a], 
--mi caso base tiene que ser Int -> [a]

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

--sublistaQueMasSuma :: [Int] -> [Int]  --Partes(lista)
--sublistaQueMasSuma = recr(\x xs res -> )

--prefijo q mas suma: la cabeza mas alguna parte de la lista

--No entendi
--Como generar todas las sublistas (y porque funciona bien)

--------------------------------------------------------------------------
--Generacion infinita
pares :: [(Int,Int)]
pares = [p|k<-[0..],p<-paresQueSuman k]

paresQueSuman :: Int -> [(Int,Int)]
paresQueSuman k = [(i,k-i)|i<-[0..]]