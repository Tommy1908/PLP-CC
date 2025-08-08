%%En prolog definir λ-terminos como
%    var(X) donde X es un numero natural. Representa al uso de la variable numero X.
%    lam(X, M) donde X es un numero natural y M es un λ-termino. Representa la ligadura de la variable numero X con respecto al λ-termino M.
%    app(M, N) donde M y N son λ-terminos. Representa a la aplicacion.
%Asumo que van a estar rectificados
%A)
%+M, -L
variablesLibres(M,L):- variablesLibrasAux(M,[],L).

variablesLibrasAux(lam(X,M),Ligadas,L):- variablesLibrasAux(M,[X|Ligadas],L).
variablesLibrasAux(app(M,N),Ligadas,L):- variablesLibrasAux(M,Ligadas,L1), variablesLibrasAux(N,Ligadas,L2), append(L1,L2,L).
variablesLibrasAux(var(X),Ligadas,[]):- in(X,Ligadas).
variablesLibrasAux(var(X),Ligadas,[X]):- not(in(X,Ligadas)).

in(X,[X|_]).
in(X,[L|LS]):- X\=L, in(X,LS).

%B)
%+M,-T
tamano(var(_),1).
tamano(lam(_,M),T):- tamano(M,TL), T is 1 + TL.
tamano(app(M,N),T):- tamano(M,TM), tamano(N,TN), T is 1 + TM + TN.

%C)
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%otro de decir si una formula es tautologia o no

orEval((t,t),t).
orEval((t,f),t).
orEval((f,t),t).
orEval((f,f),f).

andEval((t,t),t).
andEval((t,f),f).
andEval((f,t),f).
andEval((t,f),f).

impEval((t,t),t).
impEval((t,f),f).
impEval((f,t),t).
impEval((f,f),t).

negEval(t,f).
negEval(f,t).

eval(prop(N), Val, V) :- 
    member((N,V), Val).

eval(neg(F), Val, V) :- 
    eval(F, Val, V1),
    negEval(V1,V).

eval(and(F1,F2), Val, V) :- 
    eval(F1, Val, V1),
    eval(F2, Val, V2),
    andEval((V1,V2),V).

eval(or(F1,F2), Val, V) :- 
    eval(F1, Val, V1),
    eval(F2, Val, V2),
    orEval((V1,V2),V).

eval(imp(F1,F2), Val, V) :- 
    eval(F1, Val, V1),
    eval(F2, Val, V2),
    impEval((V1,V2),V).

vars(prop(N), [N]).
vars(neg(F), V) :- vars(F, V).
vars(and(F1,F2), V) :- vars(F1, V1), vars(F2, V2), append(V1,V2,VR), sacarDuplicados(VR,V).
vars(or(F1,F2), V)  :- vars(F1, V1), vars(F2, V2), append(V1,V2,VR), sacarDuplicados(VR,V).
vars(imp(F1,F2), V) :- vars(F1, V1), vars(F2, V2), append(V1,V2,VR), sacarDuplicados(VR,V).

%instanciar todos los posibles valores
%VS = [(1, f), (2, t), (3, f)] ;
val([], []).
val([X|Xs], [(X,t)|Vals]) :- val(Xs, Vals).
val([X|Xs], [(X,f)|Vals]) :- val(Xs, Vals).


esTautologia(F) :-
    vars(F, Vars), not(existeValuacionQueFalla(F, Vars)).

existeValuacionQueFalla(F, Vars) :- val(Vars, Val), eval(F, Val, f).

sacarDuplicados([],[]).
sacarDuplicados([X|XS],L2):- in(X, XS), sacarDuplicados(XS, L2).
sacarDuplicados([X|XS],[X|L2]):- not(in(X, XS)), sacarDuplicados(XS, L2).

in(X,[X|_]).
in(X,[L|LS]):- X\=L, in(X,LS).


%%%el de arboles generales
%definido el desde antes
% x [] [x] [x,x,[x,x [x,x,[]]], [x], []]
%nth1(Pos, Lista, Elem)

arbolGeneral(A):- desde(0,N), arbolDeTam(N,A).

arbolDeTam(0,x).
arbolDeTam(0,[]).
arbolDeTam(N,[A|L]):- N > 0, N1 is N - 1, between(0,N1,Na), Nl is N1 - Na, arbolDeTam(Na,A), arbolDeTam(Nl,L).


%%%%%%%%%%%%


tauto(or(neg(X), X)).
tauto(or(X, neg(X))).
tauto(or(X,_)):- tauto(X).
tauto(or(_,Y)):- tauto(Y).
tauto(and(X,Y)):- tauto(X), tauto(Y).
tauto(imp(X,X)).
tauto(imp(X,Y)):- contradiccion(X).
tauto(imp(X,Y)):- tauto(Y).
tauto(neg(neg(X))):- tauto(X).
tauto(neg(X)):- contradiccion(X).

contradiccion(neg(X)):- tauto(X).
contradiccion(and(X,neg(X))).
contradiccion(and(neg(X),X)).
contradiccion(and(X,_)):- contradiccion(X).
contradiccion(and(_,Y)):- contradiccion(Y).
contradiccion(or(X,Y)):- contradiccion(X), contradiccion(Y).
contradiccion(imp(X,Y)):- contradiccion(X), contradiccion(Y).
contradiccion(neg(X)):- tauto(X).