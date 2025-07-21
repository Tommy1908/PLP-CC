%Ejercicio 17 ⋆
%i. Sean los predicados P(?X) y Q(?X), ¿qué significa la respuesta a la siguiente consulta?
%?- P(Y), not(Q(Y)).
%Significa que vale P(Y) y no vale Q(Y), o mejor dicho que Q(Y) no unifica.
%ii. ¿Qué pasaría si se invirtiera el orden de los literales en la consulta anterior?
%Ahora Y esta libre en el NOT, y falla inmediatamente si Q tiene alguna solucion, incluso si existen valores que no cumplieran Q
%iii. Sea el predicado P(?X), ¿Cómo se puede usar el not para determinar si existe una única Y tal que P(?Y) es verdadero?
%P(Y), not(P(Z)), Z 

p(a).
p(b).
q(X):-fail.