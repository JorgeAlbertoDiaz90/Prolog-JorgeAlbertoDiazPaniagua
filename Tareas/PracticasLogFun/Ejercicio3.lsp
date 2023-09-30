; 3. Escriba un programa que pida una letra minúscula, el programa deberá imprimir si la 
;    letra es una vocal (a,e,i,o,u), semivocal (y) o unaconsonante.

(defun ejer3 ()
  (format t "Ingresa una letra minúscula: ")
  (let ((letra (read-char)))
    (cond ((member letra '(#\a #\e #\i #\o #\u))
           (format t "La letra ~a es una vocal.~%" letra))
          ((eq letra #\y)
           (format t "La letra ~a es una semivocal.~%" letra))
          (t
           (format t "La letra ~a es una consonante.~%" letra)))))