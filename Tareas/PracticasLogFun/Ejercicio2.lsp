;2.- Escriba un programa para determinar si un solicitante puede lograr un préstamo.
;    Deberá pedir los siguientes datos para cada solicitante: Nombre, historia crediticia(‘b’buena o ‘m’ mala), 
;    cantidad pedida,salario anual, y valor de otras propiedades.  El banco solo considerará a los solicitantes 
;    con un estado de crédito bueno. De aquellos, solo aceptara los que tengan mas de 6 puntos. 
;    Los puntos se obtienen como sigue: 5 puntos si el salario es 50% del préstamo o más. 
;    3 puntos si elsalario es por lo menos 25% pero menos de 50% del préstamo. 
;    1 puntosi el salario es por lo menos 10% pero menos de 25% del préstamo. 
;    5puntos si se tiene otra propiedad del doble del préstamo o mas. 
;    3 puntos si se tiene otra propiedad igual al préstamo pero menor del doble.

(defvar puntos nil)
(defun prestamo(nombre historial cantidad salario propiedad)
    (cond ((eq historial 'b)
            (if (>= salario (* cantidad .50))
            (setf puntos '5)
            )
            (if (and (>= salario (* cantidad .25)) (<= salario (* cantidad .50)))
            (setf puntos '3)
            )
            (if (and (>= salario (* cantidad .10)) (<= salario (* cantidad .25)))
            (setf puntos '1)
            )
            (if (>= propiedad (* cantidad 2))
            (setf puntos (+ puntos 5))
            )
            (if (and (>= propiedad cantidad) (<= propiedad (* cantidad 2)))
            (setf puntos (+ puntos 3))
            )

            (cond ((>= puntos 6)
            '(Eres elegible para el prestamo)
            )
            ((< puntos 6)
            '(No eres elegible para el prestamo))
            )
            )
    ((eq historial 'm)
    '(No eres elegible para el prestamo)))
)