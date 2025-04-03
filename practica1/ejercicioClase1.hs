-- Aplicacion Parcial --
prod :: Int -> Int -> Int
prod x y = x * y
doble x = prod 2 x
doble' = prod 2

--Con esta idea en mente definir

-- Nota: No funciona con notacion infija, osea en el medio. Siempre el segundo arguemento va al final
triple :: Float -> Float
triple = (*) 3

esMayorDeEdad :: Int -> Bool
esMayorDeEdad = (<) 17 

--------------------------------------------------
--Funciones útiles, implementar

-- (.) Que compone dos funciones

composicion :: (b -> c) -> (a -> b) -> a -> c
composicion = \g f x -> g (f x)
--composicion g f x = g (f x)

-- (flip) que invierte argumentos

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' = \f x y -> f y x
--flip' f x y = f y x

-- ($) que aplica una función a un argumento

aplicar :: (a -> b) -> a -> b
aplicar f = f  
--a veces no hace falta poner el argumento, haskell deduce que falta uno y cuando lo pones va al fondo
--aplicar f = \x -> f x

-- (const) que dado un valor retorna una funcion constante que devuevle siempre ese valor. Ej: const 5 ‘‘casa’’ devuelve 5

const' :: a -> b -> a
const' = \a b-> a

--------------------------------------------------
-- Que hace flip ($) 0 --
--Flip le da vuelta los argumentos a $, entonces aplica una funcion que se ponga de argumento y se aplica con 0
--tresMas0 = flip ($) 0 (3+)
-- ($) (3+) 0 = 3

--que hace (==0) . (flip mod 2)--
-- ((==0) flip mod 2) x -> ((==0) flip mod 2 x) -> ((==0) mod x 2) -> (mod x 2) ==0 
-- Es decir ve si el numero que pasamos es par 
--------------------------------------------------
--Funciones de alto orden--
--Generalizar la funcion maximo, minimo y lista mas corta

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun _ [x] = x
mejorSegun f (x:xs) = if f x rec then x else rec
                    where rec = (mejorSegun f xs) --de recursion

listaMasCorta :: [[a]] -> [a]
listaMasCorta = \xss -> mejorSegun (\xs ys-> length xs < length ys) xss

--------------------------------------------------
--Definir usando filter--
--filter :: (a -> Bool) -> [a] -> [a]

deLongitudN :: Int -> [[a]] -> [[a]]
deLongitudN = \n xss -> filter (\xs -> length xs == n) xss

--Dados un numero n y una lista de funciones, deja las funciones que al aplicarlas a n dan n
soloPuntosFijosEnN :: Int -> [Int->Int] -> [Int->Int]
soloPuntosFijosEnN = \n fs -> filter (\f -> f n == n) fs

--------------------------------------------------
--Definir usando map--
--map :: (a -> b) -> [a] -> [b]

--Dada una lista de strings, devuelve una lista con cada string dado vuelta y la lista completa dada vuelta.
reverseAnidado :: [[Char]] -> [[Char]]
reverseAnidado = reverse . (map reverse)
--reverseAnidado = (reverse . map reverse) xs
--reverseAnidado = reverse (map reverse xs)

--Dada una listade enteros, devuelve una lista con los cuadrados de los numeros pares y los impares sin modificar.
paresCuadrados :: [Int] -> [Int]
paresCuadrados = map (\x -> if even x then x*x else x)

--------------------------------------------------
--foldr--
--foldr :: (a -> b -> b) -> b -> [a] -> b
--foldr _ z [] = z
--foldr f z (x:xs) = f x (foldr f z xs)
-- ->foldr f z xs = f x1 (f x2 (f x3 z))

filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = foldr (\x r -> if p x then x:r else r) [] xs 

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x r -> (f x):r) [] xs

--Nota, puede sacarte el xs pero por claridad lo voy a dejar

--------------------------------------------------
--Definir una expresion equivalente a las siguiente utilizando map y filter --

listaComp' :: (a -> Bool) -> (a -> b) -> [a] -> [b]
listaComp' p f xs = [f x | x <- xs, p x]

listaComp :: (a -> Bool) -> (a -> b) -> [a] -> [b]
listaComp = \p f -> map f . filter p