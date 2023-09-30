(defvar *areaCuadrado* (lambda (a b) (* a b)))

(defun dameDatos()
    (princ "Dame Un dato: ")
    (setq a (read))
    (princ "Dame otro dato: ")
    (setq b (read))
    (format t "El resultado es ~A" (funcall *areaCuadrado* a b))
)