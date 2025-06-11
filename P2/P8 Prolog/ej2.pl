%Sea el siguiente programa lógico: vecino(X, Y, [X|[Y|Ls]]).
%vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).
%i. Mostrar el árbol de búsqueda en Prolog para resolver vecino(5, Y, [5,6,5,3]), devolviendo todos los valores de Y que hacen que la meta se deduzca lógicamente del programa.
%ii. Si se invierte el orden de las reglas, ¾los resultados son los mismos? ¾Y el orden de los resultados?

vecino(X, Y, [X|[Y|Ls]]).
vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).

% vecino(5, Y, [5,6,5,3])
