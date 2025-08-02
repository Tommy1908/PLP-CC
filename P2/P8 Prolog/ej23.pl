%Ejercicio 23 ⋆
%Trabajaremos con árboles binarios, usando nil y bin(AI, V, AD) para representarlos en Prolog.
%i. Implementar un predicado arbol(-A) que genere estructuras de árbol binario, dejando los valores de los nodos sin instanciar.
%Deben devolverse todos los árboles posibles (es decir, para toda estructura posible, el predicado debe devolverla luego de un número finito de pedidos).
%No debe devolverse dos veces el mismo árbol.
    % ? arbol(A).
    % A = nil ;
    % A = bin(nil, _G2388, nil) ;
    % A = bin(nil, _G2391, bin(nil, _G2398, nil)) ;
    % A = bin(bin(nil, _G2398, nil), _G2391, nil) ;
    % ...

arbol(A) :- desde(0,N), arbol_con_altura(N, A).

desde(X,X).
desde(X,Y):- N is X+1, desde(N,Y).

arbol_con_altura(0, nil).
arbol_con_altura(N, bin(I, _, D)) :- N > 0, N1 is N - 1,
    between(0, N1, AI),
    between(0, N1, AD),
    MaxAlt is max(AI, AD),
    MaxAlt =:= N1,
    arbol_con_altura(AI, I),
    arbol_con_altura(AD, D).


%ii. Implementar un predicado nodosEn(?A, +L) que es verdadero cuando A es un árbol cuyos nodos pertenecen al conjunto conjunto de átomos L (representado mediante una lista no vacía, sin orden relevante y sin repetidos).
%Puede asumirse que el árbol se recibe instanciado en su estructura, pero no necesariamente en sus nodos.
    % ? arbol(A), nodosEn(A, [ka, pow]).
    % A = nil ;
    % A = bin(nil, ka, nil) ;
    % A = bin(nil, pow, nil) ;
    % A = bin(nil, ka, bin(nil, ka, nil)) ;
    % A = bin(nil, ka, bin(nil, pow, nil)) ;
    % ...

nodosEn(nil, _).
nodosEn(bin(Iz, V, Der), L) :-
    member(V, L),
    nodosEn(Iz, L),
    nodosEn(Der, L).


%iii. Implementar un predicado sinRepEn(-A, +L) que genere todos los árboles cuyos nodos pertenezcan al alfabeto L y usando como máximo una vez cada símbolo del mismo.
%En este caso, no hay infinitos árboles posibles; es importante que el predicado no devuelva soluciones repetidas y ue no se quede buscando indefinidamente una vez terminado el espacio de soluciones.
    % ? arbolSinRepEn(A, [ka, pow]).
    % A = nil ;
    % A = bin(nil, ka, nil) ; ...
    % A = bin(nil, ka, bin(nil, pow, nil)) ;
    % ... ;
    % No.   <- ???
