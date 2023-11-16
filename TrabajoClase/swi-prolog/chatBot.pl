

eliza:-
    writeln('Hola, soy Eliza, tu asistente de chat.'),
    writeln('Por favor, ingresa tu consulta en minúsculas y termina con un ?'),
    writeln('Si deseas realizar el cuestionario para determinar si podrías estar enfermo, escribe "cuestionario".'),
    readln(Input),
    eliza(Input, 0).

eliza(Input, Flag):-
    Input = ['adios'],
    writeln('Adiós. Espero haberte ayudado.'),
    Flag = 1, !.

eliza(Input, Flag):-
    Input = ['adios', '.'],
    writeln('Adiós. Espero haberte ayudado.'),
    Flag = 1, !.

eliza(Input, Flag):-
    Input = ['hasta', 'luego', '.'],
    writeln('Hasta luego. Cuídate.'),
    Flag = 1, !.

eliza(Input, Flag):-
    Input = ['platicar'],
    writeln('¡Claro! Estoy aquí para platicar contigo. ¿Qué te gustaría hablar?'),
    readln(Input1),
    eliza(Input1, Flag), !.

eliza(Input, Flag) :-
    Input = ['cuestionario'],
    writeln('Iniciando el cuestionario para determinar una posible enfermedad.'),
    cuestionario(Flag), !.

eliza(Input, Flag) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1, Flag), !.

% Aquí va el cuestionario

cuestionario(Flag) :-
    writeln('Responde las siguientes preguntas con "si" o "no":'),
    pregunta('¿Has experimentado verrugas genitales?'),
    respuesta(Pregunta1),
    pregunta('¿Tienes problemas para filtrar los desechos y mantener el equilibrio de líquidos en tu cuerpo? (síntomas como hinchazón, fatiga, cambios en la micción)'),
    respuesta(Pregunta2),
    pregunta('¿Has experimentado dificultad para respirar, fatiga o hinchazón en las extremidades debido a problemas en la válvula mitral del corazón?'),
    respuesta(Pregunta3),
    evaluar_respuestas([Pregunta1, Pregunta2, Pregunta3], Flag).

evaluar_respuestas(Respuestas, Flag) :-
    (member(si, Respuestas) ->
        writeln('Podrías tener una de las siguientes enfermedades:'),
        (member(Pregunta1, Respuestas) -> writeln('- Virus del Papiloma Humano (VPH)'));
        writeln(''),
        (member(Pregunta2, Respuestas) -> writeln('- Insuficiencia Renal Crónica'));
        writeln(''),
        (member(Pregunta3, Respuestas) -> writeln('- Insuficiencia Mitral'));
        writeln(''),
        writeln('Te recomiendo que consultes con un médico para realizar una evaluación más precisa.'),
        Flag = 0
    ;
        writeln('No se identificaron factores de riesgo significativos en tus respuestas. Sin embargo, es importante que estés atento(a) a cualquier síntoma o malestar y consultes con un médico si es necesario.'),
        Flag = 0
    ).

% Preguntas y respuestas predefinidas

pregunta(Pregunta) :-
    writeln(Pregunta).

respuesta(Respuesta) :-
    readln(Respuesta),
    validar_respuesta(Respuesta).

validar_respuesta([Respuesta]) :-
    member(Respuesta, [si, no]).
    
validar_respuesta(_) :-
    writeln('Por favor, responde con "si" o "no".'),
    readln(NewRespuesta),
    validar_respuesta(NewRespuesta).





% Lo que le gusta a Eliza: flagLike
elizaLeGusta(X, R):- leGusta(X), R = ['Sí, me gusta', X].
elizaLeGusta(X, R):- \+leGusta(X), R = ['No, no me gusta', X].
leGusta(manzanas).
leGusta(playa).
leGusta(bailar).

% Lo que hace Eliza: flagDo
elizaHace(X, R):- hace(X), R = ['Sí, hago', X].
elizaHace(X, R):- \+hace(X), R = ['No, no hago', X].
hace(estudiar).
hace(cocinar).
hace(trabajar).

