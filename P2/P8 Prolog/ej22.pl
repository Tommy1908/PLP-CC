%Ejercicio 22 ⋆
%En este ejercicio trabajaremos con grafos no orientados.
%Un grafo no orientado es un conjunto de nodos y un conjunto de aristas sin una dirección específica.
%Cada arista está representada por un par de nodos y, como se puede viajar en cualquiera de los dos sentidos, la arista (a, b) y la arista (b, a) son la misma.
%No sabemos cuál es la representación interna de un grafo, pero contamos con un predicado esNodo(+G,?X) que dado un grafo G dice si X es nodo de G.
%También tenemos otro predicado esArista(+G,?X,?Y) que dice si en G hay una arista de X a Y.
%Notar que podemos usar esNodo para enumerar los nodos del grafo y esArista para enumerar las aristas.
%Instanciando apropiadamente, también podemos usar esArista para obtener todas las arista que tienen a un nodo particular.
%Cuando esArista lista todas las arista, cada arista se lista una sola vez en una orientación arbitraria de las dos posibles, pero si se pregunta por cualquiera de las dos responderá que sí.
%Suponer que dos nodos son el mismo si y solo si unifican.
%Ayuda: para algunos items conviene pensar primero en cómo programar el predicado opuesto al que se pide.
%i. Implementar el predicado caminoSimple(+G,+D,+H,?L) que dice si L es un camino simple en el grafo G que empieza en D y termina en H.
%Un camino simple lo representaremos por una lista de nodos distintos, tal que para cada par de nodos consecutivos en L existe una arista en G que los conecta.
%Notar que el primer elemento de L debe ser D y el último H. 
%Cuando L está sin instanciar, el predicado debe ir devolviendo todos los caminos simples desde D a H sin repetidos (es decir, hay que tener cuidado con los ciclos).

% Caso base: camino de un solo nodo (D = H)
caminoSimple(G, D, D, [D]) :- esNodo(G, D).
caminoSimple(G, D, H, Camino) :- D \== H, esNodo(G, D), esNodo(G, H), caminoSimpleAux(G, D, H, [D], Camino), length(Camino,L), L>1.

% Predicado auxiliar con acumulador de visitados
caminoSimpleAux(_, H, H, _, [H]).
caminoSimpleAux(G, Actual, H, Visitados, [Actual|Camino]) :- Actual \== H, esArista(G, Actual, Siguiente), not(member(Siguiente, Visitados)), caminoSimpleAux(G, Siguiente, H, [Siguiente|Visitados], Camino).

%ii. Un camino L en un grafo G es Hamiltoniano sii L es un camino simple que contiene a todos los nodos G.
%Implementar el predicado caminoHamiltoniano(+G,?L) que dice si L es un camino Hamiltoniano en G.

caminoHamiltoniano(G,L):- caminoSimple(G,_,_,L), not(algunoNoPertence(G,L)).

algunoNoPertence(G,L):- esNodo(G,X), not(member(X,L)).

%iii. Implementar el predicado esConexo(+G) que dado un grafo dice si este es conexo.
%Un grafo G es conexo sii no existe un par de nodos en G tal que no hay un camino simple que los una.
%Notar que con esta definición un grafo de un nodo (y sin aristas) es conexo.

%esConexo(G):- noHayCaminoHasta(G).

%noHayCaminoHasta(G):- esNodo(G,X), not(caminoSimple(G,_,X,L)), length(L,N), N>1.

%iv. Implementar el predicado esEstrella(+G) que dado un grafo dice si es un grafo estrella. Un grafo es estrella sii es conexo y hay un nodo común a todas sus aristas.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Para poder probar
esNodo(grafo(Nodos, _), X) :- member(X, Nodos).

% esArista(+G, ?X, ?Y): dice si hay arista entre X e Y en G
% Como el grafo es no orientado, [X,Y] y [Y,X] representan la misma arista
esArista(grafo(_, Aristas), X, Y) :-
    nonvar(X), nonvar(Y), !,  % Consulta específica
    (member([X, Y], Aristas) ; member([Y, X], Aristas)).

esArista(grafo(_, Aristas), X, Y) :-
    % Enumeración: devuelve cada arista una sola vez
    member([X, Y], Aristas).


t(grafo([a,b,c], [[a,b], [b,c], [c,a]])).
e(grafo([centro,a,b,c], [[centro,a], [centro,b], [centro,c]])).
l(grafo([a,b,c], [[a,b], [b,c]])).
s(grafo([a], [])).
v(grafo([], [])).
ej(grafo([a,b,c,d,e],[[a,b],[a,c],[c,d],[d,e],[b,c]])).
ej2(grafo([a,b,c,d,e],[[a,b],[a,c],[c,d],[b,c]])).
%Gracias claude por tu aporte