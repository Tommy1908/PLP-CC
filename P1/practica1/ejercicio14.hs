--Ejercicio 14
--Se desea modelar en Haskell los árboles con información en las hojas (y sólo en ellas). Para esto introduciremos el siguiente tipo:
data AIH a = Hoja a | Bin (AIH a) (AIH a)


--a) Definir el esquema de recursión estructural foldAIH y dar su tipo.
--Por tratarse del primer esquema de recursión que tenemos para este tipo, se permite usar recursión explícita.

foldAIH :: (a -> b) -> (b -> b -> b) -> AIH a -> b
foldAIH fHoja fBin ab = case ab of
    (Hoja x)  -> fHoja x
    (Bin i d) -> fBin (rec i) (rec d)
    where
        rec = foldAIH fHoja fBin

--b) Escribir las funciones altura :: AIH a -> Integer y tamaño :: AIH a -> Integer.
--Considerar que la altura de una hoja es 1 y el tamaño de un AIH es su cantidad de hojas.

altura :: AIH a -> Integer
altura = foldAIH (const 1) (\recI recD -> 1 + (max recI recD))
--               (\x -> 1)
--asumo que el nodo raiz que no tiene datos tambien suma

tamaño :: AIH a -> Integer
tamaño = foldAIH (const 1) (\recI recD -> recI + recD)

ej1 = Hoja 5  -- altura: 1, tamaño: 1
ej2 = Bin (Hoja 1) (Hoja 2)  -- altura: 2, tamaño: 2
ej3 = Bin (Bin (Hoja 1) (Hoja 2)) (Hoja 3)  -- altura: 3, tamaño: 3
ej4 = Bin (Bin (Hoja 1) (Hoja 2)) (Bin (Hoja 3) (Hoja 4))  -- altura: 3, tamaño: 4

