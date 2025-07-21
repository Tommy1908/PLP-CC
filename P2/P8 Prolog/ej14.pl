%Ejercicio 14 ⋆
%Un cuadrado semi-mágico es una matriz cuadrada de naturales (incluido el cero) donde todas las filas de la matriz suman lo mismo. Por ejemplo:
%   1 3 0
%   2 2 0 todas las filas suman 4
%   1 1 2
%Representamos la matriz como una lista de filas, donde cada fila es una lista de naturales. El ejemplo anterior se representaría de la siguiente manera: [[1,3,0],[2,2,0],[1,1,2]]

%i. Definir el predicado cuadradoSemiMágico(+N, -XS). El predicado debe ir devolviendo matrices (utilizando la representación antes mencionada), que sean cuadrados semi-mágicos de dimensión N*N. Dichas matrices deben devolverse de manera ordenada: primero aquellas cuyas filas suman 0, luego 1, luego 2,etc. 
%No es necesario utilizar la técnica Generate & Test.
%Ejemplo: cuadradoSemiMágico(2,X). devuelve:
%   X = [[0, 0], [0, 0]] ;
%   X = [[0, 1], [0, 1]] ;
%   X = [[0, 1], [1, 0]] ;
%   X = [[1, 0], [0, 1]] ;
%   X = [[1, 0], [1, 0]] ;
%   X = [[0, 2], [0, 2]] ;
%etc.

desde(X, X).
desde(X, Y) :- N is X+1, desde(N, Y).

% Predicado principal
cuadradoSemiMagico(N, XS) :- desde(0,S), matriz_suma(N, S, N, XS).

% Genera una matriz de N filas, cada fila suma S, itera con I
matriz_suma(_, _, 0, []).
matriz_suma(N, S, I, [L|LS]) :- I>0, length([L|LS], I), length(L,N), lista_suma_aux(L, S), I1 is I-1, matriz_suma(N,S,I1,LS).

lista_suma_aux([], 0).
lista_suma_aux([X|Xs], S) :- between(0, S, X), S1 is S - X, lista_suma_aux(Xs, S1).


%ii. Definir utilizando Generate & Test el predicado cuadradoMagico(+N, -XS), que instancia XS con cuadrados cuyas filas y columnas suman todas un mismo valor.

%desde(0,S), matriz_suma(N, S, N, XS). Es cuadrado semi magico, pero necesitaba tener el desde para poder tener el S.
cuadradoMagico(N, XS):- desde(0,S), matriz_suma(N, S, N, XS), N1 is N-1, columnasSuman(XS,S).


grab(0,[X|_],X).
grab(N,[_|XS],E):- N1 is N-1, grab(N1,XS,E).

%Se supone que es para una matriz cuadrada asi que hay N listas y quiero el elemento N
sumaNesimoElementoDeCadaLista(_,[],0).
sumaNesimoElementoDeCadaLista(N,[X|XS],R):- grab(N,X,RX), sumaNesimoElementoDeCadaLista(N,XS,RXS), R is RX + RXS.

columnasSuman(XS,S):- length(XS,N), N1 is N-1, between(0,N1,I), sumaNesimoElementoDeCadaLista(I,XS,R), R =:= S.