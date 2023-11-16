% Definición de match/2
match([], _).
match([Word|Rest], Input) :-
    atom(Word),
    member(Word, Input),
    match(Rest, Input).

chichiki:-	writeln('Hola, soy Chichiki,
	dime como te sientes hoy,
	recuerda utilizar minusculas y terminar con punto cada oracion:'),
	readln(Input),
	eliza(Input),!.
	
	eliza(Input):- Input == ['bye'],
	writeln('Goodbye. I hope I have helped you.'), !.
	eliza(Input):- Input == ['bye', '.'],
	writeln('Goodbye. I hope I have helped you.'), !.
	eliza(Input):- Input == ['Adios'],
	writeln('Sale papito, te la lavas.'), !.
	eliza(Input):- Input == ['Adios', '.'],
	writeln('Camara ahi nos vemos.'), !.


	eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.


%Lupus - Preguntas simples por informacion
template([lupus, _], ['Es una enfermedad cronica autoinmune que puede afectar a diferentes partes del cuerpo. En una enfermedad autoinmune, el sistema inmunologico, que normalmente protege al cuerpo contra bacterias, virus y otras sustancias dañinas, se vuelve hiperactivo y ataca los tejidos y organos sanos del cuerpo.'],[]).
template([africanos],['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia africana.'],[]).
template([regiones], ['El lupus puede afectar a personas de todas las etnias y en cualquier parte del mundo. Sin embargo, se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia africana, hispana, asiatica y nativa americana. Ademas, se han identificado factores genéticos y ambientales que pueden influir en la susceptibilidad al lupus. Algunos estudios sugieren que la exposicion a ciertos factores ambientales, como la luz solar intensa y ciertos medicamentos, puede desencadenar o empeorar los sintomas del lupus en personas geneticamente susceptibles.'],[]).
template([asiatica], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia asiatica.'],[]).
template([hispano], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia hispana.'],[]).
template([nativa-americana], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia nativa americana.'],[]).
template([recomendaciones], ['Es importante llevar un estilo de vida saludable, que incluya descanso adecuado, una dieta equilibrada, protección solar, actividad física regular y evitar el estrés excesivo. Siempre es recomendable trabajar en estrecha colaboración con un equipo médico especializado para el diagnóstico, tratamiento y manejo del lupus, ya que cada caso es único y requiere un enfoque individualizado.'],[]).
template([contagioso], ['Es importante destacar que el lupus no es una enfermedad contagiosa. No se transmite de una persona a otra a través del contacto directo. Es una enfermedad autoinmune en la que el sistema inmunológico del propio cuerpo ataca los tejidos y órganos sanos. La causa exacta del lupus aun no se comprende completamente y se necesita mas investigación para determinar todos los factores involucrados en su desarrollo.'],[]).

template([lupus, _], ['Es una enfermedad cronica autoinmune que puede afectar a diferentes partes del cuerpo. En una enfermedad autoinmune, el sistema inmunologico, que normalmente protege al cuerpo contra bacterias, virus y otras sustancias dañinas, se vuelve hiperactivo y ataca los tejidos y organos sanos del cuerpo.'],[]).
template([regiones, _], ['El lupus puede afectar a personas de todas las etnias y en cualquier parte del mundo. Sin embargo, se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia africana, hispana, asiatica y nativa americana. Ademas, se han identificado factores genéticos y ambientales que pueden influir en la susceptibilidad al lupus. Algunos estudios sugieren que la exposicion a ciertos factores ambientales, como la luz solar intensa y ciertos medicamentos, puede desencadenar o empeorar los sintomas del lupus en personas geneticamente susceptibles.'],[]).
template([africanos, _], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia africana.'],[]).
template([hispano, _], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia hispana.'],[]).
template([asiatica, _], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia asiatica.'],[]).
template([nativa-americana, _], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia nativa americana.'],[]).
template([recomendaciones, _], ['Es importante llevar un estilo de vida saludable, que incluya descanso adecuado, una dieta equilibrada, protección solar, actividad física regular y evitar el estrés excesivo. Siempre es recomendable trabajar en estrecha colaboración con un equipo médico especializado para el diagnóstico, tratamiento y manejo del lupus, ya que cada caso es único y requiere un enfoque individualizado.'],[]).
template([contagioso, _], ['Es importante destacar que el lupus no es una enfermedad contagiosa. No se transmite de una persona a otra a través del contacto directo. Es una enfermedad autoinmune en la que el sistema inmunológico del propio cuerpo ataca los tejidos y órganos sanos. La causa exacta del lupus aun no se comprende completamente y se necesita mas investigación para determinar todos los factores involucrados en su desarrollo.'],[]).

template([que, es, el, lupus, _], ['Es una enfermedad cronica autoinmune que puede afectar a diferentes partes del cuerpo. En una enfermedad autoinmune, el sistema inmunologico, que normalmente protege al cuerpo contra bacterias, virus y otras sustancias dañinas, se vuelve hiperactivo y ataca los tejidos y organos sanos del cuerpo. '],[]).
template([sabes, que, es, el , lupus, _], ['Es una enfermedad cronica autoinmune que puede afectar a diferentes partes del cuerpo. En una enfermedad autoinmune, el sistema inmunologico, que normalmente protege al cuerpo contra bacterias, virus y otras sustancias dañinas, se vuelve hiperactivo y ataca los tejidos y organos sanos del cuerpo.'],[]).
template([en, que, razas, se, ve, mucho, el, lupus, _], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia africana, hispana, asiatica y nativa americana.'],[]).
template([afecta, los, nativos-americanaos, _], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia nativa americana.'],[]).
template([afecta, los, hispano, _], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia hispana.'],[]).
template([afecta, los, asiaticos, _], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia asiatica.'],[]).
template([afecta, los, africanos, _], ['Se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia africana'],[]).
template([hay, contagios, del, lupus, _], ['Es importante destacar que el lupus no es una enfermedad contagiosa. No se transmite de una persona a otra a través del contacto directo. Es una enfermedad autoinmune en la que el sistema inmunológico del propio cuerpo ataca los tejidos y órganos sanos. La causa exacta del lupus aun no se comprende completamente y se necesita mas investigación para determinar todos los factores involucrados en su desarrollo.'],[]).

template([en, que, personas, se, presenta, mas, el, lupus, _], ['El lupus puede afectar a personas de todas las etnias y en cualquier parte del mundo. Sin embargo, se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia africana, hispana, asiatica y nativa americana. Ademas, se han identificado factores genéticos y ambientales que pueden influir en la susceptibilidad al lupus. Algunos estudios sugieren que la exposicion a ciertos factores ambientales, como la luz solar intensa y ciertos medicamentos, puede desencadenar o empeorar los sintomas del lupus en personas geneticamente susceptibles.'],[]).
template([hay, alguna, incidencia, dependiendo, de, la, etnia, _], ['El lupus puede afectar a personas de todas las etnias y en cualquier parte del mundo. Sin embargo, se ha observado una mayor incidencia de lupus en ciertas poblaciones, como las personas de ascendencia africana, hispana, asiatica y nativa americana. Ademas, se han identificado factores genéticos y ambientales que pueden influir en la susceptibilidad al lupus. Algunos estudios sugieren que la exposición a ciertos factores ambientales, como la luz solar intensa y ciertos medicamentos, puede desencadenar o empeorar los sintomas del lupus en personas geneticamente susceptibles.'],[]).
template([el, lupus, es, contagioso, _], ['Es importante destacar que el lupus no es una enfermedad contagiosa. No se transmite de una persona a otra a través del contacto directo. Es una enfermedad autoinmune en la que el sistema inmunológico del propio cuerpo ataca los tejidos y órganos sanos. La causa exacta del lupus aun no se comprende completamente y se necesita mas investigación para determinar todos los factores involucrados en su desarrollo.'],[]).
template([que, mas, datos, hay, del, lupus, _], ['El lupus es una enfermedad compleja que puede afectar diferentes partes del cuerpo, por lo que el tratamiento y el manejo del lupus a menudo requieren la participación de varios especialistas.'],[]).
template([me, puedes, dar, algunas, recomendaciones, _], ['Es importante llevar un estilo de vida saludable, que incluya descanso adecuado, una dieta equilibrada, protección solar, actividad física regular y evitar el estrés excesivo. Siempre es recomendable trabajar en estrecha colaboración con un equipo médico especializado para el diagnóstico, tratamiento y manejo del lupus, ya que cada caso es único y requiere un enfoque individualizado.'],[]).
template([hay, factores, que, hagan, que, el, lupus, pueda estar, presente, _], ['Si, claro hay factores como los factores ambientales, hormonales, geneticos o incluso alguna desregulacion del sistema inmunologio que hace que si hay algun presendente hereditario del lupus, pueda activarse ese gen que empezara a desarrollar esta enfermedad.'],[]).
template([cuales, son, los, factores, ambientales, que , hacen, que, el, lupus, se, vuelva, presente, _], ['Existen ciertos factores ambientales que se han asociado con un mayor riesgo de desarrollar lupus. Estos incluyen la exposición a la luz solar intensa, ciertos medicamentos (como algunos antibióticos y antiepilépticos), infecciones virales y bacterianas, y ciertos productos químicos y toxinas.'],[]).
template([cuales, son, los, factores, geneticos, que , hacen, que, el, lupus, se, vuelva, presente, _], ['Existe evidencia de que hay una predisposición genética para desarrollar lupus. Algunos genes específicos están relacionados con un mayor riesgo de lupus, aunque no se ha identificado un solo gen responsable de la enfermedad.'],[]).
template([cuales, son, los, factores, de, desregulación, del, sistema, inmunológico, que , hacen, que, el, lupus, se, vuelva, presente, _], ['En el lupus, el sistema inmunológico se vuelve hiperactivo y ataca los tejidos y órganos sanos del cuerpo. Se cree que esta desregulación del sistema inmunológico es un factor clave en el desarrollo de la enfermedad, pero los mecanismos exactos aún no se conocen por completo.'],[]).
template([cuales, son, los, factores, hormonales, que , hacen, que, el, lupus, se, vuelva, presente, _], ['Se ha observado una mayor incidencia de lupus en mujeres en edad fértil, lo que sugiere un posible papel de las hormonas, como los estrógenos, en el desarrollo de la enfermedad. Los cambios hormonales, como los que ocurren durante el embarazo o en el inicio de la menopausia, pueden desencadenar o exacerbar los síntomas del lupus.'],[]).

	%Sintomas - Lupus
		template([si, tengo, dolor, de , s(_), es, sintoma, del, lupus, _], [flagSintomas], [4]).
		template([si, tengo, s(_), es, sintoma, de, lupus, _], [flagSintomas], [2]).
		template([si, tengo, erupciones, s(_), es, sintoma, de, lupus, _], [flagSintomas], [3]).
		template([si, tengo, una, s(_), es, sintoma, de, lupus, _], [flagSintomas], [3]).
		template([si, tengo, s(_), es, sintoma, de, lupus, _], [flagSintomas], [2]).

		template([cuales, son, algunos, de, los, sintomas, del, lupus, _], ['Algunos de los sintomas son fatiga extrema, erupciones cutaneas, dolor e inflamacion en articulaciones, problemas renales, problemas cardiovasculares, problemas neurologicos, problemas pulmonares y problemas gastrointestinales.'],[]).

	%Tratamiento - Lupus
		template([Tratamiento], ['El tratamiento del Lupus dependera, si es tratado a tiempo o no, usualmente el tratamiento del lupus lo realizan distintos de medicos con diferente especialidad, despues de esto se da un tratamiento donde se recetan medicamentos antinflamatorios, antimalaricos, corticosteroides e inmunosupresores. '],[]).
		template([Tratamiento, _], ['El tratamiento del Lupus dependera, si es tratado a tiempo o no, usualmente el tratamiento del lupus lo realizan distintos de medicos con diferente especialidad, despues de esto se da un tratamiento donde se recetan medicamentos antinflamatorios, antimalaricos, corticosteroides e inmunosupresores. '],[]).
		template([hay, algun, tratamiento, para, el lupus, _], ['El tratamiento del Lupus dependera, si es tratado a tiempo o no, usualmente el tratamiento del lupus lo realizan distintos de medicos con diferente especialidad, despues de esto se da un tratamiento donde se recetan medicamentos antinflamatorios, antimalaricos, corticosteroides e inmunosupresores. '],[]).
		template([como, se trata, el, lupus, _], ['El tratamiento del Lupus dependera, si es tratado a tiempo o no, usualmente el tratamiento del lupus lo realizan distintos de medicos con diferente especialidad, despues de esto se da un tratamiento donde se recetan medicamentos antinflamatorios, antimalaricos, corticosteroides e inmunosupresores. '],[]).
		template([cual, es, el, tratamiento, para, el, lupus, _], ['El tratamiento del Lupus dependera, si es tratado a tiempo o no, usualmente el tratamiento del lupus lo realizan distintos de medicos con diferente especialidad, ya sean reumatologos, dermatologos, nefrologo, cardiologo, neurologo, gastroenterologo, despues de esto se da un tratamiento donde se recetan medicamentos antinflamatorios, antimalaricos, corticosteroides e inmunosupresores. '],[]).
		template([para, que, sirven, los, antinflamatorios, en, el, tratamiento, del, lupus, _], ['Ayudan a aliviar el dolor y la inflamación en las articulaciones.'],[]).
		template([para, que, sirven, los, antimalaricos, en, el, tratamiento, del, lupus, _], ['Pueden ayudar a controlar los síntomas cutáneos y articulares, así como a prevenir brotes.'],[]).
		template([para, que, sirven, los, corticosteroides, en, el, tratamiento, del, lupus, _], ['Se utilizan para reducir la inflamación y suprimir la respuesta inmune hiperactiva. Se prescriben en dosis bajas y por períodos limitados debido a los posibles efectos secundarios a largo plazo.'],[]).
		template([para, que, sirven, los, inmunosupresores, en, el, tratamiento, del, lupus, _], ['Se utilizan para suprimir el sistema inmunológico y controlar la respuesta autoinmune. Estos medicamentos pueden ser necesarios en casos más graves de lupus o cuando otros medicamentos no son suficientes.'],[]).
		
	%Especialistas - Lupus
		template([cual, es, la, funcion, del, reumatologo, en, el, tratamiento, del, lupus, _], ['Especialista en enfermedades reumáticas y trastornos del sistema musculoesquelético. El reumatólogo es el médico especializado en el diagnóstico y tratamiento del lupus y juega un papel central en el manejo de la enfermedad.'],[]).
		template([cual, es, la, funcion, del, dermatologo, en, el, tratamiento, del, lupus, _], ['Especialista en enfermedades de la piel. Puede tratar las erupciones cutáneas asociadas con el lupus y proporcionar recomendaciones para el cuidado de la piel.'],[]).
		template([cual, es, la, funcion, del, nefrologo, en, el, tratamiento, del, lupus, _], ['Especialista en enfermedades renales. Si el lupus afecta los riñones, el nefrólogo puede ayudar en el diagnóstico y tratamiento de los problemas renales.'],[]).
		template([cual, es, la, funcion, del, cardiologo, en, el, tratamiento, del, lupus, _], ['Especialista en enfermedades del corazón y el sistema cardiovascular. El cardiólogo puede evaluar y tratar problemas cardíacos asociados con el lupus.'],[]).
		template([cual, es, la, funcion, del, neurologo, en, el, tratamiento, del, lupus, _], ['Especialista en enfermedades del sistema nervioso. Si el lupus afecta el sistema nervioso, el neurólogo puede evaluar y tratar síntomas como dolores de cabeza, entumecimiento, mareos y problemas de memoria.'],[]).
		template([cual, es, la, funcion, del, gastroenterologo, en, el, tratamiento, del, lupus, _], ['Especialista en enfermedades del sistema digestivo. Si el lupus afecta el tracto gastrointestinal, el gastroenterólogo puede ayudar en el diagnóstico y tratamiento de los problemas gastrointestinales.'],[]).

	elizaSintomas(X, R) :-
    	sintomas(X),
    	(
		X = fatiga, R = ['La fatiga es uno de los síntomas más comunes del lupus y puede ser debilitante. Para más informacion consulte a su medico.'];
        X = erupciones, R = ['Muchas personas con lupus experimentan erupciones en la piel, especialmente en las mejillas y el puente de la nariz. Estas erupciones pueden ser en forma de mariposa y son sensibles a la luz solar.Para más informacion consulte a su medico.'];
        X = articulaciones, R = ['El lupus puede causar dolor en las articulaciones y la inflamación, similar a la artritis. Las articulaciones afectadas pueden estar calientes, hinchadas y dolorosas.Para más informacion consulte a su medico.'];
        X = renales, R = ['El lupus puede afectar los riñones y causar daño renal. Los síntomas pueden incluir sangre en la orina, aumento de la presión arterial, hinchazón en las extremidades y necesidad frecuente de orinar.Para más informacion consulte a su medico.'];
		X = cardiovasculares, R = ['El lupus puede aumentar el riesgo de enfermedad cardiovascular, como inflamación del corazón, vasos sanguíneos o membranas que rodean el corazón.Para más informacion consulte a su medico.'];
		X = pulmonares, R = ['Algunas personas con lupus pueden experimentar dificultad para respirar, dolor en el pecho o inflamación de los pulmones.Para más informacion consulte a su medico.'];
		X = neurologicos, R = ['El lupus puede afectar el sistema nervioso y causar síntomas como dolores de cabeza, mareos, entumecimiento, hormigueo, cambios de humor y problemas de memoria.Para más informacion consulte a su medico.'];
		X = gastrointestinales, R = ['Algunas personas con lupus pueden experimentar dolor abdominal, náuseas, vómitos y pérdida de apetito.Para más informacion consulte a su medico.'];

        
        R = ['Sí, el dolor de', X, 'puede ser un síntoma del lupus.']
    ).

	elizaSintomas(X, R):- \+sintomas(X), R = [al, parecer, el, sintoma, X , no, es, sintoma, de, lupus].

	sintomas(fatiga).
	sintomas(erupciones).
	sintomas(articulaciones).
	sintomas(renales).
	sintomas(cardiovasculares).
	sintomas(pulmonares).
	sintomas(neurologicos).
	sintomas(gastrointestinales).


%Prostatitis - Preguntas simples señálando informacion

template([prostatitis], ['La prostatitis es una condición médica que se refiere a la inflamación de la glándula prostática. La glándula prostática es una pequeña glándula ubicada debajo de la vejiga en los hombres. Produce semen, el líquido que transporta los espermatozoides.'], []).

template([prostatitis, que, es, _], ['La prostatitis es una condición médica que se refiere a la inflamación de la glándula prostática. La glándula prostática es una pequeña glándula ubicada debajo de la vejiga en los hombres. Produce semen, el líquido que transporta los espermatozoides.'], []).
template([variacion, de, la, prostatitis, _], ['Si, hay distintas variaciones de la prostatitis, estas pueden ser prostatitis bacteriana aguda, prostatitis bacteriana crónica, prostatitis crónica/pélvica no bacteriana, prostatitis inflamatoria asintomática.'], []).

template([que, es, la, prostatitis, _], ['La prostatitis es una condición médica que se refiere a la inflamación de la glándula prostática. La glándula prostática es una pequeña glándula ubicada debajo de la vejiga en los hombres. Produce semen, el líquido que transporta los espermatozoides.'], []).
template([prostatitis, variacion, _], ['Si, hay distintas variaciones de la prostatitis, estas pueden ser prostatitis bacteriana aguda, prostatitis bacteriana crónica, prostatitis crónica/pélvica no bacteriana, prostatitis inflamatoria asintomática.'], []).

template([sabes, que, es, la, prostatitis, _], ['La prostatitis es una condición médica que se refiere a la inflamación de la glándula prostática. La glándula prostática es una pequeña glándula ubicada debajo de la vejiga en los hombres. Produce semen, el líquido que transporta los espermatozoides.'], []).
template([hay, alguna, variacion, de, la, prostatitis, _], ['Si, hay distintas variaciones de la prostatitis, estas pueden ser prostatitis bacteriana aguda, prostatitis bacteriana crónica, prostatitis crónica/pélvica no bacteriana, prostatitis inflamatoria asintomática.'], []).

template([que, es, la, prostatitis, aguda, _], ['Este tipo de prostatitis es causada por una infección bacteriana. Por lo general, se desarrolla de forma repentina y puede causar síntomas como fiebre, escalofríos, dolor en el abdomen inferior o la espalda, micción frecuente, dolor o ardor al orinar y dificultad para vaciar la vejiga.'], []).
template([que, es, la, prostatitis, bacteriana, cronica, _], ['Es una infección recurrente de la glándula prostática causada por bacterias. Tiene síntomas similares a la prostatitis bacteriana aguda, pero es de larga duración y puede presentar períodos de mejoría y empeoramiento.'], []).
template([que, es, la, prostatitis, cronica, o, pelvica, No, bacteriana, _], ['También conocida como síndrome de dolor pélvico crónico, esta forma de prostatitis no está asociada con una infección bacteriana identificable. Los síntomas incluyen dolor persistente en el área pélvica, dificultad para orinar, dolor al orinar, molestias en la zona genital y molestias durante las relaciones sexuales.'], []).
template([que, es, la, prostatitis, inflamatoria, asintomatica, _], ['En este tipo de prostatitis, no se presentan síntomas, pero hay evidencia de inflamación en la glándula prostática. A menudo, se detecta durante exámenes médicos de rutina.'], []).
template([como, es, posible, que, se, contraiga, la, prostatitis, aguda, ademas, de, la cronica, _], ['Infección ascendente es donde las bacterias pueden ingresar a la próstata desde la uretra, el conducto que transporta la orina desde la vejiga hacia el exterior del cuerpo. Esto puede ocurrir durante la actividad sexual, especialmente si no se utiliza protección o si hay contacto con áreas infectadas, o infección por bacterias circulantes donde Las bacterias pueden ingresar a la próstata a través del torrente sanguíneo desde otras partes del cuerpo que están infectadas, como el tracto urinario, el sistema digestivo o las vías respiratorias.'], []).
template([como, es, posible, que, se, contraiga, la, prostatitis, cronica, o, pelvica, _], ['Causa desconocida: En algunos casos, la prostatitis crónica/pélvica no bacteriana no se asocia directamente con una infección bacteriana identificable. Se cree que puede estar relacionada con factores inflamatorios o anormales en la próstata y el sistema inmunológico.'], []).
template([la,prostatitis, es, de, transmision, sexual _], ['La prostatitis no es una enfermedad de transmisión sexual en sí misma. Sin embargo, en algunos casos, las infecciones de transmisión sexual, como la gonorrea o la clamidia, pueden extenderse hacia la próstata y causar prostatitis. Además, existen factores de riesgo que pueden aumentar la probabilidad de contraer prostatitis, como una historia previa de prostatitis, infecciones recurrentes del tracto urinario, obstrucción del flujo urinario, lesiones o procedimientos médicos en el área de la próstata, y prácticas sexuales de riesgo.'], []).

		%Sintomas - Prostatitis
		
		template([si, tengo, dolor, de , s(_), es, sintoma, del, prostatitis, _], [flagSintomas], [4]).
		template([si, tengo, s(_), es, sintoma, de, prostatitis, _], [flagSintomas], [2]).
		template([si, tengo, en, la, parte, s(_), es, sintoma, de, prostatitis, _], [flagSintomas], [5]).
		template([si, tengo, una, s(_), es, sintoma, de, prostatitis, _], [flagSintomas], [3]).
		template([si, tengo, s(_), es, sintoma, de, prostatitis, _], [flagSintomas], [2]).	

		template([sintomas], ['Los síntomas de la prostatitis pueden variar según el tipo de prostatitis que se presente. A continuación, se mencionan algunos de los síntomas más comunes asociados con cada tipo de prostatitis'], []).
		template([sintomas,_], ['Los síntomas de la prostatitis pueden variar según el tipo de prostatitis que se presente. A continuación, se mencionan algunos de los síntomas más comunes asociados con cada tipo de prostatitis'], []).
		template([cuales, son, los, sintomas, de, la, prostatitis, aguda, _], ['Los sintomas son fiebre, escalofríos, dolor intenso en la zona perineal (entre el escroto y el ano) o en el área del recto, dolor o ardor al orinar, necesidad frecuente y urgente de orinar, dificultad para iniciar o detener el flujo de orina, sangre en la orina o en el semen.'], []).
		template([cuales, son, los, sintomas, de, la, prostatitis, bacteriana, cronica, _], ['Los sintomas son el dolor o malestar en la zona perineal o en el área del recto, que puede ser intermitente y durar más de tres meses, dolor o ardor al orinar, necesidad frecuente y urgente de orinar, dificultad para iniciar o detener el flujo de orina, dolor durante o después de la eyaculación, dolor en la parte baja de la espalda, la pelvis o los testículos.'], []).
		template([cuales, son, los, sintomas, de, la, prostatitis, cronica, o, pelvica, no, bacteriana, _], ['Dolor persistente en el área perineal, la parte baja de la espalda, la pelvis o los testículos, dolor o malestar durante la micción, necesidad frecuente y urgente de orinar, dificultad para vaciar completamente la vejiga, dolor durante o después de la eyaculación, dolor o malestar en el área genital o el recto.'], []).
		template([cuales, son, los, sintomas, de, la, prostatitis, inflamatoria, asintomatica, _], ['No se presentan síntomas evidentes, pero se detecta inflamación en la próstata durante exámenes médicos de rutina. Es importante destacar que los síntomas pueden variar en intensidad de una persona a otra, y algunos hombres pueden experimentar solo algunos de los síntomas mencionados. Si sospechas que puedes tener prostatitis, es recomendable que consultes a un médico para un diagnóstico adecuado y un plan de tratamiento apropiado.'], []).

		%Tratamiento - Prostatitis
		template([tratamiento, _], ['El tratamiento de la prostatitis dependera de su variacion, o su clasificacion, este tratamiento es dado por el medico especialistas que realiza la evaluacion para determinar que variacion se presenta en el afectado.'], []).
		template([en, que, consiste, el, tratamiento, de, la prostatitis, aguda, _], ['Su tratamiento es por medio de suministro de antibióticos, se prescriben antibióticos para combatir la infección bacteriana. El tipo de antibiótico y la duración del tratamiento dependerán de la bacteria específica identificada y la respuesta del paciente.'], []).
		template([cual, es, tratamiento, de, la, prostatitis, bacteriana, cronica, _], ['Su tratamiento es por medio de suministro de antibióticos, Antibióticos: Se puede utilizar un curso prolongado de antibióticos para eliminar la infección bacteriana persistente. Esto puede implicar tomar antibióticos durante varias semanas o incluso meses.'], []).
		template([cual, es, tratamiento, de, la, prostatitis, cronica, o, pelvica, no, bacteriana, _], ['Su tratamiento es por medio de suministro de antinflamatorios, Se pueden recetar medicamentos antiinflamatorios no esteroideos (AINE) para aliviar el dolor y la inflamación en la próstata y los tejidos circundantes. Relajantes musculares: En algunos casos, se pueden recetar relajantes musculares para aliviar los espasmos musculares en la zona pélvica.'], []).
		template([cual, es, tratamiento, de, la, prostatitis, inflamatoria, asintomatica, _], ['No se requiere tratamiento específico si no hay síntomas presentes. Sin embargo, el médico puede monitorear regularmente la condición para detectar cualquier cambio.'], []).
		template([que, recomendaciones, hay, para, una, persona, que padece, prostatitis, _], ['Se recomienda el reposo, baños de asiento tibios, hidratacion adecuada y el evitar irritantes.'], []).
		template([que, son, los, baños, de, asiento, tibio, _], ['Sumergirse en agua tibia puede proporcionar alivio del malestar y ayudar a relajar los músculos pélvicos.'], []).

		%Especialista - Prostatitis
		template([que, especialista, diagnostica, la prostatitis, _], ['El especialista médico que generalmente atiende y trata la prostatitis es un urólogo. Los urólogos son médicos especializados en el diagnóstico y tratamiento de enfermedades del sistema urinario, que incluye la próstata, los riñones, la vejiga, los uréteres y la uretra. Dado que la prostatitis afecta específicamente a la glándula prostática, un urólogo es el profesional adecuado para evaluar los síntomas, realizar el diagnóstico y recomendar el tratamiento apropiado.'], []).

elizaSintomas(Y, R) :-
    	sintomas(Y),
    	(
		Y = fatiga, R = ['La fatiga es uno de los síntomas más comunes del lupus y puede ser debilitante. Para más informacion consulte a su medico.'];
        Y = erupciones, R = ['Muchas personas con lupus experimentan erupciones en la piel, especialmente en las mejillas y el puente de la nariz. Estas erupciones pueden ser en forma de mariposa y son sensibles a la luz solar.Para más informacion consulte a su medico.'];
        Y = articulaciones, R = ['El lupus puede causar dolor en las articulaciones y la inflamación, similar a la artritis. Las articulaciones afectadas pueden estar calientes, hinchadas y dolorosas.Para más informacion consulte a su medico.'];
        Y = renales, R = ['El lupus puede afectar los riñones y causar daño renal. Los síntomas pueden incluir sangre en la orina, aumento de la presión arterial, hinchazón en las extremidades y necesidad frecuente de orinar.Para más informacion consulte a su medico.'];
		Y = cardiovasculares, R = ['El lupus puede aumentar el riesgo de enfermedad cardiovascular, como inflamación del corazón, vasos sanguíneos o membranas que rodean el corazón.Para más informacion consulte a su medico.'];
		Y = pulmonares, R = ['Algunas personas con lupus pueden experimentar dificultad para respirar, dolor en el pecho o inflamación de los pulmones.Para más informacion consulte a su medico.'];
		Y = neurologicos, R = ['El lupus puede afectar el sistema nervioso y causar síntomas como dolores de cabeza, mareos, entumecimiento, hormigueo, cambios de humor y problemas de memoria.Para más informacion consulte a su medico.'];
		Y = gastrointestinales, R = ['Algunas personas con lupus pueden experimentar dolor abdominal, náuseas, vómitos y pérdida de apetito.Para más informacion consulte a su medico.'];

        
        R = ['Sí, el dolor de', Y, 'puede ser un síntoma del lupus.']
    ).

	elizaSintomas(Y, R):- \+sintomas(Y), R = [al, parecer, el, sintoma, Y , no, es, sintoma, de, lupus].

	sintomas(fatiga).
	sintomas(erupciones).
	sintomas(articulaciones).
	sintomas(renales).
	sintomas(cardiovasculares).
	sintomas(pulmonares).
	sintomas(neurologicos).
	sintomas(gastrointestinales).






%Uretritis - Preguntas simples señálando informacion
template([uretritis], ['La uretritis es una inflamación de la uretra, el conducto que transporta la orina desde la vejiga hacia el exterior del cuerpo. La uretra puede inflamarse debido a diversas causas, siendo la infección bacteriana la causa más común de uretritis.'], []).
template([uretritis], ['La uretritis es una inflamación de la uretra, el conducto que transporta la orina desde la vejiga hacia el exterior del cuerpo. La uretra puede inflamarse debido a diversas causas, siendo la infección bacteriana la causa más común de uretritis.'], []).

template([que, es, el, uretritis, _], ['La uretritis es una inflamación de la uretra, el conducto que transporta la orina desde la vejiga hacia el exterior del cuerpo. La uretra puede inflamarse debido a diversas causas, siendo la infección bacteriana la causa más común de uretritis.'], []).
template([cuantas, maneras, hay, de, poder, contraer, uretritis, _], ['Una es por medio de transmision sexual o hay otra manera totalmente ajena a cualquier transmision sexual'], []).
template([cuales, son, las, manera, de, contraccion, por, transmision, sexual, _], ['Una es por medio de transmision sexual o hay otra manera totalmente ajena a cualquier transmision sexual'], []).
template([cuales, son, las, maneras, de, contraer, uretritis, por, transmision, sexual, _], ['Ya sea por La clamidia es una ITS muy común y una de las principales causas de uretritis. Se transmite principalmente a través del contacto sexual (vaginal, anal u oral) con una persona infectada o por la bacteria de la gonorrea también es una ITS que puede causar uretritis. Se transmite principalmente por contacto sexual sin protección con una persona infectada.'], []).
template([cuales, son, las, maneras, de, contraer, uretritis, por, otro, medio, de, bacterias,, que, no, sean, de, transmision, sexual, _], ['Ya sea por La clamidia es una ITS muy común y una de las principales causas de uretritis. Se transmite principalmente a través del contacto sexual (vaginal, anal u oral) con una persona infectada o por la bacteria de la gonorrea también es una ITS que puede causar uretritis. Se transmite principalmente por contacto sexual sin protección con una persona infectada.'], []).

template([sabes, que, es, el, uretritis, _], ['La uretritis es una inflamación de la uretra, el conducto que transporta la orina desde la vejiga hacia el exterior del cuerpo. La uretra puede inflamarse debido a diversas causas, siendo la infección bacteriana la causa más común de uretritis.'], []).
template([hay, alguna, variacion, de, la, uretritis, _], ['La uretritis tiene dos variaciones una es la uretritis no gonococica y la uretritis gonococica.'], []).
template([en, que, consiste, la, uretritis, No, gonococica], ['Es conocida como uretritis no específica, es causada por bacterias distintas de la bacteria Neisseria gonorrhoeae, que es la responsable de la gonorrea.'], []).
template([en, que, consiste, la, uretritis, gonococica], ['Es causada por la bacteria Neisseria gonorrhoeae, una bacteria transmitida principalmente a través de las relaciones sexuales sin protección.'], []).

template([uretritis, que, es, _], ['La uretritis es una inflamación de la uretra, el conducto que transporta la orina desde la vejiga hacia el exterior del cuerpo. La uretra puede inflamarse debido a diversas causas, siendo la infección bacteriana la causa más común de uretritis.'], []).

	%Sintomas - Uretritis
		template([si, tengo, dolor, de , s(_), es, sintoma, de, uretritis, _], [flagSintomas], [4]).
		template([si, tengo, s(_), es, sintoma, de, uretritis, _], [flagSintomas], [2]).
		template([si, tengo, erupciones, s(_), es, sintoma, de, uretritis, _], [flagSintomas], [3]).
		template([si, tengo, una, s(_), es, sintoma, de, uretritis, _], [flagSintomas], [3]).
		template([si, tengo, s(_), es, sintoma, de, uretritis, _], [flagSintomas], [3]).
		
		template([cuales, son, los, sintomas, de, una posible, uretritis, _], ['Los síntomas de la uretritis pueden variar según la causa subyacente de la inflamación. Aquí están los síntomas comunes de la uretritis:
																				Uretritis no gonocócica y uretritis gonocócica (gonorrea):
																				Dolor o ardor al orinar (disuria).
																				Necesidad frecuente y urgente de orinar.
																				Secreción uretral (puede ser de color blanco, amarillento o verdoso).
																				Picazón o irritación en la uretra.
																				En los hombres, sensibilidad o inflamación del pene.
																				En las mujeres, molestias en el área genital y aumento de la secreción vaginal.
																				La uretritis por clamidia:
																				Muchas veces, la uretritis por clamidia puede ser asintomática, lo que significa que no se presentan síntomas evidentes.
																				Cuando se presentan síntomas, pueden ser similares a los de la uretritis no gonocócica y pueden incluir dolor o ardor al orinar, secreción uretral y necesidad frecuente de orinar.'], []).
	%Tratamiento - Uretritis
	template([si, tengo, uretritis, no, gonococica, que, tratamiento, seria el optimo, _], ['Se prescriben antibióticos específicos para tratar la infección bacteriana. La elección del antibiótico dependerá del tipo de bacteria y su sensibilidad a los medicamentos. Es importante completar el curso completo de antibióticos según lo prescrito por el médico, incluso si los síntomas desaparecen antes.'], []).
	template([si, tengo, uretritis, gonococica, que, tratamiento, seria el optimo, _], ['Se usan antibióticos específicos para tratar estas infecciones de transmisión sexual. Generalmente, se administran medicamentos en forma de píldoras o inyecciones.'], []).
	template([si, tengo, uretritis, no, infecciosa, que, tratamiento, seria el optimo, _], ['El tratamiento se enfocará en aliviar los síntomas y tratar la causa subyacente. Pueden utilizarse antiinflamatorios para reducir la inflamación y aliviar el dolor y la irritación.'], []).
	template([que, recomendaciones, me, darias, si, llego, a, sospechar, de, padecer, uretritis, _], ['Si sospechas que puedes tener uretritis, es fundamental buscar atención médica para un diagnóstico preciso y recibir el tratamiento adecuado. Un médico evaluará tus síntomas, realizará pruebas de diagnóstico y te proporcionará el tratamiento necesario según tu situación individual.'], []).
	template([en, caso, de, coincidir, con, algunos, sintomas, de, la, uretritis, como, puedo, conseguir, medicacion, _], ['Es importante destacar que el tratamiento debe ser recetado y supervisado por un médico. Además, es esencial abstenerse de tener relaciones sexuales hasta que la infección se haya curado por completo y seguir las instrucciones y recomendaciones del médico para prevenir la propagación de la infección y evitar recaídas.'], []).

	%Especialista - Uretritis
	template([que, especialistas, se, encargan, de, dar, diagnosticar, ademas, de, dar, seguimiento, a, alguna, persona, con, uretritis,_],['El especialista médico que generalmente se encarga de diagnosticar y tratar la uretritis es un médico especializado en enfermedades infecciosas o un urólogo. Ambos profesionales de la salud tienen experiencia en el diagnóstico y tratamiento de enfermedades del tracto urinario, incluida la uretritis.'],[]).


elizaSintomas(Z, R) :-
    	sintomas(Z),
    	(
		Z = al-orinar, R = ['La fatiga es uno de los síntomas más comunes del lupus y puede ser debilitante. Para más informacion consulte a su medico.'];
        Z = orinar, R = ['Muchas personas con lupus experimentan erupciones en la piel, especialmente en las mejillas y el puente de la nariz. Estas erupciones pueden ser en forma de mariposa y son sensibles a la luz solar.Para más informacion consulte a su medico.'];
        Z = abdomen, R = ['El lupus puede causar dolor en las articulaciones y la inflamación, similar a la artritis. Las articulaciones afectadas pueden estar calientes, hinchadas y dolorosas.Para más informacion consulte a su medico.'];
        Z = secrecion, R = ['El lupus puede afectar los riñones y causar daño renal. Los síntomas pueden incluir sangre en la orina, aumento de la presión arterial, hinchazón en las extremidades y necesidad frecuente de orinar.Para más informacion consulte a su medico.'];
		Z = picazon, R = ['El lupus puede aumentar el riesgo de enfermedad cardiovascular, como inflamación del corazón, vasos sanguíneos o membranas que rodean el corazón.Para más informacion consulte a su medico.'];
		Z = irritacion, R = ['Algunas personas con lupus pueden experimentar dificultad para respirar, dolor en el pecho o inflamación de los pulmones.Para más informacion consulte a su medico.'];
		Z = inflamacion, R = ['El lupus puede afectar el sistema nervioso y causar síntomas como dolores de cabeza, mareos, entumecimiento, hormigueo, cambios de humor y problemas de memoria.Para más informacion consulte a su medico.'];

        R = ['El dolor de', Z, 'puede ser un síntoma del lupus.']
    ).

	elizaSintomas(Z, R):- \+sintomas(Z), R = [al, parecer, el, sintoma, Z , no, es, sintoma, de, lupus].

	sintomas(al-orinar).
	sintomas(orinar).
	sintomas(abdomen).
	sintomas(secrecion).
	sintomas(picazon).
	sintomas(irritacion).
	sintomas(inflamacion).



% templates sencillos y generales
template([Hola, mi, nombre, es,  s(_), '.'], ['Hi', 0, 'How', are, you, '?'], [4]).
template(_, ['La neta no te entiendo, favor de reformular la pregunta. '], []). 







% Eliza Sintomas:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSintomas,
    elizaSintomas(Atom, R).

% Eliza Sintomas:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, Y),
    Y == flagSintomas,
    elizaSintomas(Atom, R).

% Eliza Sintomas:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, Z),
    Z == flagSintomas,
    elizaSintomas(Atom, R).	
