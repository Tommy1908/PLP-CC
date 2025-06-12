%Definir el predicado juntar(?Lista1,?Lista2,?Lista3), que tiene éxito si Lista3 es la concatenación de
%Lista1 y Lista2. Por ejemplo:
%?- juntar([a,b,c], [d,e], [a,b,c,d,e]). → true.
%?- juntar([a,b,c], [d,e], L). → L = [a,b,c,d,e].
%?- juntar([a,b,c], L, [a,b,c,d,e]). → L = [d,e].
%?- juntar(L, [d,e], [a,b,c,d,e]). → L = [a,b,c].
%?- juntar(L1, L2, [1,2,3]). → L1 = [], L2 = [1, 2, 3]; L1 = [1], L2 = [2, 3];
%L1 = [1,2], L2 = [3]; L1 = [1,2,3], L2 = [].
%Al igual que la mayoría de los predicados, puede dar false después de agotar los resultados.
%Nota: este predicado ya está definido en prolog con el nombre append.

juntar([],YS,YS).
juntar([X|XS],YS,[X|ZS]) :- juntar(XS,YS,ZS).
