(defun es-padre (padre hijo)
  (list 'padre padre hijo))

(defun es-madre (madre hijo)
  (list 'madre madre hijo))

(defun es-hijo (hijo padre madre)
  (list 'hijo hijo padre madre))

(defun es-hermano (hermano1 hermano2)
  (list 'hermano hermano1 hermano2))
  
(defun es-hermana (hermana1 hermana2)
  (list 'hermana hermana1 hermana2))

(defun es-hermanos (hermana1 hermano1 hermana2 hermano2)
  (list 'hermano hermana))

(defun es-abuelo (abuelo nieto)
  (list 'abuelo abuelo nieto))

(defun es-abuela (abuela nieto)
  (list 'abuela abuela nieto))

(defun es-tio (tio sobrino)
  (list 'tio tio sobrino))

(defun es-tia (tia sobrino)
  (list 'tia tia sobrino))

;; Ejemplos de relaciones
(setq relaciones
      (list (es-padre 'Enrique 'Dana)
            (es-madre 'Jacqueline 'Dana)
            (es-padre 'Enrique 'Luis)
            (es-madre 'Jacqueline 'Luis)
            (es-hermano 'Luis 'Dana)
            (es-hermana 'Dana 'Luis)
            (es-hermana 'Dana 'Jorge)
            (es-hermano 'Jorge 'Luis)
            (es-hermano 'Jorge 'Dana)
            (es-abuelo 'Floriberto 'Luis)
            (es-abuelo 'Floriberto 'Dana)
            (es-abuelo 'Floriberto 'Jorge)
            (es-abuela 'Yolanda 'Luis)
            (es-abuela 'Yolanda 'Jorge)
            (es-abuela 'Yolanda 'Dana)
            (es-tio 'Alberto 'Dana)
            (es-tio 'Alberto 'Luis)
            (es-tio 'Alberto 'Jorge)
            (es-tia 'Rubi 'Luis)
            (es-tia 'Rubi 'Dana)
            (es-tia 'Rubi 'Jorge)
            (es-tia 'Alondra 'Luis)
            (es-tia 'Alondra 'Dana)
            (es-tia 'Alondra 'Jorge)
            (es-tia 'Karina 'Jorge)
            (es-hijo 'Dana 'Enrique 'Jacqueline)
            (es-hijo 'Luis 'Enrique 'Jacqueline)
            (es-hijo 'Jorge 'Enrique 'Jacqueline)
            ))

;; Predicado para buscar padre
(defun buscar-padre (persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'padre)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))


;; Predicado para buscar madre
(defun buscar-madre (persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'madre)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))

;; Predicado para buscar hermano
(defun buscar-hermano (persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'hermano)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))     

;; Predicado para buscar hermana
(defun buscar-hermana(persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'hermana)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))

                         ;; Predicado para buscar hermana
(defun buscar-hermanos(persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'hermana 'hermano)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))
;; Predicado para buscar hijos
(defun buscar-hijo (persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'hijo)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))

;; Predicado para buscar tios
(defun buscar-tio (persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'tio)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))

;; Predicado para buscar tia
(defun buscar-tia (persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'tia)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))

;; Predicado para buscar abuelo
(defun buscar-abuelo (persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'abuelo)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))

;; Predicado para buscar abuela
(defun buscar-abuela (persona)
  (remove-if-not #'identity
                 (mapcar (lambda (relacion)
                           (if (and (eq (car relacion) 'abuela)
                                    (eq (caddr relacion) persona))
                               (cadr relacion)
                               nil))
                         relaciones)))    