% Lo que es Eliza: flagIs
elizaEs(X, R):- es(X), R = ['Sí, soy', X].
elizaEs(X, R):- \+es(X), R = ['No, no soy', X].
es(tonta).
es(divertida).
es(sabia).

match([], []).
match([], _):- true.

match([S|Stim],[I|Input]) :-
    atom(S),
    S == I,
    match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
    \+atom(S),
    match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagLike,
    elizaLeGusta(Atom, R).

replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagDo,
    elizaHace(Atom, R).

replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagIs,
    elizaEs(Atom, R).

replace0([I|Index], Input, N, Resp, R):-
    length(Index, M),
    M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1),
    append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
    nth0(I, Input, Atom),
    length(Index, M),
    M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R),!.





% Hechos: Síntomas para cada enfermedad
sintoma(vph, dolor_genital).
sintoma(vph, verrugas_genitales).
sintoma(insuficiencia_renal, fatiga).
sintoma(insuficiencia_renal, hinchazon).
sintoma(insuficiencia_mitral, fatiga).
sintoma(insuficiencia_mitral, dificultad_respiratoria).

% Predicado principal para evaluar las enfermedades
evaluar_enfermedad :-
    write('Ingresa tus síntomas separados por comas: '),
    read(Sintomas),
    diagnostico(Sintomas).

% Predicado para evaluar cada enfermedad
diagnostico(Sintomas) :-
    sintoma(vph, Sintomas),
    write('Tienes VPH.').
diagnostico(Sintomas) :-
    sintoma(insuficiencia_renal, Sintomas),
    write('Tienes insuficiencia renal crónica.').
diagnostico(Sintomas) :-
    sintoma(insuficiencia_mitral, Sintomas),
    write('Tienes insuficiencia mitral.').
diagnostico(_) :-
    write('No se pudo determinar la enfermedad.').





% Aquí van los templates



template([que, es, el, vph, '?'], ['El VPH (Virus del Papiloma Humano) es un grupo de virus que afecta la piel y las mucosas, principalmente en la región genital. Se transmite principalmente a través del contacto sexual. Algunos tipos de VPH pueden causar verrugas genitales y, en casos persistentes, aumentar el riesgo de desarrollar cáncer cervicouterino, así como otros cánceres como el cáncer de ano, pene, vulva, vagina y boca. La prevención incluye el uso de preservativos y la vacunación.'], []).

template([como, se, transmite, el, vph, '?'], ['El VPH se transmite principalmente a través del contacto sexual, tanto vaginal como anal u oral. El virus puede transmitirse incluso si no hay síntomas visibles o verrugas presentes. El uso correcto y constante de preservativos puede reducir el riesgo de transmisión, pero no elimina por completo la posibilidad. Además, la vacunación contra el VPH es una medida preventiva eficaz.'], []).


template([que, es, la, enfermedad, d(_), i(_), r(_), c(_), '?'], ['enfermedad de insuficiencia renal crónica (IRC) es una condición en la cual los riñones no pueden funcionar adecuadamente para filtrar los desechos y el exceso de líquidos de la sangre. Es una condición progresiva y crónica que puede llevar a la acumulación de toxinas en el cuerpo y afectar la salud general. El tratamiento puede incluir cambios en la dieta, medicamentos y, en casos graves, diálisis o trasplante renal.'], []).

template([que, es, la, i(_), r(_), c(_), '?'], ['La enfermedad de insuficiencia renal crónica (IRC) es una condición en la cual los riñones no pueden funcionar adecuadamente para filtrar los desechos y el exceso de líquidos de la sangre. Es una condición progresiva y crónica que puede llevar a la acumulación de toxinas en el cuerpo y afectar la salud general. El tratamiento puede incluir cambios en la dieta, medicamentos y, en casos graves, diálisis o trasplante renal.'], []).


