;объявление переменных
(defglobal 
    ?*x* = 3 
    ?*y* = ?*x*
    ?*z* = (+ ?*x* ?*y*)
    ?*q* = (create$ a b c) ;объявление составного поля
)

(defglobal
    ?*d* = 7.8
    ?*e* = "string"
    ?*f* = symbol
)

(bind ?*x* 4)               ;Присваение нового значения для переменной
x -2
(list-defglobals)           ;Вывод всех объявление переменных
(ppdefglobal x)             ;Вывод определения переменной

(deffunction print-args (?a ?b $?c)
    (printout t ?a " " ?b " " (length ?c) " extras: " ?c crlf)
)


(print-args 1 2)
(print-args a b c d)
; (print-args a)            ;Ошибка

(deffunction factorial (?a)
    (if (or (not (integerp ?a)) (< ?a 0))
        then
            (printout t "factorial error!" crlf)
        else
            (if (= ?a 0)
                then 1
            else
                (* ?a (factorial (- ?a 1))))
    )
)


(printout t (factorial 5) crlf)

(deffunction foo ())
(deffunction bar ()
    (foo))
(deffunction foo()
    (bar))

(defgeneric myMethod
)

(defmethod + ((?a STRING) (?b STRING))
    (str-cat ?a ?b)
)

(printout t (+ 1 2) crlf)
(printout t (+ "TEST" " STR-CAT") crlf)

(defmethod +
    (($?any INTEGER (evenp ?current-argument))) ; current-argument это текущий аргумент. Его нельзя нигде использовать больше
    (div (call-next-method) 2)
)

(printout t (+ 2 4 6 8) crlf)

(defmethod foo1
    ((?arg (> (length$ ?any) 1)) $?any)
    TRUE
)

(printout t(foo1 1 red 2) crlf)

(list-defmethods)

(exit)
