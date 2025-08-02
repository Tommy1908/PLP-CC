%Definir los siguientes predicados, usando member y/o append según sea conveniente:
%i. intersección(+L1, +L2, -L3), tal que L3 es la intersección sin repeticiones de las listas L1 y L2, respetando en L3 el orden en que aparecen los elementos en L1.
%partir(N, L, L1, L2), donde L1 tiene los N primeros elementos de L, y L2 el resto. Si L tiene menos de N
%elementos el predicado debe fallar. Cuán reversible es este predicado? Es decir, ¾qué parámetros pueden estar indefinidos al momento de la invocación?
%ii. borrar(+ListaOriginal, +X, -ListaSinXs), que elimina todas las ocurrencias de X de la lista ListaOriginal.
%iii. sacarDuplicados(+L1, -L2), que saca todos los elementos duplicados de la lista L1.
%iv. permutación(+L1, ?L2), que tiene éxito cuando L2 es permutación de L1. Hay una manera más eficiente de definir este predicado para cuando L2 está instanciada?
%v. reparto(+L, +N, -LListas) que tenga éxito si LListas es una lista de N listas (N ≥ 1) de cualquier longitud - incluso vacías - tales que al concatenarlas se obtiene la lista L.
%vi. repartoSinVacías(+L, -LListas) similar al anterior, pero ninguna de las listas de LListas puede ser vacía, y la longitud de LListas puede variar.

%i)

interseccion(L1,L2,L3):- interseccionAux(L1,L2,[],L3).

interseccionAux([],_,_,[]).
interseccionAux([X|XS], YS, V, R):- not(member(X,YS)), interseccionAux(XS,YS,V,R). %no en YS
interseccionAux([X|XS], YS, V, [X|R]):- member(X,YS), not(member(X,V)), append([X],V,VS), interseccionAux(XS,YS,VS,R). %no visitado aun
interseccionAux([X|XS], YS, V, R):- member(X,V), interseccionAux(XS,YS,V,R). %Skip, ya visitado
%?- interseccion([1,2,3,4,5,1,2,3,4,5],[1,1,2,3,4,5],R).          
%R = [1, 2, 3, 4, 5] ;
%R = [1, 2, 3, 4, 5] ;

%ii)
borrar([], _, []).
borrar([X|XS],E,[X|RS]) :- X \= E, borrar(XS,E,RS). %Poner
borrar([E|XS],E,RS) :- borrar(XS,E,RS). %No poner

%iii)
sacarDuplicados([], []).
sacarDuplicados([X|XS],[X|Y]) :- borrar(XS,X,XSS), sacarDuplicados(XSS,Y).

%iv)
%permutacion([],[]).
%permutacion(XS,[Y|YS]):- append(Prefijo,[X],ZS), append(ZS,Sufijo, YS), permutacion(XS,YS). %mover ys
