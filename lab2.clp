(clear)
(deftemplate DashCam
    (multislot nameDashCam (type SYMBOL)(cardinality 1 6)(default ?NONE))
    (slot price (type FLOAT)(range 1.0 200.0))
    (slot quality (type STRING)(allowed-strings "SD" "HD" "FULL-HD" "HQ" "4K"))
    (slot megapixels (allowed-values 0.3 1.0 4.0 5.0 8.0))
    (slot classSDCard (allowed-values 4 8 10)(default 10))
)

(deftemplate SDCard
    (multislot name (type SYMBOL)(cardinality 1 6 ))
    (slot class(type NUMBER)(allowed-values 4 10)(default 10))
    (slot price(type FLOAT)(range 10.0 60.0)(default 15.0))
    (slot capacity(type NUMBER)(range 1 126)(default 2))
    (slot speedWrite(type NUMBER)(range 1 120)(default 20))
    (slot speedRead(type NUMBER)(range 1 120)(default 20))
)

(deffacts DashCamFacts
    (DashCam (nameDashCam YI Smart Camera)(price 82.5)(quality "FULL-HD")(megapixels 5.0)(classSDCard 4))
    (DashCam (nameDashCam Camera DashCam)(price 52.5)(quality "FULL-HD")(megapixels 5.0)(classSDCard 4))
    (DashCam (nameDashCam Xiaomi Mijia Car DVR) (price 62.5)(quality "FULL-HD")(megapixels 8.0)(classSDCard 4))
    (DashCam (nameDashCam TrendVision TDR-708GP)(price 120.2)(quality "FULL-HD")(megapixels 5.0))
    (DashCam (nameDashCam Mio MiVue-688)(price 150.0)(quality "HQ")(megapixels 4.0))
)

(deffacts SDCartFacts
    (SDCard (name Mirex microSDHC)(price 10.0)(capacity 16)(speedRead 22)(speedWrite 10))
    (SDCard (name Samsung EVO)(price 15.0)(capacity 32)(speedRead 95)(speedWrite 20))
    (SDCard (name SanDisk Ultra)(price 22.5)(capacity 32)(speedRead 48)(speedWrite 10))
)

;(reset)


(defrule rule-exists
    (SDCard (speedRead ?speedRead)(capacity ?capacity))
    (or (exists (DashCam (price 52.5)(quality "FULL-HD")) (DashCam (price 62.5)(quality "HQ"))
        (DashCam (quality "FULL-HD")))
        (exists (SDCard (capacity ?capacity)) (SDCard(speedRead ?speedRead))
        (SDCard (capacity ?capacity)))
    )
    =>
    (printout t  "Rule exists worked" crlf)
)

(deffacts col 
    (color red blue black white)
)

(defrule dop-zadanie
    (color ? ?b ? ?c $?)
    =>
    (printout t "dop zadanie " ?b " --- " ?c crlf)
)

(defglobal ?*x* = 3.0)

(defrule rule-all
    ;(SDCard (name $?name)(price ?prc&:(floatp ?prc)&:(> ?prc 10))(capacity 32)(speedRead ?speedRead)(speedWrite ?speedWrite&~20))
    ;(DashCam (price ?price&=(* ?*x* 50.0)))
   ; (test (> ?speedRead 40))
    (SDCard (name $?name)(price ?prc)(capacity ?capacity)(speedRead ?speedRead)(speedWrite ?speedWrite))
    (DashCam (price ?price))
    (and 
     (test (floatp ?prc));
     (test (> ?prc 10))
     (test (eq ?capacity 32))
     (test (neq ?speedWrite 20))
     (test (> ?speedRead 40))
     (test (= ?price (* ?*x* 50.0)))
    )
    =>
    (printout t $?name " name -rule-ALL" crlf)

)

(defrule rule-test-price-quality
    (DashCam (nameDashCam $?name) (price ?price) (quality ?quality))
    (and (test (> ?price 50.0)) (test (eq (str-compare ?quality "FULL-HD") 0)))
    =>
    (printout t ?name " с ценой > 100 и качеством видео FULL-HD"  crlf)
)

(defrule rule-or-not
   (or (and (DashCam 
                (classSDCard ?classSDCard&:(eq ?classSDCard 10)))
            (SDCard 
                (speedRead ?speedRead&:(> ?speedRead 70))))
        (not (SDCard (capacity ?capacity&:(< ?capacity 16))))
    )
   =>
    (printout t "rule OR-NOT worked" crlf)
)

(defrule rule-forall
   (or (forall 
            (DashCam (classSDCard ?classSDCard))
            (SDCard (class ?classSDCard)))
        (exists 
            (DashCam (quality "FULL-HD"))
           
           )
   )
    =>
    (printout t "forrall worked " crlf)
)

(defrule rule-logical
    (logical (DashCam (price 82.5)))
    (logical (SDCard (name Mirex microSDHC)))
    =>
    (printout t "logical rule" crlf)
    (assert (logic rule worked))
  ;  (facts)
) 


(defrule retract-rule
    ?dascam <- (DashCam (price 82.5))
    =>
    (retract ?dascam)
    (printout t "retract-rule worked" crlf)
   ; (facts)
)

(defrule rule-member
    (DashCam (nameDashCam $?name))
    (test (neq (member$ Camera $?name) FALSE))
    =>
    (printout t "rule-member" crlf)
)

(reset)
(run)

;(facts)


(exit)
