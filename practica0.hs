------------------------- Ejercicio 1 -------------------------
{- Dar el tipo y describir el comportamiento de las siguientes funciones del módulo Prelude de Haskell:
null head tail init last take drop (++) concat reverse elem
-}

-- null :: [a] -> Bool
    --Recibe una lista y devuelve True si la lista es vacía, False en caso contrario.

-----

-- head :: [a] -> a
    -- Recibe una lista y devuelve el primer elemento de la lista

-- last :: [a] -> a
    -- Recibe una lista devuelve el ultimo elemento de la lista

-- tail :: [a] -> [a]
    -- Recibe una lista y la devuelve sin el primer elemento

-- init :: [a] -> [a]
    -- Recibe una lista y la devuelve sin el último elemento

----- Estos 4 tienen problemas si la lista esta vacia, se indeterminan

-- take :: Int -> [a] -> [a]
    -- Recibe un entero n y una lista y devuelve una lista con los primeros n elementos de la lista

-- drop :: Int -> [a] -> [a]
    -- Recibe un entero n y una lista y devuelve una lista sin los primeros n elementos de la lista

-- [a] ++ [a] -> [a]
    -- Recibe dos listas y devuelve una lista con los elementos de la primera lista seguidos por los elementos de la segunda lista

-- concat :: [[a]] -> [a]
    -- Recibe una lista de listas y devuelve una lista con los elementos de todas las listas concatenados

-- reverse :: [a] -> [a]
    -- Recibe una lista y devuelve una lista con los elementos de la lista en orden inverso

-- elem :: a -> [a] -> Bool
    -- Recibe un elemento y una lista y devuelve True si el elemento está en la lista, False en caso contrario

------------------------- Ejercicio 2 -------------------------
--Definir las siguientes funciones:
--a. valorAbsoluto :: Float → Float, que dado un número devuelve su valor absoluto.

valorAbsoluto :: Float -> Float
valorAbsoluto x | x < 0 = -x
                | otherwise = x

--b. bisiesto :: Int → Bool, que dado un número que representa un año, indica si el mismo es bisiesto.

bisiesto :: Int -> Bool
bisiesto x | mod x 4 == 0 && mod x 100 /= 0 = True
           | mod x 100 == 0 && mod x 400 == 0 = True
           | otherwise = False

bisiesto2 :: Int -> Bool
bisiesto2 x | (mod x 100 == 0) = (mod x 400 == 0)
            | otherwise = (mod x 4 == 0)

--c. factorial :: Int → Int, definida únicamente para enteros positivos, que computa el factorial.

factorial :: Int -> Int
factorial 0 = 0
factorial 1 = 1
factorial x = x * (factorial x-1)

--d. cantDivisoresPrimos :: Int → Int, que dado un entero positivo devuelve la cantidad de divisores primos

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos n = cantDivisoresPrimosAux n n 0

--                       numero indice cantidad
cantDivisoresPrimosAux :: Int -> Int -> Int -> Int
cantDivisoresPrimosAux n 1 x = x + 1
cantDivisoresPrimosAux n i x | mod n i == 0 = cantDivisoresPrimosAux n (i-1) x + 1
                             | otherwise = cantDivisoresPrimosAux n (i-1) x 

-- Podria mejorarse la eficiencia

------------------------- Ejercicio 3 -------------------------
{-Contamos con los tipos Maybe y Either definidos como sigue:
data Maybe a = Nothing | Just a
data Either a b = Left a | Right b -}

--a. Definir la función inverso :: Float → Maybe Float que dado un número devuelve su inverso multiplicativo si está definido, o Nothing en caso contrario.

inverso :: Float -> Maybe Float
inverso 0 = Nothing
inverso x = Just (1/x)

--b. Definir la función aEntero :: Either Int Bool → Int que convierte a entero una expresión que puede ser booleana o entera. En el caso de los booleanos, el entero que corresponde es 0 para False y 1 para True.

aEntero :: Either Int Bool -> Int
aEntero (Left x) = x
aEntero (Right True) = 1
aEntero (Right False) = 0

------------------------- Ejercicio 4 -------------------------
-- Definir las siguientes funciones sobre listas:

-- a. limpiar :: String → String → String, que elimina todas las apariciones de cualquier carácter de la primera cadena en la segunda. Por ejemplo, limpiar ‘‘susto’’ ‘‘puerta’’ evalúa a ‘‘pera’’. Nota: String es un renombre de [Char]. La notación ‘‘hola’’ es equivalente a [‘h’,‘o’,‘l’,‘a’] y a ‘h’:‘o’:‘l’:‘a’:[].

limpiar :: String -> String -> String
limpiar _ [] = []
limpiar [] y = y
limpiar (x:xs) y | elem x y = limpiar xs (quitarTodos x y)
                 | otherwise = limpiar xs y

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos x (y:ys)| x == y = quitarTodos x ys
                    | otherwise = [y] ++ quitarTodos x ys
-- b. difPromedio :: [Float] → [Float] que dada una lista de números devuelve la diferencia de cada uno con el promedio general. Por ejemplo, difPromedio [2, 3, 4] evalúa a [-1, 0, 1].

difPromedio :: [Float] -> [Float]
difPromedio [] = []
difPromedio x =  difPromedioAux x promedio
            where promedio = ((sum x) / (fromIntegral (length x)))

difPromedioAux :: [Float] -> Float -> [Float]
difPromedioAux [] _ = []
difPromedioAux (x:xs) p = (x-p) : difPromedioAux xs p

-- c. todosIguales :: [Int] → Bool que indica si una lista de enteros tiene todos sus elementos iguales.

todosIguales :: [Int] -> Bool
todosIguales [] = True -- Solo para evitar errores
todosIguales [_] = True -- Solo para evitar errores
todosIguales (n:xs) = todosIgualesAux xs n

todosIgualesAux :: [Int] -> Int -> Bool
todosIgualesAux [x] n = x == n
todosIgualesAux (x:xs) n = x == n && todosIgualesAux xs n