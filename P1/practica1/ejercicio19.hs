--Ejercicio 19
--Una tripla pitagórica es una tripla (a, b, c) de enteros positivos tal que a^2 + b^2 = c^2.
--La siguiente expresión intenta ser una definición de una lista (infinita) de triplas pitagóricas:
pitagoricas :: [(Integer, Integer, Integer)]
pitagoricas = [(a, b, c) | a <- [1..], b <-[1..], c <- [1..], a^2 + b^2 == c^2]
--Explicar por qué esta definición no es útil. Dar una definición mejor.
--No es util porque no corre, se cuelga
--Yo calculo que porque usa 3 generadores infinitos y segun las reglas no se podia 
--y chatgpt opina que "Un solo generador infinito por vez→ Si ponés más de uno, no termina nunca (infinito × infinito = muerte)."  (un capo)

pit :: [(Integer, Integer, Integer)]
pit = [(a,b,c) | c <- [1..], a <- [1..c], b <- [a..c], a^2 + b^2 == c^2]
--si b va de 1..c tiene repetidos. qcyo asi anda