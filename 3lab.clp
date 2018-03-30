;Найти все натуральные трехзначные числа, каждое из которых обладает следующими свойствами: 
;   сумма самого числа и числа, получающегося из него перестановкой второй и третьей цифр, делится на 8 без остатка. 
(deffunction dop2lab (?from ?to $?non-used)
    (if (and (integerp ?from) (integerp ?to)) then
        (loop-for-count (?i ?from ?to) do
            (if (=(mod (+ (+ (+ ?i (* (div ?i 100) 100)) (* (mod ?i 10) 10)) (mod (div ?i 10) 10)) 8) 0) then
                (format t "Chislo: %ld %n" ?i)
            )
        )
        (printout t "Non used length [" (length ?non-used) "]: " ?non-used crlf)
    )
) 

;(dop2lab 100 500 8 9 4 5 3)

(deffunction triangle (?a ?b ?c)
    (if (and
            (and (> (+ ?a ?b) ?c) (> (+ ?b ?c) ?a))
            (> (+ ?c ?a) ?b))
        then
            TRUE
        else
            FALSE
    )
)

(defgeneric area)

(defmethod area ((?a NUMBER (> ?a 0)))
    (* ?a ?a)
)

(defmethod area ((?a NUMBER (> ?a 0)) (?b NUMBER (> ?b 0)))
    (* ?a ?b)
)

(defmethod area ((?a NUMBER (> ?a 0)) (?b NUMBER (> ?b 0)) (?c NUMBER (> ?c 0)))
    (if (eq (triangle ?a ?b ?c) TRUE) then
            (bind ?p (* 0.5 (+ (+ ?a ?b) ?c)))
            (bind ?a1 (- ?p ?a))
            (bind ?b2 (- ?p ?b))
            (bind ?c2 (- ?p ?c))
            (sqrt (* ?p (* ?a1 (* ?b2 ?c2))))
        else 
            "This triangle does not exist"
    )
)

(defmethod area ($?a)
    (printout t "Error enter" crlf)
)

(defmethod area (($?a NUMBER (< (length ?a) 8)))
    (loop-for-count (?i 1 (length ?a))
        (printout t "square area[" ?i "]: " (area (nth$ ?i ?a)) crlf)
    )
)


(printout t "Area triangle : " (area 5 6 1) crlf)
(printout t "Area triangle : " (area 5 6 8) crlf)
(area 123 qwe 32 j1)
(area 32 12 3 12 3 5)
(printout t "Area rectangle: " (area 5 6) crlf)


(exit)
