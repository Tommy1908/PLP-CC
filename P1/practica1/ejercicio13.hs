--Ejercicio 13
--Dado el tipo AB a del ejercicio 12:

data AB a = Nil | Bin (AB a) a (AB a) deriving Show

foldAB :: b -> (b -> a -> b -> b) -> AB a -> b
foldAB fNil fBin ab = case ab of
    Nil         -> fNil
    (Bin i r d) -> fBin (rec i) r (rec d)
    where
        rec = foldAB fNil fBin

recAB :: b -> (AB a -> b-> a -> b -> b) -> AB a -> b
recAB fNil fBin ab = case ab of
    Nil         -> fNil
    (Bin i r d) -> fBin ab (rec i) r (rec d)
    where
        rec = recAB fNil fBin

--i. Definir las funciones ramas (caminos desde la raíz hasta las hojas), cantHojas y espejo.

ramas :: AB a -> [[a]]
ramas = recAB [] (\(Bin i _ d) recI r recD -> if esNil i && esNil d then [[r]] else (if esNil i then [] else map (r:) recI) ++ (if esNil d then [] else map (r:) recD))

esNil :: AB a -> Bool
esNil ab = case ab of
    Nil -> True
    _   -> False

arbol = (Bin (Bin (Bin Nil 1 Nil) 2 (Bin Nil 3 Nil)) 4 (Bin (Bin Nil 5 Nil) 6 (Bin Nil 7 Nil)) )

cantHojas :: AB a -> Int
cantHojas = foldAB 0 (\recI r recD -> if recI == 0 && recD == 0 then 1 else recI + recD)

espejo :: AB a -> AB a
espejo = foldAB Nil (\recI r recD -> Bin recD r recI)

--ii. Definir la función mismaEstructura :: AB a -> AB b -> Bool que, dados dos árboles, indica si éstos tienen la misma forma, independientemente del contenido de sus nodos.
--Pista: usar evaluación parcial y recordar el ejercicio 7. Pista*: paso 1 cuatri entero, asi que no lo recuerdo

mismaEstructura :: AB a -> AB b -> Bool
mismaEstructura = foldAB (\ab2 -> esNil ab2) (\recI r recD ab2 -> not (esNil ab2) && recI (getI ab2) && recD (getD ab2)) 

getI :: AB a -> AB a
getI (Bin i _ _) = i 
getD :: AB a -> AB a
getD (Bin _ _ d) = d

arbol2 = (Bin (Bin (Bin Nil 7 Nil) 6 (Bin Nil 5 Nil)) 4 (Bin (Bin Nil 3 Nil) 2 (Bin Nil 1 Nil)))
arbol3 = (Bin (Bin Nil 6 (Bin Nil 5 Nil)) 4 (Bin (Bin Nil 3 Nil) 2 (Bin Nil 1 Nil)))