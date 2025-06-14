%Definir el predicado aplanar(+Xs, -Ys), que es verdadero sii Ys contiene los elementos de todos los niveles de
%Xs, en el mismo orden de aparición. Los elementos de Xs son enteros, átomos o nuevamente listas, de modo que
%Xs puede tener una profundidad arbitraria. Por el contrario, Ys es una lista de un solo nivel de profundidad.
%Ejemplos:
%?- aplanar([a, [3, b, []], [2]], L).→ L=[a, 3, b, 2]
%?- aplanar([[1, [2, 3], [a]], [[[]]]], L).→ L=[1, 2, 3, a]
%Nota: este predicado ya está definido en prolog con el nombre flatten.

aplanar([],[]).
aplanar([X|XS], L) :- is_list(X), aplanar(X, R), aplanar(XS,RS) , append(R,RS,L).
aplanar([X|XS], [X|LS]) :- not(is_list(X)), aplanar(XS,LS).

