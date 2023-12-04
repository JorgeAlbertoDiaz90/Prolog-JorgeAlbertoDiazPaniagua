
	% Relacion

		template([es, s(_), de, la, cacota, de, los, cabezas, _], [flagPadre], [1]).
		template([que, emblema, representa, la, casa, de, los, cacota, _], ['El cacas que representa la casa de los baratheon es un ciervo coronado negro sobre un campo dorado. '],[]).
		template([cuales, son, los, miembros, de, la, cacas, grandes ], ListaResultado, []):-
			findall(Relacion, relacionpadre(Relacion), ListaResultado).

padre(juan). 
padre(antonio).
padre(luiso).   
padre(eduardo).
#madre con su nombre
madre(luisa).
%padre de, (nombre del padre o madre X y el nombre de su hijo Y)
padrede(pedro, juan).
padrede(juan, julio). #predicados binarios
padrede(juan, jose).
madrede(luisa, maria).
#abuelo
abuelo(X,Y):-padrede(X,W),padrede(W,Y).  #, es un AND ; es un OR

% Relaciones
elizaPadre(X, R):- relacionpadre(X), R = [si, X, es, una, relacion].
		elizaPadre(X, R):- \+relacionpadre(X), R = [X, no, es, una, caca, de, la, serie].
es_padre(Padre, Hijo) :- padre(Padre, Hijo).
es_madre(Madre, Hijo) :- madre(Madre, Hijo).
es_hijo(Hijo, Padre, Madre) :- hijo(Hijo, Padre, Madre).
es_hermano(Hermano1, Hermano2) :- hermano(Hermano1, Hermano2).
es_hermana(Hermana1, Hermana2) :- hermana(Hermana1, Hermana2).
es_hermanos(Hermana1, Hermano1, Hermana2, Hermano2) :- hermano(Hermana1, Hermana2), hermano(Hermano1, Hermano2).
es_abuelo(Abuelo, Nieto) :- abuelo(Abuelo, Nieto).
es_abuela(Abuela, Nieto) :- abuela(Abuela, Nieto).
es_tio(Tio, Sobrino) :- tio(Tio, Sobrino).
es_tia(Tia, Sobrino) :- tia(Tia, Sobrino).

% Ejemplos de relaciones
elizaRelacion(X, R):- relacion(X), R = [si, X, es, una, relacion].
		elizaRelacion(X, R):- \+relacion(X), R = [X, no, es, una, caca, de, la, serie].
relacion(padre, enrique, dana).
relacion(madre, jacqueline, dana).
relacion(padre, enrique, luis).
relacion(madre, jacqueline, luis).
relacion(hermano, luis, dana).
relacion(hermana, dana, luis).
relacion(hermana, dana, jorge).
relacion(hermano, jorge, luis).
relacion(hermano, jorge, dana).
relacion(abuelo, florbiento, luis).
relacion(abuelo, florbiento, dana).
relacion(abuelo, florbiento, jorge).
relacion(abuela, yolanda, luis).
relacion(abuela, yolanda, jorge).
relacion(abuela, yolanda, dana).
relacion(tio, alberto, dana).
relacion(tio, alberto, luis).
relacion(tio, alberto, jorge).
relacion(tia, rubi, luis).
relacion(tia, rubi, dana).
relacion(tia, rubi, jorge).
relacion(tia, alondra, luis).
relacion(tia, alondra, dana).
relacion(tia, alondra, jorge).
relacion(tia, karina, jorge).
relacion(hijo, dana, enrique, jacqueline).
relacion(hijo, luis, enrique, jacqueline).
relacion(hijo, jorge, enrique, jacqueline).

% Predicados para buscar relaciones
buscar_padre(Persona, Padre) :- relacion(padre, Padre, Persona).
buscar_madre(Persona, Madre) :- relacion(madre, Madre, Persona).
buscar_hermano(Persona, Hermano) :- relacion(hermano, Hermano, Persona).
buscar_hermana(Persona, Hermana) :- relacion(hermana, Hermana, Persona).
buscar_hermanos(Persona, Hermano1, Hermana1, Hermano2, Hermana2) :- 
    relacion(hermano, Hermano1, Persona),
    relacion(hermana, Hermana1, Persona),
    relacion(hermano, Hermano2, Persona),
    relacion(hermana, Hermana2, Persona).
buscar_hijo(Persona, Hijo) :- relacion(hijo, Hijo, Persona).
buscar_tio(Persona, Tio) :- relacion(tio, Tio, Persona).
buscar_tia(Persona, Tia) :- relacion(tia, Tia, Persona).
buscar_abuelo(Persona, Abuelo) :- relacion(abuelo, Abuelo, Persona).
buscar_abuela(Persona, Abuela) :- relacion(abuela, Abuela, Persona).



match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.


replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.

% Eliza relacion:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagRelacion,
    elizaRelacion(Atom, R).


% Eliza relacion:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagPadre,
    elizaPadre(Atom, R).