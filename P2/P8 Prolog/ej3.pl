%Considerar las siguientes definiciones:
natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
menorOIgual(X,X) :- natural(X).
%i. Explicar qué sucede al realizar la consulta menorOIgual(0,X).
%%%Se cuelga
%ii. Describir las circunstancias en las que puede colgarse un programa en Prolog. Es decir, ejecutarse infinitamente sin arrojar soluciones.
%iii. Corregir la definición de menorOIgual para que funcione adecuadamente.f