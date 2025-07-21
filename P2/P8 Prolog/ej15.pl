%Ejercicio 15
%En este ejercicio trabajaremos con triángulos. La expresión tri(A,B,C) denotará el triángulo cuyos lados tienen longitudes A, B y C respectivamente. Se asume que las longitudes de los lados son siempre números naturales.
%Implementar los siguientes predicados:
%i. esTriángulo(+T) que, dada una estructura de la forma tri(A,B,C), indique si es un triángulo válido.
%En un triángulo válido, cada lado es menor que la suma de los otros dos, y mayor que su diferencia (y obviamente mayor que 0).

esTriangulo(tri(A,B,C)):- A < B+C, A > abs(B-C), B < A+C, B > abs(A-C), C < A+B, C > abs(A-B).

%ii. perímetro(?T,?P), que es verdadero cuando T es un triángulo (válido) y P es su perímetro. 
%No se deben generar resultados repetidos (no tendremos en cuenta la congruencia entre triángulos: si dos triángulos tienen las mismas longitudes, pero en diferente orden, se considerarán diferentes entre sí).
%El predicado debe funcionar para cualquier instanciación de T y P (ambas instanciadas, ambas sin instanciar, una instanciada y una no; no es necesario que funcione para triángulos parcialmente instanciados), debe generar todos los resultados válidos (sean finitos o infinitos), y no debe colgarse (es decir, no debe seguir ejecutando infinitamente sin producir nuevos resultados). Por ejemplo:
%   ?- perímetro(tri(3,4,5),12). → true.
%   ?- perímetro(T,5). → T = tri(1, 2, 2) ; T = tri(2, 1, 2) ; T = tri(2, 2, 1) ; false.
%   ?- perímetro(tri(2,2,2),P). → P = 6.
%   ?- perímetro(T,P). → T = tri(1, 1, 1), P = 3 ; T = tri(1, 2, 2), P = 5 ; . . .


perimetro(T,P):- nonvar(T), var(P), T = tri(A,B,C), esTriangulo(tri(A,B,C)), P is A+B+C.
perimetro(T,P):- var(T), nonvar(P), trianguloDePerimetro(P,T), esTriangulo(T).
perimetro(T,P):- var(T), var(P), desde(0,P), trianguloDePerimetro(P,T), esTriangulo(T).

trianguloDePerimetro(P,tri(A,B,C)):- P >= 3, between(0,P,A), between(0,P,B), between(0,P,C), P is A+B+C.

desde(X,X).
desde(X,Y):- N is X+1, desde(N,Y).

%iii. triángulo(-T), que genera todos los triángulos válidos, sin repetir resultados.

%Esto funciona, pero si no hubieramos hecho que genere, podriamos haber usado la def de perimetro con P fijo y usar el generador aca
triangulo(T):- perimetro(T,_).
