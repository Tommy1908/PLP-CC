%Ejercicio 11
%Un árbol binario se representará en Prolog con:
%nil, si es vacío.
%bin(izq, v, der), donde v es el valor del nodo, izq es el subárbol izquierdo y der es el subárbol derecho.
%Definir predicados en Prolog para las siguientes operaciones: vacío, raiz, altura y cantidadDeNodos.
%Asumir siempre que el árbol está instanciado.

a1(nil).
a1(bin(nil, 5, nil)).
a1(bin(bin(nil, 3, nil), 4, bin(bin(nil, 7, nil), 9, nil))).


vacio(nil).

raiz(bin(_,R,_), R).

altura(nil,0).
altura(bin(L,_,D),H):- altura(L,LR), altura(D,DR), M is max(LR,DR), H is M + 1.

cantidadDeNodos(nil,0).
cantidadDeNodos(bin(L,_,D),C):- cantidadDeNodos(L,LR), cantidadDeNodos(D,DR), C is 1 + LR + DR.