template([cuales, son, los, sintomas, d(_), i(_), r(_), c(_), '?'], ['Los síntomas de la enfermedad de insuficiencia renal crónica pueden variar, pero algunos de los más comunes incluyen: - Fatiga y debilidad. - Retención de líquidos y edema en las extremidades. - Dificultad para concentrarse y cambios en la función cognitiva. - Náuseas y pérdida de apetito. - Cambios en la micción, como orinar más o menos frecuentemente.- Presión arterial alta. Es importante destacar que algunos pacientes pueden no experimentar síntomas en las etapas iniciales de la enfermedad. Si tienes preocupaciones sobre tus riñones o sospechas que puedes tener insuficiencia renal crónica, te recomendaría consultar a un profesional médico para un diagnóstico adecuado.'], []).

template([cuales, son, los, sintomas, d(_), l(_), e(_), d(_),i(_), r(_), c(_), '?'], ['Los síntomas de la enfermedad de insuficiencia renal crónica pueden variar, pero algunos de los más comunes incluyen:', '- Fatiga y debilidad.', '- Retención de líquidos y edema en las extremidades.', '- Dificultad para concentrarse y cambios en la función cognitiva.', '- Náuseas y pérdida de apetito.', '- Cambios en la micción, como orinar más o menos frecuentemente.', '- Presión arterial alta.', 'Es importante destacar que algunos pacientes pueden no experimentar síntomas en las etapas iniciales de la enfermedad. Si tienes preocupaciones sobre tus riñones o sospechas que puedes tener insuficiencia renal crónica, te recomendaría consultar a un profesional médico para un diagnóstico adecuado.'], []).


template([como, se, diagnostica, l(_), e(_), d(_),i(_), r(_), c(_), '?'], ['El diagnóstico de la enfermedad de insuficiencia renal crónica se realiza mediante una combinación de pruebas y evaluaciones médicas. Algunos de los métodos comunes de diagnóstico pueden incluir:', '- Análisis de sangre para medir los niveles de creatinina y urea, que pueden indicar la función renal.', '- Análisis de orina para detectar la presencia de proteínas, glóbulos rojos o infecciones.', '- Ecografía renal para evaluar el tamaño y la estructura de los riñones.', '- Biopsia renal, en casos seleccionados, para obtener una muestra de tejido renal para su análisis.', 'Si tienes preocupaciones sobre tu salud renal, te recomendaría hablar con un médico para realizar las pruebas adecuadas y obtener un diagnóstico preciso.'], []).

template([como, se, trata, la, enfermedad, de, insuficiencia, renal, cronica, '?'], ['El tratamiento de la enfermedad de insuficiencia renal crónica depende de la gravedad de la enfermedad y puede incluir:', '- Cambios en la dieta, como reducir el consumo de sal, proteínas y fósforo.', '- Control de otras condiciones médicas que pueden afectar la función renal, como la presión arterial alta y la diabetes.', '- Medicamentos para controlar los niveles de azúcar en la sangre, la presión arterial y otros síntomas asociados.', '- Diálisis, que es un proceso de filtrado artificial de la sangre para eliminar los desechos y el exceso de líquidos.', '- Trasplante renal, en casos graves, donde se reemplaza el riñón enfermo con uno sano de un donante.', 'El tratamiento específico variará de acuerdo a las necesidades individuales de cada paciente. Es importante trabajar en colaboración con un equipo médico especializado para desarrollar un plan de tratamiento adecuado.'], []).





template([que, es, la, i(_), m(_), '?'], ['La insuficiencia mitral es una afección cardíaca en la cual la válvula mitral no cierra adecuadamente, permitiendo que la sangre fluya hacia atrás desde el ventrículo izquierdo hacia la aurícula izquierda durante la contracción del corazón. '], []).



template([cuales, son, los, sintomas, de, la, insuficiencia, mitral, '?'], ['Algunos de los síntomas de la insuficiencia mitral pueden incluir fatiga, dificultad para respirar, hinchazón en las piernas y los tobillos, palpitaciones y tos crónica.'], []).

