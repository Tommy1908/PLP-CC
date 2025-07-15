--Ejercicio 17
--Cuál es el valor de esta expresión?
--[ x | x <- [1..3], y <- [x..3], (x + y) `mod' 3 == 0 ]

{- 
X puede ser del 1 al 3, e y puede ser de x a 3, y se calcula que x + y sea divisible por 3
1 + 1
1 + 2 OK
1 + 3 
------ 2 + 1 no esta por eso no aparece el 2
2 + 2
2 + 3 
3 + 3 OK
Asi que los resultados deberian ser [1,3]
-}