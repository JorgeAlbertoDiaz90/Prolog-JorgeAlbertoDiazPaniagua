(defun recorre (lista)
  (if lista
      (progn
        (princ (car lista))
        (recorre (cdr lista)))))


(recorre '(1 2 3 4 5))