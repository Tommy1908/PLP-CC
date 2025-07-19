%Considerar el siguiente predicado:
%%desde(X,X).
%%desde(X,Y) :- N is X+1, desde(N,Y).
%i. ¿Cómo deben instanciarse los parámetros para que el predicado funcione? (Es decir, para que no se cuelgue ni produzca un error). ¿Por qué?
% desde(+X,-Y), ya que si Y esta instanciado da True pero luego sigue buscando sols infinitamente. Al reves igual, da true con X=Y pero luego sigue buscando
%ii. Dar una nueva versión del predicado que funcione con la instanciación desdeReversible(+X,?Y), 
%tal que  si Y está instanciada, sea verdadero si Y es mayor o igual que X, y si no lo está genere todos los Y de X en adelante.

desde(X,X) :- nonvar(X).
desde(X,Y) :- nonvar(Y), Y > X.
desde(X,Y) :- var(Y), N is X+1, desde(N,Y).
