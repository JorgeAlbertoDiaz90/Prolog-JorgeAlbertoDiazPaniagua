(defvar *personajes* '())

(defun agregar-personaje (nombre casa vivo)
  (push (list :nombre nombre :casa casa :vivo vivo) *personajes*))

(defun inicio ()
  (format t "¡Bienvenido al Akinator de Game of Thrones! Piensa en un personaje y responderé adivinando quién es.~%")
  (format t "Por favor, ingresa algunos personajes de la serie. Para dejar de ingresar, escribe 'salir'.~%")
  (loop
    (format t "Nombre del personaje: ")
    (let ((nombre (read-line)))
      (if (string= nombre "salir")
          (progn
            (format t "Personajes de Game of Thrones cargados. Comencemos a adivinar.~%")
            (return))
          (progn
            (format t "Casa del personaje: ")
            (let ((casa (read-line)))
              (agregar-personaje nombre casa t)))))))

(defun adivina-personaje ()
  (format t "Pregúntame sí o no sobre tu personaje y trataré de adivinar quién es.~%")
  (adivina))

(defun adivina ()
  (let ((caracteristicas (list :casa)))
    (loop
      (format t "¿Tu personaje es de la casa Stark? (sí/no): ")
      (let ((respuesta (read-line)))
        (if (string= respuesta "si")
            (push :stark caracteristicas)
            (push :no-stark caracteristicas))))

    (let ((personajes-candidatos (filtrar-personajes caracteristicas)))
      (if (null personajes-candidatos)
          (format t "No tengo suficiente información para adivinar tu personaje.~%")
          (if (= 1 (length personajes-candidatos))
              (format t "¡He adivinado tu personaje! Es ~a.~%" (getf (car personajes-candidatos) :nombre))
              (format t "Todavía tengo varios personajes en mente. Dime otra característica.~%"))))))

(defun filtrar-personajes (caracteristicas)
  (remove-if-not
   #'(lambda (p)
       (every #'(lambda (c) (member c (getf p :casa)))
              caracteristicas))
   *personajes*))

(defun akinator ()
  (inicio)
  (adivina-personaje))

(akinator)