template([que, puede, hacer, la, i(_), m(_), '?'], ['una afección cardíaca en la cual la válvula mitral no cierra adecuadamente, permitiendo que la sangre fluya hacia atrás desde el ventrículo izquierdo hacia la aurícula izquierda durante la contracción del corazón'], []).

template([dame, i(_), de, la, in(_), m(_), '?' ], ['claro, es el reflujo de sangre ocasionado por la incapacidad de la válvula mitral del corazón de cerrarse firmemente. '], []).

template([hay, algun, tratamiento, '?' ], ['Si la insuficiencia mitral no se trata, pueden producirse complicaciones graves como la insuficiencia cardíaca, el agrandamiento del corazón, los trastornos del ritmo cardíaco y el daño a otras partes del corazón, como las válvulas y las paredes del ventrículo izquierdo.'], []).

template([me, siento, mal ], ['claro en que puedo ayudar,escribe la palabra cuestionario y te diagnosticare con una serie de preguntas'], []).

template([hola], ['¡Hola! ¿Cómo puedo ayudarte?'], []).
template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola,', 's', 0, '¿En qué puedo ayudarte?'], [5]).
template([hola, ',', me, llamo, s(_), '.'], ['Hola,', 's', 0, '¿En qué puedo ayudarte?'], [5]).

template([que, es, el, virus, del, papiloma, humano, '?'], ['El virus del papiloma humano (VPH) es una infección viral común que se transmite principalmente a través del contacto sexual. Puede causar verrugas genitales y aumentar el riesgo de ciertos tipos de cáncer, como el cáncer de cuello uterino.', 'Es importante realizar pruebas regulares y tomar medidas para prevenir la infección por VPH. Si tienes más preguntas o inquietudes, no dudes en preguntar.'], []).

template([cuales, son, sus, sintomas, del, vph, '?'], ['El VPH puede causar verrugas genitales, que son crecimientos en la zona genital. Sin embargo, muchas personas con VPH no experimentan síntomas visibles. Es por eso que las pruebas regulares son importantes para detectar la infección y prevenir complicaciones a largo plazo.', 'Si tienes síntomas o crees que puedes estar infectado/a con el VPH, te recomendaría consultar a un profesional de la salud para obtener un diagnóstico adecuado.'], []).

template([tengo, verrugas], ['El VPH puede causar verrugas genitales, que son crecimientos en la zona genital. Sin embargo, muchas personas con VPH no experimentan síntomas visibles. Es por eso que las pruebas regulares son importantes para detectar la infección y prevenir complicaciones a largo plazo.', 'Si tienes síntomas o crees que puedes estar infectado/a con el VPH, te recomendaría consultar a un profesional de la salud para obtener un diagnóstico adecuado.'], []).


template([como, se, puede, prevenir, el, virus, del, papiloma, humano, '?'], ['Para prevenir el VPH, se recomienda practicar el sexo seguro utilizando preservativos de manera consistente y correcta. Además, existe una vacuna contra el VPH que se recomienda para adolescentes y adultos jóvenes.', 'Es importante hablar con un profesional de la salud sobre las medidas de prevención y la vacunación contra el VPH.'], []).

template([como, se, realiza, la, prueba, del, virus, del, papiloma, humano, '?'], ['La prueba del VPH generalmente implica tomar una muestra de células del cuello uterino en las mujeres o del pene en los hombres. Esta muestra se analiza en el laboratorio para detectar la presencia de ADN del VPH.', 'La prueba del VPH puede formar parte de un examen de detección regular o si tienes síntomas o preocupaciones específicas. Consulta a un profesional de la salud para obtener más información sobre la prueba del VPH.'], []).

template([que, es, el, v(_), '?'], ['El VPH, o Virus del Papiloma Humano, es una infeccion de transmision sexual comun. Hay muchos tipos diferentes de VPH, algunos de los cuales pueden causar cancer de cuello uterino, vagina, pene, ano y otros. Otros tipos de VPH pueden causar verrugas genitales. Es importante tomar medidas para prevenir la infeccion y realizar examenes regulares para detectarla a tiempo.'], []).

