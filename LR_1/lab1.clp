(defglobal ?*var* = 5)
(defglobal ?*prc* = 10.0)

?*var*

(deftemplate videoregistrator 
            (multislot name (type SYMBOL)(cardinality 1 4)(default ?NONE))
            (slot price (type FLOAT)(range 1.0 150.0)(default-dynamic ?*prc*))
            (slot quality (type STRING)(allowed-strings "hd" "fullhd" "hq"))
            (slot numberCamers (type INTEGER)(default ?*var*))
            (slot numMP (type NUMBER)(default-dynamic ?*var*))
            )

(deffacts myfacts 
    (videoregistrator (name Prestigio HD) (price 30.2) (quality "hd"))
    (videoregistrator (name YI Smart Dash Camera) (price 88.4) (quality "fullhd") (numMP 3))
    (videoregistrator (name Armix DVR Cam-970) (price 100.4) (quality "hq"))
)

(deffacts myfacts1 
     (Learn language clips)
     (Videoregistrator is very cool)
)


(defglobal ?*var* = 9)

(reset)


(assert 
    (videoregistrator (name LLLL A) (price 55.2) (quality "hd"))
    (videoregistrator (name KKK A D) (price 88.1) (quality "fullhd"))
    (video fullhd)
)

(retract 4)

(fact-existp 4)


(assert 
    (videoregistrator (name Xiaomi HD) (price 55.9) (quality "hd"))
)

(assert-string "(videoregistrator (name Ritmix AVR) (price 44.1) (quality \"fullhd\"))")

(assert 
    (Videoregistrator is the camera for car)
)

(duplicate 10 
        (name Ritmix AVG)
)

(assert-string "(qqq \"hello\" world \"CLIPS\" jjj)")

(assert (video hello)
        (hello world)
        (hello clips)
        )

(retract 12)

(assert 
    (video hello world)
)

(assert-string
    "(lorem \"I\" knows \"CLIPS\")"
)


(fact-relation 10)

(fact-slot-names 2)

(fact-slot-value 3 name)

(retract (-(+ (* 3 3) 3) 3))
(fact-existp 9)

(save-facts fct visible videoregistrator)

(facts)

(exit)
