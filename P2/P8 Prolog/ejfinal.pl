%%En prolog definir λ-terminos como
%    var(X) donde X es un numero natural. Representa al uso de la variable numero X.
%    lam(X, M) donde X es un numero natural y M es un λ-termino. Representa la ligadura de la variable numero X con respecto al λ-termino M.
%    app(M, N) donde M y N son λ-terminos. Representa a la aplicacion.
%Asumo que van a estar rectificados
%+M, -L
variablesLibres(M,L):- variablesLibrasAux(M,[],L).

variablesLibrasAux(lam(X,M),Ligadas,L):- variablesLibrasAux(M,[X|Ligadas],L).
variablesLibrasAux(app(M,N),Ligadas,L):- variablesLibrasAux(M,Ligadas,L1), variablesLibrasAux(N,Ligadas,L2), append(L1,L2,L).
variablesLibrasAux(var(X),Ligadas,[]):- in(X,Ligadas).
variablesLibrasAux(var(X),Ligadas,[X]):- not(in(X,Ligadas)).

in(X,[X|_]).
in(X,[L|LS]):- X\=L, in(X,LS).

%+M,-T
tamano(var(_),1).
tamano(lam(_,M),T):- tamano(M,TL), T is 1 + TL.
tamano(app(M,N),T):- tamano(M,TM), tamano(N,TN), T is 1 + TM + TN.

%+XS, -M
generarLambdaTerminos(XS,M):- desde(1,T), terminoDeTamano(XS,T,M).

terminoDeTamano(XS,1,M):- member(X, XS), M = var(X).
terminoDeTamano(XS,T,M):- T > 1, member(X, XS), T1 is T-1, terminoDeTamano(XS,T1,N), M = lam(X,N).
terminoDeTamano(XS,T,M):- T > 1, TLim is T-1, between(0,TLim,T1), T2 is TLim-T1, terminoDeTamano(XS,T1,N1), terminoDeTamano(XS,T2,N2), M = app(N1,N2).

desde(X,X).
desde(X,Y):- N is X + 1, desde(N,Y).


%generarLambdaTerminos(XS, M) :-
%    between(1, inf, T),          % tamaño desde 1 hasta infinito (en la práctica, recursión)
%    generarDeTamano(XS, T, M).
%
%generarDeTamano(XS, 1, var(X)) :-
%    member(X, XS).
%generarDeTamano(XS, T, lam(X, M)) :-
%    T > 1,
%    T1 is T - 1,
%    member(X, XS),
%    generarDeTamano(XS, T1, M).
%generarDeTamano(XS, T, app(M, N)) :-
%    T > 1,
%    T1Max is T - 2,
%    between(1, T1Max, T1),
%    T2 is T - 1 - T1,
%    generarDeTamano(XS, T1, M),
%    generarDeTamano(XS, T2, N).
