%Considerar las siguientes definiciones:
natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
menorOIgual(X,X) :- natural(X).
%i. Explicar qué sucede al realizar la consulta menorOIgual(0,X).
%%%Se cuelga// Disminuye Y pero nunca llega al caso base porque esta abajo
%ii. Describir las circunstancias en las que puede colgarse un programa en Prolog. Es decir, ejecutarse infinitamente sin arrojar soluciones.
%Si hay recursion y nunca llega al caso base, en este caso esta dado por el orden
%iii. Corregir la definición de menorOIgual para que funcione adecuadamente.f

natural+(0).
natural+(suc(X)) :- natural(X).

menorOIgual+(0,_) :- natural(_).
menorOIgual+(suc(X), suc(Y)) :- menorOIgual+(X, Y).

