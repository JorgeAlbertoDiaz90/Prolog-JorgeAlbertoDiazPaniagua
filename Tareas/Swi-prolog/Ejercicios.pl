% Afirmaciones

% 1. Ningún emperador es odontólogo.
no_es_odontologo(emperador).

% 2. Algunos gatos no saben silbar.
algunos_no_saben_silbar(gato).

% 3. Hay hombres que ni son libres ni sienten que lo son.
no_son_libres(hombre).
no_sienten_ser_libres(hombre).

% 4. Todos los perros del vecindario muerden a alguien.
muerden(perro, alguien_del_vecindario).

% 5. Hay un cartero al que lo muerden todos los perros.
lo_muerden_todos_los_perros(cartero).

% 6. Todos los carteros son mordidos por algún perro.
es_mordido_por_algun_perro(cartero).

% 7. Hay un perro que se muerde a sí mismo.
se_muerde_a_si_mismo(perro).

% 8. Todos los gatos son mamíferos.
son_mamiferos(gato).

% 9. Todo el mundo quiere a alguien.
quiere(alguien, X).

% Consulta para determinar si alguien es querido por todos
es_querido_por_todos(X) :- forall(quiere(_, X), true).

% Consulta para verificar si existe alguien a quien todo el mundo quiere
?- es_querido_por_todos(X).