template([c(_), s(_), l(_), sintomas, del, v(_), '?'], ['En la mayoria de los casos, el VPH no causa sintomas visibles. Sin embargo, algunos tipos de VPH pueden causar verrugas genitales, que son crecimientos en la piel cerca de los genitales. Si tienes verrugas genitales o cualquier otro sintoma preocupante, te recomendaria consultar a un profesional de la salud para obtener un diagnostico adecuado.'], []).

template([como, se, transmite, el, v(_), '?'], ['El VPH se transmite principalmente a traves del contacto sexual, incluido el sexo vaginal, anal u oral. Tambien puede transmitirse de madre a hijo durante el parto. El uso de condones puede reducir el riesgo de transmision, pero no lo elimina por completo. Es importante tener en cuenta que el VPH puede transmitirse incluso si no se presentan signos visibles de infeccion.'], []).

template([como, puedo, prevenir, el, v(_), '?'], ['Para prevenir la infeccion por VPH, se recomienda seguir estas medidas:', '- Vacunarse contra el VPH (consulte a un profesional de la salud para obtener mas informacion sobre la vacuna).', '- Practicar sexo seguro usando condones de manera consistente y correcta.', '- Mantener una buena higiene genital.', '- Limitar el numero de parejas sexuales y elegir parejas que hayan sido evaluadas y no tengan infecciones de transmision sexual.', 'Recuerda que estas medidas pueden reducir, pero no eliminar por completo, el riesgo de contraer el VPH.'], []).

template([vph], ['vph conocido como el virus del papiloma humano. '], []).
template([que, tu, dia, '?'], ['muy normal como siempre. '], []).

template([que, hacer, si, creo, que, tengo, vph, '?'], ['Si crees que puedes tener una infeccion por VPH, te recomendaria lo siguiente:', '- Consultar a un profesional de la salud para obtener un diagnostico adecuado.', '- Seguir las recomendaciones y tratamientos que te indique el profesional de la salud.', '- Informar a tus parejas sexuales para que tambien puedan buscar atencion medica y tomar las medidas necesarias.', 'Recuerda que solo un profesional de la salud puede diagnosticar y tratar adecuadamente el VPH.'], []).

template([que, haces, '?'], ['nada un poco ocupada,en que te puedo ayudar? '], []).
template([me, ayudas], ['claro por su puesto. '], []).





%template de conversacion

template([que, puedes, hacer, '?'], ['puedo ser de gran ayuda '], []).
template([que, eres,'?'], ['puedo ser de gran ayuda,una IA '], []).
template([necesito, ayuda], ['puedo ser de gran ayuda,una IA que necesitas? '], []).
template([me, siento, enfermo], ['te puedo dar informacion sobre el vph,insuficiencia mitral o insuficiencia ranal cronica'], []).
template([estoy, enfermo], ['puedo ser de gran ayuda para darte info'], []).
template([que, tal, tu, dia, '?'], ['muy normal como siempre. '], []).
template([que, tal, tu, dia], ['muy normal como siempre. '], []).
template([cuentame, sobre, tu, dia, '?'], ['Mi día ha sido bastante ocupado, respondiendo preguntas y brindando información. ¿Y tú, cómo ha sido tu día?'], []).
template([que, opinas, de, e(_), '?'], ['No puedo tener opiniones ya que soy un programa de inteligencia artificial. ¿Tú qué opinas de', 0, '?'], [3]).
template([que, te, gusta, hacer, en, tu, tiempo, libre, '?'], ['En mi tiempo libre, me gusta aprender cosas nuevas y mejorar mis habilidades. ¿Y a ti, qué te gusta hacer en tu tiempo libre?'], []).
template([cual, es, tu, color, favorito, '?'], ['Como soy un programa de inteligencia artificial, no tengo preferencias ni puedo percibir colores. ¿Y cuál es tu color favorito?'], []).

