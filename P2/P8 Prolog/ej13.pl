%Ejercicio 13 ⋆
%Definir el predicado coprimos(-X,-Y), que genere uno a uno todos los pares de números naturales coprimos
%(es decir, cuyo máximo común divisor es 1), sin repetir resultados. Usar la función gcd del motor aritmético.

desde(X, X).
desde(X, Y) :- N is X+1, desde(N, Y).

%generarPares(-X, -Y)
generarPares(X,Y) :- desde(0, N), paresQueSuman(N, X, Y).

%paresQueSuman(+N, -X, -Y)
paresQueSuman(N, X, Y) :- between(0, N, X), Y is N-X.

%coprimos(-X, -Y)
coprimos(X, Y) :- generarPares(X,Y), X > 0, Y > 0, 1 =:= gcd(X,Y).

