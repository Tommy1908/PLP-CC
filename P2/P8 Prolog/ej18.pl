%Ejercicio 18 ⋆
%Definir el predicado corteMásParejo(+L,-L1,-L2) que, dada una lista de números, realiza el corte más parejo posible con respecto a la suma de sus elementos (puede haber más de un resultado). Por ejemplo:
%?- corteMásParejo([1,2,3,4,2],L1,L2). → L1 = [1, 2, 3], L2 = [4, 2] ; false.
%?- corteMásParejo([1,2,1],L1,L2). → L1 = [1], L2 = [2, 1] ; L1 = [1, 2], L2 = [1] ; false.

%+l
corteMasParejo([],[],[]).
corteMasParejo(L,L1,L2):- crearCorte(L,L1,L2,R), not(existeCorteMasParejo(L,L1,L2,R)). 

%+[X|XS]
suma([],0).
suma([X|XS],R):- suma(XS,RS), R is X + RS.

% +L,L1,L2,R
existeCorteMasParejo(L,L1,L2,R):- crearCorte(L,OL1,OL2,R2), R2 < R.

%+L
crearCorte(L,L1,L2,R):-append(L1,L2,L), suma(L1,R1), suma(L2,R2), R is abs(R1-R2).