; 4. Para determinar si un año es bisiesto o no debe de cumplir las siguiente regla: 
;    Ser divisible entre 4 y no divisible entre 100 o bien divisible entre 400. 
;     Escriba un programa que pida como entrada el año e imprima si el año es bisiesto o no.

(defun bisiesto (year)
  (if (and (zerop (mod year 4))
           (or (not (zerop (mod year 100)))
               (zerop (mod year 400))))
      (format t "~a es un año bisiesto.~%" year)
      (format t "~a no es un año bisiesto.~%" year)))

(defun main ()
  (format t "Ingrese un año: ")
  (let ((year (read)))
    (bisiesto year)))

(main)
