%Sea el siguiente programa lógico: vecino(X, Y, [X|[Y|Ls]]).
%vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).
%i. Mostrar el árbol de búsqueda en Prolog para resolver vecino(5, Y, [5,6,5,3]), devolviendo todos los valores de Y que hacen que la meta se deduzca lógicamente del programa.
%ii. Si se invierte el orden de las reglas, los resultados son los mismos? Y el orden de los resultados?

vecino(X, Y, [X|[Y|Ls]]).
vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).

% vecino(5, Y, [5,6,5,3])
%  |-> vecino(5, 6, [5|[6|5,3]]) ... {Y:=6} OK
%  |-> vecino(5, Y, [6,5,3])     ... {LS:=[6,5,3]}
%          |-> No unifica con R1 (5/=6)
%          |-> vecino(5, Y, [5,3]) ... {LS:=[5,3]}
%                 |-> vecino(5, 3, [5|[3|[]]]) ... {Y:=3} OK

vecino+(X, Y, [W|Ls]) :- vecino(X, Y, Ls).
vecino+(X, Y, [X|[Y|Ls]]).

%En este caso parece ser los mismos resultados, pero orden invertido
%Entiendo que es lo mismo porque ve el caso en profundidad y luego el otro, pero con la misma instancia... a chequear