padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).

%1) Juan
%2) 
%! hijo(?X,?Y)
% Es verdadero si H es hijo de H ...
hijo(H,P) :- padre(P,H).  

%! hermano(?X,?Y)
% Es verdadero si X es hijo del mismo padre que Y ...
hermano(X,Y) :- padre(Z,X) , padre(Z,Y), X \= Y .


%! descendiente(?X,?Y)
% Es verdadero si X es hijo de Y, o nieto de Y
descendiente(X,Y) :- padre(Y,X).
descendiente(X,Y) :- abuelo(Y,X).

%3) 
% descendiente(Alguien, juan).
%  |-> padre(juan,X) ... {Alguien := X}
%  |    |-> padre(juan, carlos) ... {X:=carlos} OK
%  |    |-> padre(juan, luis)   ... {X:=luis} OK
%  |-> abuelo(juan,X) ... {Alguien:=X}
%       |-> padre(juan,Z), padre(Z,Y) ... {X:=Z}
%             |-> padre(juan, carlos), padre(carlos, Y) ... {Z:=carlos}
%             |        |-> padre(carlos, daniel) ... {Y:=daniel} ok
%             |        |-> padre(carlos, diego)  ... {Y:=diego} ok
%             |-> padre(juan, luis), padre(luis, Y) ... {Z:=luis}
%                      |->  padre(luis, pablo)  ... {Y=pablo} ok
%                      |->  padre(luis, manuel) ... {Y=manuel} ok
%                      |->  padre(luis, ramiro) ... {Y=ramiro} ok
%

%4) abuelo(juan,X).
%5) hermano(pablo,X).

%6/7)
ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).
% Primero decimos que X es asncestro de X (ponele), y luego que X es ascenstro de Y, si Z es ansestro de Z, e hijo de X
% Osea si hay uno antes de Y y X es padre de ese. ancestro(Z,Y) tiene que llegar a un caso base

ancestro+(X, X).
ancestro+(X, Y) :- descendiente(Y,X).

ancestro-(X, X).
ancestro-(X, Y) :- padre(X, Z) , ancestro-(Z, Y) .