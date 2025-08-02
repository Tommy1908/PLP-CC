% +L,+R
esRotacion(L,R):- append(R1,R2,R), append(R1,R2,L). 
esRotacion(L,R):- append(R1,R2,R), append(R2,R1,L). 

% +X
esPar(X):- (X mod 2) =:= 0.

collatz(1,1).
collatz(S,S):- S > 1. 
collatz(N,S):- N > 1, esPar(N), N2 is N/2, collatz(N2,S).
collatz(N,S):- N > 1, not(esPar(N)), N3 is N*3, N31 is N3+1, collatz(N31,S).

collatzMayor(N,M):- collatz(N,M), not((collatz(N,S2), S2>M)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%L,-U
unico(L,U):- member(U,L), sacarPrimero(L,U,LR), not(member(U,LR)).

% +XS +X -SS
sacarPrimero(_,[],[]).
sacarPrimero([X|LR],X,LR).
sacarPrimero([Y|LS],X,[Y|LR]):- Y \= X, sacarPrimero(LS,X,LR).

sinRepetidos(L):- not(hayRepetidos(L)).

hayRepetidos(L):- member(X,L), not(unico(L,X)).

%+VS, -F
formula(VS,F):- desde(1,L), formulaDeLen(L,VS,F).


formulaDeLen(1,VS,F):- member(X,VS), F = X.
formulaDeLen(L,VS,F):- L > 1, L1 is L-1, L1 >= 0, formulaDeLen(L1,VS,FI), F = neg(FI).
formulaDeLen(L,VS,F):- L > 2, L2 is L-2, L2 >= 2, between(0,L2,F1L), F2L is L2-F1L, formulaDeLen(F1L,VS,F1), formulaDeLen(F2L,VS,F2), F = imp(F1,F2).

desde(X,X).
desde(X,Y):- N is X + 1, desde(N,Y).

%No es reversible, se cuelga
%Desde siempre se cuelga luego de pedir el siguiente valor
