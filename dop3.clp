;Дана символьная строка. Слово – последовательность символов между пробелами, не содержащая
;пробелы внутри себя. Определить количество слов заданной длины. Результат вывести на экран и в
;текстовый файл.


(defmethod count-of-symbols ((?n INTEGER (> (length$ ?word) ?n)) ($?word SYMBOL)) 
    (bind ?count 0)
    (loop-for-count (?i 1 (length ?word)) do 
        (if (= ?n (length (nth ?i ?word))) then
            (bind ?count (+ ?count 1))
           ;(printout t "Find word: " (nth ?i ?word) crlf)
        )
    )
    (printout t "count: " ?count crlf)
    ?count
)

(count-of-symbols 3 lol kek cheburek test tes)

(open "doptext.txt" write "w")
(printout write (count-of-symbols 3 lol kek cheburek test tes) crlf)

(close write)

(exit)
