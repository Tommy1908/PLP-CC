%Ejercicio 16 ⋆
%A Ana le gustan los helados que sean a la vez cremosos y frutales. En una heladería de su barrio, se encontró con los siguientes sabores:
frutal(frutilla).
frutal(banana).
frutal(manzana).
cremoso(banana).
cremoso(americana).
cremoso(frutilla).
cremoso(dulceDeLeche).
%Ana desea comprar un cucurucho con sabores que le gustan. El cucurucho admite hasta 2 sabores. Los siguientes predicados definen las posibles maneras de armar el cucurucho.
leGusta(X) :- frutal(X), cremoso(X).
cucurucho(X,Y) :- leGusta(X), leGusta(Y).
%i. Escribir el árbol de búsqueda para la consulta ?- cucurucho(X,Y).
%ii. Indicar qué partes del árbol se podan al colocar un ! en cada ubicación posible en las definiciones de cucurucho y leGusta.

%No hay forma que haga el arbol
%?- cucurucho(X,Y).X = Y, Y = frutilla ;X = frutilla,Y = banana ;X = banana,Y = frutilla ;X = Y, Y = banana ;false.
%Lo que hace unificar X con le gusta, osea que X sea frutal, unifica con frutilla, y X tiene que ser cremoso entonces intenta unificar cremoso(frutilla) con cremoso(frutilla)
%tiene exito, entonces queda como sabor, y pasa lo mismo con Y, por eso la primera es Frutilla y Frutilla.
%Luego va con el siguiente sabor para Y, unifica banana, luego siguiente manzana, pero manzana no es cremoso entonces pasa al siguiente sabor para X porque ya probo todos con Y.
%Lo del ! en cada ubicacion posible no entiendo a que se refiere, no tiene mucho uso aca, rompe todo.

/* 
Esto puede ser util -> es de deepseek
Explicación detallada de leGusta(X), !, leGusta(Y).

Comportamiento del corte (!) en este contexto:

Cuando colocamos el corte entre los dos objetivos:
prolog

cucurucho(X, Y) :- leGusta(X), !, leGusta(Y).

El corte solo afecta las alternativas de leGusta(X), pero no restringe las soluciones de leGusta(Y). Esto significa:

    Primero se resuelve leGusta(X):

        Encuentra la primera solución: X = frutilla (éxito)

        El corte (!) se activa, eliminando:

            Otras soluciones para X (X = banana se poda)

            Puntos de retorno anteriores al corte

    Luego se resuelve leGusta(Y):

        Y es una variable independiente

        Se buscan TODAS las soluciones para Y:

            Y = frutilla (éxito)

            Y = banana (éxito)

            Y = manzana (fallo)

Resultado: Dos soluciones:
prolog

X = frutilla, Y = frutilla ;  % Primera solución para Y
X = frutilla, Y = banana    % Segunda solución para Y

¿Por qué no se podan las soluciones de Y?

El corte solo congela las decisiones a su izquierda (en este caso, X = frutilla), pero no afecta el backtracking en objetivos a su derecha (en este caso, leGusta(Y)).

El árbol de ejecución queda así:
text

?- cucurucho(X, Y)
   |
   |-- [X se resuelve primero]
   |   |
   |   |-- X = frutilla (éxito) -> ! (CORTE: elimina alternativa X=banana)
   |
   |-- [Ahora Y con X fijo en frutilla]
       |
       |-- Y = frutilla (éxito) -> Solución 1
       |
       |-- Y = banana (éxito)  -> Solución 2
       |
       |-- Y = manzana (fallo) -> Fin

Clave conceptual

El corte no detiene la búsqueda de soluciones para objetivos posteriores, solo:

    Congela las elecciones hechas ANTES del corte

    Elimina puntos de retorno ALTERNATIVOS para objetivos anteriores

Por eso en este caso:

    X queda fijado permanentemente como frutilla (por el corte)

    Y sigue buscando TODAS sus soluciones posibles (frutilla y banana) */