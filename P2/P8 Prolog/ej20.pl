%Ejercicio 20 ⋆
%Un número poderoso es un número natural m tal que por cada número primo p que divide a m, p^2 también divide a m.
%Definir el predicado próximoNumPoderoso(+X,-Y) que instancie en Y el siguiente número poderoso a partir de X. Por ejemplo:
%   ?- próximoNumPoderoso(20,Y).
%       Y = 25;
%       false.
%   ?- próximoNumPoderoso(8,Y).
%       Y = 9;
%       false.
%Notar que, como en el último caso, si X ya es un número poderoso, Y no debe instanciarse con el valor de X, sino con el siguiente número poderoso.

%divisores(N,D):- between(1, N, D), (N mod D) =:= 0.

%+N
esDivisor(N,D):- D \= 0, (N mod D) =:= 0.

%+P
esPrimo(P):- P > 1, P1 is P-1, not((between(2,P1,D), (P mod D) =:= 0)).

%+N +I=1
divisoresPrimos(N,I,[]):- I > N.
divisoresPrimos(N,I,[I|XS]):- I =< N, esDivisor(N,I), esPrimo(I), I1 is I + 1, divisoresPrimos(N,I1,XS).
divisoresPrimos(N,I,XS):- I =< N, not((esDivisor(N,I), esPrimo(I))), I1 is I + 1, divisoresPrimos(N,I1,XS).
%Si no agregas el not, se rompe porque si no cumple es primo o es divisor no sabe que hacer

pow(X,XX):- XX is X*X.

proximoNumPoderoso(X,Y):- Z is X+1, divisoresPrimos(Z,1,Div), esPoderoso(Z,Div), Y=Z. 
proximoNumPoderoso(X,Y):- Z is X+1, divisoresPrimos(Z,1,Div), not(esPoderoso(Z,Div)), proximoNumPoderoso(Z,Y). 

esPoderoso(_,[]).
esPoderoso(N,[X|XS]):- esDivisor(N,X), pow(X,XX), esDivisor(N,XX), esPoderoso(N,XS).


%%Esto no estaba pero quiero ver, que genere numeros poderosos. 
%poderosos(X):- desde(1,X), divisoresPrimos(X,1,Div), esPoderoso(X, Div).
%No muy efectiva por usar el desde y no aprovechar el proxNumPoderoso

%desde(X,X).
%desde(X,Y):- N is X + 1, desde(N,Y).

poderosos(X,X):- X >= 1.
poderosos(X,Y):- proximoNumPoderoso(X,Z), poderosos(Z,Y).
