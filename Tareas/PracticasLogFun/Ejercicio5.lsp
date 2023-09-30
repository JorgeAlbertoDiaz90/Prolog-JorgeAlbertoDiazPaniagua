; 5. Escriba un programa que pida el numero de mes (del 1 al 12 ) e imprima el numero de dias que tiene el mes, donde:
;     •El mes 2 tiene 28 dias•Los meses 4,6,9 y 11 tienen 30 dias
;     •Los meses 1,3,5,7,8,10 y 12 tienen 31 dias.
;     Si da un mes diferente a los anteriores debera imprimir el mensaje “MES ERRONEO”.

(defun dias-mes (mes)
  (cond ((= mes 2) 28)
        ((or (= mes 4) (= mes 6) (= mes 9) (= mes 11)) 30)
        ((or (= mes 1) (= mes 3) (= mes 5) (= mes 7) (= mes 8) (= mes 10) (= mes 12)) 31)
        (t (format t "MES ERRONEO~%"))))

(format t "Ingrese el número del mes (1 al 12): ")
(let ((mes (read)))
  (let ((numero-dias (dias-mes mes)))
    (format t "El mes ~a tiene ~d días.~%" mes numero-dias)))
  (dias-mes mes)
