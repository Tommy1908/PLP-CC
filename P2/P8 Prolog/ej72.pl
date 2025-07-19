%i. intersección(+L1, +L2, -L3), tal que L3 es la intersección sin repeticiones de las listas L1 y L2, respetando en L3 el orden en que aparecen los elementos en L1.
%Lo hice pensando que era con repetidos, si es sin repetidos es en vez de borrar primero borra todos
borrar_primero(_, [], []).
borrar_primero(X, [X|LS], LS).
borrar_primero(X, [Y|LS], [Y|RES]) :- Y \= X, borrar_primero(X, LS, RES).

borrar_todos(_, [], []).
borrar_todos(X, [X|YS], ZS):- borrar_todos(X,YS,ZS).
borrar_todos(X, [Y|YS], [Y|ZS]):- X\=Y, borrar_todos(X,YS,ZS).

interseccion([],[],[]).
interseccion(X,[],[]):- X \= [].
interseccion([],X,[]):- X \= [].
interseccion([X|L1], L2, [X|L3]):- in(X,L2), borrar_todos(X,L2,L2N), interseccion(L1,L2N,L3).
interseccion([X|L1], L2, L3):- not(in(X,L2)), interseccion(L1,L2,L3).

in(X,[X|_]).
in(X,[L|LS]):- X\=L, in(X,LS).

%partir(N, L, L1, L2), donde L1 tiene los N primeros elementos de L, y L2 el resto. Si L tiene menos de N elementos el predicado debe fallar. Cuán reversible es este predicado? Es decir, ¾qué parámetros pueden estar indefinidos al momento de la invocación?

partir(N,L,L1,L2):- length(L1, N), append(L1,L2,L).

% ?N +L +L1 ?L2
% ?N +L ?L1 ?L2 SE CUELGA
% ?N +L +L1 +L2
% -N -L -L1 -L2 aparentemente anda bien

%ii. borrar(+ListaOriginal, +X, -ListaSinXs), que elimina todas las ocurrencias de X de la lista ListaOriginal.
