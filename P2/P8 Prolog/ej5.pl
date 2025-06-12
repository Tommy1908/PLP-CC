% Definir los siguientes predicados sobre listas usando append:
% i. last(?L, ?U), donde U es el último elemento de la lista L.
% ii. reverse(+L, ?R), donde R contiene los mismos elementos que L, pero en orden inverso.
% Ejemplo: reverse([a,b,c], [c,b,a]).
% Mostrar el árbol de búsqueda para el ejemplo dado.
% iii. prefijo(?P, +L), donde P es prefijo de la lista L.
% iv. sufijo(?S, +L), donde S es sufijo de la lista L.
% v. sublista(?S, +L), donde S es sublista de L.
% vi. pertenece(?X, +L), que es verdadero sii el elemento X se encuentra en la lista L. (Este predicado ya viene definido en Prolog y se llama member)

%1)
last(L,U) :- append(_,[U|[]],L).   %Se lo que sea, con el ultimo elemento tiene que ser L, entonces devuelvo ese U

%2)
%! reverse(+L, ?R)
reverse([],[]).
reverse([X|XS], R) :- reverse(XS,RXS), append(RXS,[X],R).

% reverse([a,b,c], [c,b,a])
%  |-> CASO 1 NO UNIFICA
%  |-> reverse([b,c],RXS), append(RXS,[X],[c,b,a]). {X:=a, XS:=[b,c], R:=[c,b,a]}
%           |->
%mmmmm TO.DO

%3)
prefijo(P,L) :- append(P,_,L).

%4)
sufijo(S,L) :- append(_,S,L).

%5)
%[1,2,3,4]           [2,3,4]            [2,3]
sublista([],_).
sublista(S,L) :- append(_,Algo,L) , append(S,_,Algo) , S\=[].

%6)
pertenece(X, [L|_]) :- X=L.
pertenece(X, [_|LS]) :- pertenece(X,LS).