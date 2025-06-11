habla(juan, ruso).
habla(juan, ingles).
habla(maria, ingles).
habla(pedro, ruso).

%habla(A, I), habla(B, I), A \= B.

hablaCon(A, B) :- habla(A, I), habla(B, I), A \= B.

telepatia(maria, pedro).

seComunican(A, B) :- telepatia(A, B).
seComunican(A, B) :- hablaCon(A, B).