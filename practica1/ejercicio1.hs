{-Considerar las siguientes definiciones de funciones:

------------------------------------------------------
- max2 (x, y)   | x >= y = x
                | otherwise = y

Currificada:
- max2 :: Float -> Float -> Float
- max2 x y  | x >= y = x
            | otherwise = y

------------------------------------------------------

- normaVectorial (x, y) = sqrt (x^2 + y^2)

Currificada:
- normaVectorial :: Float -> Float -> Float
- normaVectorial x y = sqrt (x^2 + y^2)

------------------------------------------------------

- subtract :: float -> float -> float
- subtract = flip (-)

------------------------------------------------------

- predecesor :: float -> float -> float
- predecesor = subtract 1

------------------------------------------------------

- evaluarEnCero :: (float -> a) -> a
- evaluarEnCero = \f -> f 0

------------------------------------------------------

- dosVeces :: (a -> a) -> a -> a
- dosVeces = \f -> f . f

------------------------------------------------------

- flipAll = map flip

- flipRaro = flip flip

i. Cuál es el tipo de cada función? (Suponer que todos los números son de tipo Float).
ii. Indicar cuáles de las funciones anteriores no están currificadas. Para cada una de ellas, definir la función currificada correspondiente. Recordar dar el tipo de la función.
