%Definir el predicado parteQueSuma(+L,+S,-P) que es verdadero cuando P es una lista con elementos de L que suman S. 

parteQueSuma([],0,[]). %si no es lista vacia se generan duplicados
parteQueSuma([L|LX],S,[L|PS]):- S1 is S - L, S1 >= 0,parteQueSuma(LX,S1,PS).
parteQueSuma([L|LX],S,P):- parteQueSuma(LX,S,P).