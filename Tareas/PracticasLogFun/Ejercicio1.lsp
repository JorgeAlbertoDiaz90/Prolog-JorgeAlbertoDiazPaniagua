;1. Una tienda que vende pantalones Dickies al menudeo y al mayoreo tiene las siguientes tarifas, 
;   si se compran menos de 5 pantalones estos se cobran a su precio normal, en caso de que se compren 5 o mas, 
;   pero menos de 12 , se les descuenta el 15% en cada pantalon, 
;   si se compran mas de 12 se les descuenta 30% en cada pantalon. 
;   Escriba un programa que pida como dato de entrada el numero de pantalones que se desean comprar 
;   y con ello imprima el total a pagar por la compra hecha.

(defun pantalones(cantidad)
    (cond ((< cantidad 5)
    '(Tienes que pagar el precio normal))
    ((and (> cantidad 5) (< cantidad 12))
    '(Tienes un descuento de 15% en cada pantalon))
    ((> cantidad 12)
    '(Tienes un descuento de 30% en cada pantalon))
    )
)