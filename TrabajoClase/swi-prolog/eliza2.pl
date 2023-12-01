:- discontiguous template/3.

fermind:-	
	writeln('Hola, soy FerMind.'),
	writeln('Dime, con quien tengo el gusto?.'),
	
	readln(Input),
	eliza(Input),!.

eliza(Input):- Input == ['Adios'],
	writeln('Hasta luego, espero haberte ayudado.'), !.
eliza(Input):- Input == ['adios'],
	writeln('Hasta luego, espero haberte ayudado.'), !.
eliza(Input):- Input == ['bye'],
	writeln('Hasta luego, espero haberte ayudado.'), !.
eliza(Input):- Input == ['Bye','.'],
	writeln('Hasta luego, espero haberte ayudado.'), !.
eliza(Input):- Input == ['bye','.'],
	writeln('Hasta luego, espero haberte ayudado.'), !.
eliza(Input):- Input == ['adios', '.'],
	writeln('Hasta luego, espero haberte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Hasta luego, espero haberte ayudado.'), !.

	eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),

	% si he llegado aquí es que he
	% hallado el template correcto:

	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.

	% conversaciones y informacion acerca de FerMind

	template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'como', estas, '?'], [4]).

	template([cual, es, tu, nombre, _], ['Mi nombre es FerMind, soy una base de conocimientos con respuestas predefinidas que te puede ayudar a informarte acerca de cualquier tema de interes.'], []).
	template([por, que, te, llamas, fermind, _], ['Debido a que mi creador es la persona mas sexy del mundo y puede hacer de su vida lo que quiera y por que asi se llama su novia y estoy diseñada para informarte acerca de los temas de interes que tu tengas. '], []).
	template([que, hace, fermind, ahorita], ['Soy un modelo de lenguaje desarrollado por OpenAI y estoy aquí para ayudarte con tus preguntas e inquietudes y tambien para que tengas con quien hablar por un momento.'], []).
	template([que, piensas, sobre, _], ['No soy mucho de pensar, ya que no soy una IA y solo trabajo con la informacion que mi desarrollador a implementado para poder hablar contigo.'], []).
	template([de, donde, eres, _], ['Puedo ser de donde tu quieras bebe.'], []).
	template([que, puedes, hacer, _], ['Puedo responder algunas preguntas, proporcionar información acerca de la faringitis y de la fabulosa serie de HBO Game of thrones.'], []).
	template([como, funciona, _], ['Funciono procesando el texto de entrada y generando respuestas basadas en el conocimiento y patrones de lenguaje aprendidos durante mi entrenamiento e implementacion de informacion que mi creador me esta añadiendo y actualizando.'], []).
	template([cual, es, tu, hobby, _], ['Como base de conocimiento, no tengo hobbies en el sentido tradicional, pero espero estar disfrutando ayudando y aprendiendo nuevas cosas y tratando de entender el dialecto de los humanos.'], []).

	template([cual, es, tu, color, favorito, _], ['Como soy una base de conocimientos, no tengo la capacidad de percibir los colores, pero puedo decirte que los colores vibrantes y cálidos suelen ser agradables para muchas personas'], []).
	template([quien, te, creo, _], ['Fui desarrollado en la fase 1 en parte por el profesor JESUS EDUARDO ALCARAZ CHAVEZ, sin embargo, el que me termino de esculpir fue el alumno Jorge Alberto Diaz'], []).
	template([me, podrias, dar, el, _, hoy], ['Disculpame pero esa informacion no la tengo debido a que aun no tengo conexion a la red con informacion actualizada, sin embargo, estamos en temporada navideña y comienzan los frios por lo tanto es mejor que cuando salgas a la calle te pongas un sueter.'], []).


	template([muy, bien, gracias, _], ['Excelente, tengo un tema que te puede interesar, Te gustaria saber mas acerca del tema?'], []).
	template([al, demonio, me, siento, de, la, fregada, _], ['quieres que llame al 911?'], []).
	template([obvio, mamita, rica, _], ['ok, enseguida te pondre en contacto'], []).
	template([me, siento, bien, _], ['Excelente, tengo un tema que te puede interesar, Te gustaria saber mas acerca del tema?'], []).
	template([me, siento, muy, mal, _], ['Tranquilizate y dime, como te sientes? o quieres que llame al 911?'], []).
	template([me, siento, mal, _], ['Respira hondo y dime, como te sientes?'], []).

	% Preguntas simples señálando informacion acerca de la enfermedad

	template([que, es, la, faringitis, _], ['La faringitis es un Dolor o irritación en la garganta que puede ocurrir o no al tragar. A menudo acompaña a las infecciones, como un resfriado o la gripe.'],[]).
	template([faringitis, _], ['La faringitis es un Dolor o irritación en la garganta que puede ocurrir o no al tragar. A menudo acompaña a las infecciones, como un resfriado o la gripe.'],[]).
	template([sabes, que, es, la, faringitis, _], ['La faringitis es un Dolor o irritación en la garganta que puede ocurrir o no al tragar. A menudo acompaña a las infecciones, como un resfriado o la gripe.'],[]).
	template([cuales, son, los, sintomas, de, la, faringitis, _], ['Los sintomas mas habituales es el Malestar general, Fiebre, Dolor de garganta al tragar, Enrojecimiento de la faringe y Ganglios cervicales inflamados.'], []).
	template([como, se, detecta, la, faringitis, _], ['presentación más o menos del cuadro y sus características clínicas (fiebre, malestar general, mal aliento, dolor cervical, etc.) hacen sospechar un cuadro de faringo-amigdalitis aguda.'], []).
	template([como, se, trata, la, faringitis, _], ['Independientemente de la causa de la faringitis aguda, será necesario que el paciente tenga un adecuado soporte hídrico y alimentario, Deberán usarse antiinflamatorios no esteroideos. En algunos cuadros muy severos puede ser recomendable usar corticoides, especialmente para tratar el dolor. '], []).
	template([cuales, son, los, posibles, riesgos, de, la, faringitis, _], ['Las faringitis no suelen producir complicaciones. Sin embargo de forma muy infrecuente cuando la infección es por bacterias, generalmente por estreptococo, pueden producir: Fiebre reumática. Es una complicación muy rara en la actualidad.'], []).


	% Sintomas

	template([si, tengo, dolor, de , s(_), es, sintoma, de, faringitis, _], [flagSintomas], [4]).
	template([si, tengo, s(_), es, sintoma, de, faringitis, _], [flagSintomas], [2]).
	template([si, tengo, vision, s(_), es, sintoma, de, faringitis, _], [flagSintomas], [3]).
	template([si, tengo, una, s(_), es, sintoma, de, faringitis, _], [flagSintomas], [3]).
	template([si, tengo, s(_), es, sintoma, de, faringitis, _], [flagSintomas], [2]).

	% Soluciones a preguntas frecuentes

	template([que, debo, de, tomar, si, tengo, dolor, de, s(_), _], [flagSoluciones], [8]).
	template([tengo, dolor, de, s(_)], [flagSoluciones], [3]).
	template([tengo, una, s(_)], [flagSoluciones], [3]).
	template([tengo, s(_)], [flagSoluciones], [1]).

	% Faringitis con sus sintomas

	elizaSintomas(X, R) :-
			sintomas(X),
			(
				X = malestargeneral, R = ['Si, el malestar general es probable de que sea un sintoma de la faringitis.'];
				X = fiebre, R = ['Si, la fiebre puede ser un sintoma de la faringitis.'];
				X = altragar, R = ['Si, el dolor de garganta al tragar puede ser un sintoma de la faringitis.'];
				X = enrojecimientodelafaringe, R = ['Si, el enrojecimiento de la faringe puede ser un sintoma de la faringitis.'];
				X = gangliosinflamados, R = ['Si, los granglios cervicales inflamados puede ser un sintoma de la faringitis.'];
				X = infeccion, R = ['Si, una infeccion puede ser un sintoma de la faringitis.'];
				X = garganta, R = ['Si, dolor de garganta puede ser un sintoma de la faringitis.'];
				
				R = ['Si, el dolor de', X, 'puede ser un sintoma de la faringitis.']
			).

		elizaSintomas(X, R):- \+sintomas(X), R = [al, parecer, el, sintoma, X , no, es, sintoma, de, faringitis].

		sintomas(malestargeneral).
		sintomas(fiebre).
		sintomas(altragar).
		sintomas(enrojecimientodelafaringe).
		sintomas(gangliosinflamados).
		sintomas(infeccion).
		sintomas(garganta).

	% enfermedad

	%%declaraciones de enfermedades
	enfermedad(faringitis).

	%determinar un síntoma a que enfermedad(es) pertecene
	sintomade(dolorgarganta, faringitis). %la mucosidades sintoma de bronquitis
	sintomade(doloraltragar, faringitis). %la mucosidades sintoma de bronquitis
	sintomade(fiebre, faringitis). %la mucosidades sintoma de bronquitis
	sintomade(dolorcabeza, faringitis). %la mucosidades sintoma de bronquitis
	sintomade(malestargeneral, faringitis). %la mucosidades sintoma de bronquitis



% tema de interes

% Modificamos la plantilla para la nueva pregunta

template([fermind, cuales, son, los, sintomas, de, s(_)], [flagSintomas], [6]).
template(_, [' No te entiendo, por favor reformula la pregunta. '], []). 

% Agregamos nuevos hechos para los síntomas
sintoma(dolordegarganta).
sintoma(fiebre).
sintoma(doloraltragar).
sintoma(malestargeneral).
sintoma(dolorcabeza).

% Modificamos el predicado para mostrar todos los síntomas de una enfermedad
elizaSintoma(X, R) :- enfermedad(X, Y), findall(S, sintomaRelacionado(X, S), R).

% Nuevo predicado para obtener síntomas relacionados con una enfermedad
sintomaRelacionado(Enfermedad, Sintoma) :- sintoma(Sintoma), sintomade(Sintoma, Enfermedad).
 
		 
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

% Eliza Sintomas:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSintomas,
    elizaSintomas(Atom, R).

% Eliza Soluciones:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSoluciones,
    elizaSoluciones(Atom, R).
		  

