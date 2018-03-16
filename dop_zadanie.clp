;Найти все натуральные трехзначные числа, каждое из которых обладает следующими свойствами: 
;   сумма самого числа и числа, получающегося из него перестановкой второй и третьей цифр, делится на 8 без остатка. 

(clear)

(defrule dop-zadanie
=>
    (loop-for-count (?i 1 9) do
        (loop-for-count (?j 1 9) do
            (loop-for-count (?k 1 9) do
                (if (= (mod (+(+ (+ (+ (+ (* 100 ?i) (* 10 ?j) ) ?k) (* 100 ?i)) (* 10 ?k)) ?j) 8) 0) 
                then (printout t ?i ?j ?k crlf ))
                )))

    (printout t "CLOSE" crlf)
)


(defrule dop-zadanie1
    =>
    (loop-for-count (?i 100 999) do
        (bind ?j(div ?i 100))
        (if (=(mod (+ (+ (+ ?i (* (div ?i 100) 100)) (* (mod ?i 10) 10)) (mod (div ?i 10) 10)) 8) 0) then
            (format t "Chislo: %ld %n" ?i)
        )
       
    )
)


(reset)
(run)

(exit)
