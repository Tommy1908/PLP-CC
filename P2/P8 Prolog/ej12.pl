%Ejercicio 12 ⋆
%Definir los siguientes predicados, utilizando la representación de árbol binario definida en el ejercicio 11:
%i. inorder(+AB,-Lista), que tenga éxito si AB es un árbol binario y Lista la lista de sus nodos según el recorrido inorder.

inorder(nil,[]).
inorder(bin(L,R,D),ORD):- inorder(L,ORDL), inorder(D,ORDD), append(ORDL,[R|ORDD],ORD).

%ii. arbolConInorder(+Lista,-AB), versión inversa del predicado anterior.

arbolConInorder(ORD,AB):- inorder(AB,ORD).

%iii. aBB(+T), que será verdadero si T es un árbol binario de búsqueda.
%% aBB 1
aBB1(T):- inorder(T,L), ordenada(L).

ordenada([]).
ordenada([_]).
ordenada([X,Y|R]):- X =< Y, ordenada([Y|R]).

%% aBB 2
aBB2(nil).
aBB2(bin(nil,R,nil)).
aBB2(bin(nil,R,D)):- D \= nil, raiz(D,DR), DR >= R.
aBB2(bin(L,R,nil)):- L \= nil, raiz(L,LR), R >= LR.
aBB2(bin(L,R,D)):- D \= nil, raiz(D,DR), DR >= R, L \= nil, raiz(L,LR), R >= LR.

raiz(bin(_,R,_),R).


%iv. aBBInsertar(+X, +T1, -T2), donde T2 resulta de insertar X en orden en el árbol T1. Este predicado ¿es reversible en alguno de sus parámetros? Justificar.

aBBInsertar(X,T1,T2):- inorder(T2,LS), member(X,LS), aBB2(T2).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1(nil).
a1(bin(nil, 5, nil)).
a1(bin(bin(nil, 3, nil), 4, bin(bin(nil, 7, nil), 9, nil))).
a1(bin(bin(nil, 5, nil), 4, bin(bin(nil, 7, nil), 9, nil))).
       