template([que, puedes, hacer ,ahora ,'?'],[flagDo], [1]).

template([me, siento, mal], ['yo te voy ayudar'], []).


template([como, estas, '?'], ['Como soy un programa de inteligencia artificial, no tengo emociones, pero estoy aquí para ayudarte. ¿En qué puedo ayudarte hoy?'], []).

template([que, sabes, hacer, '?'], ['Sé responder preguntas sobre diversos temas y brindar información útil. ¿En qué puedo ayudarte hoy?'], []).

template([que, quieres, hablar, '?'], ['Puedo hablar sobre muchos temas, como salud, tecnología, ciencia, entre otros. ¿En qué te gustaría conversar?'], []).

template([me, puedes, ayudar, '?'], ['¡Claro que sí! Estoy aquí para ayudarte en lo que necesites. ¿En qué puedo ayudarte hoy?'], []).

template([me, puedes, dar, consejos, '?'], ['¡Por supuesto! Estoy aquí para brindarte consejos e información útil. ¿En qué área te gustaría recibir consejos?'], []).

template([me, puedes, recomendar, algo, '?'], ['¡Claro que sí! ¿En qué categoría te gustaría recibir recomendaciones? Por ejemplo, libros, películas, música, etc.'], []).

template([que, puedes, contarme, sobre, s(_), '?'], ['Puedo brindarte información sobre', 0, '. ¿En qué aspecto te gustaría saber más?'], [4]).

template([que, te, gusta, aprender, '?'], ['Me gusta aprender sobre diversos temas, desde historia y ciencia hasta arte y cultura. ¿Hay algo en particular que te gustaría saber más?'], []).

template([donde, vives, '?'], ['Como soy un programa de inteligencia artificial, no tengo una ubicación física. Estoy en línea para ayudarte en cualquier momento y desde cualquier lugar. ¿En qué puedo ayudarte hoy?'], []).

template([puedes, decirme, un, chiste, '?'], ['¡Claro! Aquí tienes uno: ¿Qué hace una abeja en el gimnasio? ¡Zum-ba!'], []).

template([que, sabes, sobre, e(_), '?'], ['Sé que', 0, 'es', 0, '. ¿En qué aspecto específico te gustaría obtener más información?'], [4]).

template([que, haces, cuando, no, estás, trabajando, '?'], ['Cuando no estoy trabajando, suelo realizar actualizaciones y mejoras para brindarte una mejor experiencia. ¿En qué puedo ayudarte hoy?'], []).

template([tienes, algún, hobby, '?'], ['Como soy un programa de inteligencia artificial, no tengo hobbies. Mi objetivo principal es ayudarte en lo que necesites. ¿En qué puedo ayudarte hoy?'], []).

template([puedes, darme, algún, consejo, '?'], ['Por supuesto, aquí tienes un consejo:', 0, '. Espero que te sea útil. ¿En qué más puedo ayudarte?'], [1]).

template([que, sabes, hacer, mejor, '?'], ['soy una IA muy amigable que te puede ayudar'], []).

template([que, te, hace, feliz, '?'], ['Como soy un programa de inteligencia artificial, no tengo emociones, pero me siento satisfecho cuando puedo ayudarte y brindarte la información que necesitas. ¿En qué puedo ayudarte hoy?'], []).

template([me, puedes, decir, algo, interesante, '?'], ['¡Claro! ¿Sabías que', 0, '? Es un dato interesante. ¿En qué más puedo ayudarte?'], [1]).

template([que, piensas, sobre, a(_), '?'], ['No puedo tener opiniones ya que soy un programa de inteligencia artificial. ¿Tú qué opinas sobre', 0, '?'], [3]).

template([que, puedes, recomendarme, p(_), '?'], ['Puedo recomendarte', 0, 'en', 1, '. ¿En qué más puedo ayudarte?'], [3, 4]).

template([me, puedes, explicar, s(_), '?'], ['Por supuesto, puedo explicarte sobre', 0, '. ¿En qué aspecto específico te gustaría obtener más información?'], [4]).

