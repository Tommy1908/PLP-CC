------------------------- Ejercicio 9 ------------------------------------------
{-i. Definir y dar el tipo del esquema de recursión foldNat sobre los naturales. Utilizar el tipo Integer de
Haskell (la función va a estar definida sólo para los enteros mayores o iguales que 0).-}

--Yo calculo que es esto que era del teorico
data Nat = Zero | Succ Nat deriving Show

foldNat :: (b) -> (b -> b) -> Nat -> b
foldNat fZero fSucc n = case n of
    Zero   -> fZero
    Succ n -> fSucc (foldNat fZero fSucc n) 

--Estas2 no son de la guia igual
natToInt :: Nat -> Int
natToInt = foldNat 0 (+1)

doble :: Nat -> Nat
doble Zero = Zero
doble (Succ n) = Succ (Succ (doble n))

tres = Succ (Succ (Succ Zero))
--------------------------------


