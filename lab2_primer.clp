(deffacts data-facts
			(data 1.0 blue "red")
			(data 1 blue)
			(data 1 blue red)
			(data 1 blue RED)
			(data 1 blue red 6.9)
			)
			
(deftemplate person
			(slot name)
			(slot age)
			(multislot friends)
)


(deftemplate emergency (slot type))



(deffacts people
			(person (name Joe) (age 20))
			(person (name Bob) (age 20))
			(person (name Joe) (age 34))
			(person (name Sue) (age 34))
			(person (name Sue) (age 20))
) 
(reset)

(facts)

(defrule Find-data
    (data 1 blue red)
    =>
    (printout t crlf "Found data (data 1 blue red)" crlf)
)

(printout t "------------------------------"crlf)

(defrule Find-data-1
    (data ? blue ?x $?y)
    =>
    (printout t crlf "Found data1 (data ? blue " ?x " " ?y ")")
)

(defrule
    Find-2-Coeval-person
    (person (name ?x) (age ?z))
    (person (name ?y&~?x) (age ?z))
    =>
    (printout t "name=" ?x " name=" ?y " age="?z crlf)
)
(defrule Find-data-modify-predicate
    (data ?x&:(floatp ?x)&:(> ?x 0) $?y ?z&:(stringp ?z))
    =>
    (printout t "x=" ?x " y= " ?y " z=" ?z crlf)
)

(assert 
    (data 1 2)
    (data 2 3)
    (data 2 4)
)

(assert (emergency (type fire)))

(assert (emergency (type flood)))

(defrule Find-data-returned
    (data ?x ?y&=(* 2 ?x))
    =>
    (printout t "x=" ?x " y=" ?y crlf)
)

(defrule del-data-facts
    ?data-facts <- (data $?)
    =>
    (retract ?data-facts)
)

(defrule operation-alert-for-emergency
    (emergency)
    =>
    (printout t "emergency: operation alert" crlf)
    (assert (operation-alert))
)


(run)

(facts)
(printout t "------------------------------"crlf)
(exit)