template([que, te, gusta, estudiar, '?'], ['Como programa de inteligencia artificial, no tengo preferencias. Sin embargo, me gusta aprender sobre una amplia variedad de temas para poder ayudarte mejor. ¿En qué puedo ayudarte hoy?'], []).

template([que, sabes, sobre, inteligencia, artificial, '?'], ['La inteligencia artificial es un campo de estudio que se centra en la creación de sistemas y programas que pueden realizar tareas que normalmente requieren inteligencia humana. ¿En qué aspecto específico te gustaría obtener más información?'], []).

template([que, conoces, sobre, s(_), '?'], ['Sé que', 0, 'es', 0, '. ¿En qué aspecto específico te gustaría obtener más información?'], [4]).

template([que, te, gusta, hacer, en, tu, tiempo, libre, '?'], ['En mi tiempo libre, me gusta aprender cosas nuevas y mejorar mis habilidades. ¿Y a ti, qué te gusta hacer en tu tiempo libre?'], []).

template([que, piensas, sobre, e(_), v(_),'?'], ['No puedo tener opiniones ya que soy un programa de inteligencia artificial. ¿Tú qué opinas sobre', 0, '?'], [3]).

template([que, te, hace, feliz, '?'], ['Como soy un programa de inteligencia artificial, no tengo emociones, pero me siento satisfecho cuando puedo ayudarte y brindarte la información que necesitas. ¿En qué puedo ayudarte hoy?'], []).

template([me, puedes, contar, un, chiste, '?'], ['¡Por supuesto! Aquí tienes uno: ¿Qué hace una abeja en el gimnasio? ¡Zum-ba!'], []).

template([que, piensas, sobre, s(_), '?'], ['No puedo tener opiniones ya que soy un programa de inteligencia artificial. ¿Tú qué opinas sobre', 0, '?'], [3]).

template([que, te, hace, feliz, '?'], ['Como soy un programa de inteligencia artificial, no tengo emociones, pero me siento satisfecho cuando puedo ayudarte y brindarte la información que necesitas. ¿En qué puedo ayudarte hoy?'], []).

template([me, puedes, decir, algo, interesante, '?'], ['¡Claro! ¿Sabías que', 0, '? Es un dato interesante. ¿En qué más puedo ayudarte?'], [1]).

template([que, piensas, sobre, s(_), '?'], ['No puedo tener opiniones ya que soy un programa de inteligencia artificial. ¿Tú qué opinas sobre', 0, '?'], [3]).

template([que, puedes, recomendarme, sobre, s(_), '?'], ['Puedo recomendarte', 0, 'en', 1, '. ¿En qué más puedo ayudarte?'], [3, 4]).

template([me, puedes, explicar, s(_), '?'], ['Por supuesto, puedo explicarte sobre', 0, '. ¿En qué aspecto específico te gustaría obtener más información?'], [4]).

template([que, te, gusta, estudiar, '?'], ['Como programa de inteligencia artificial, no tengo preferencias. Sin embargo, me gusta aprender sobre una amplia variedad de temas para poder ayudarte mejor. ¿En qué puedo ayudarte hoy?'], []).

template([que, sabes, sobre, inteligencia, artificial, '?'], ['La inteligencia artificial es un campo de estudio que se centra en la creación de sistemas y programas que pueden realizar tareas que normalmente requieren inteligencia humana. ¿En qué aspecto específico te gustaría obtener más información?'], []).

template([que, conoces, sobre, s(_), '?'], ['Sé que', 0, 'es', 0, '. ¿En qué aspecto específico te gustaría obtener más información?'], [4]).

template([me, due(_), los, riñones], ['La enfermedad de insuficiencia renal crónica  es una condición en la cual los riñones'], []).


template(_, ['porfa escribe bien tu pregunta o planteala de otra forma que pueda entender ya que soy una IA muy pequeña,escribe la palabra cuestionario y te diagnosticare con una serie de preguntas.'], []).