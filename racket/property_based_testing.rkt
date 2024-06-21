;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname property_based_testing) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
;;; PROPERTY-BASED TESTING

;; Assioziativ-Gesetz
;; (a + b) + c = a + (b + c)

(check-property
 (for-all ((a rational)
           (b rational)
           (c rational))
   (= (+ (+ a b) c)
      (+ a (+ b c)))))

;; erfüllt nicht A-G
;(check-property
; (for-all ((a rational)
;           (b rational)
;           (c rational))
;   (= (- (- a b) c)
;      (- a (- b c)))))

;(2.5 - (-4.5) ) - (-2.5)
;= 9.5
;
;2.5 - (-4.5 - (-2.5))
;= 4.5

(: list-sum ((list-of natural) -> natural))
(check-expect (list-sum (list 5 8 3)) 16)
(define list-sum
  (lambda (liste)
    (fold 0 + liste)))

;;; Ergebnis von list-sum ist immer positiv
(check-property
 (for-all ((liste (list-of natural)))
   (>= (list-sum liste) 0)))

;;; Zeige, dass das Kommutativgesetz für Plus/Mal gilt!
;; a + b = b + a

;;; Finde eine Property für "reverse-list" und teste "reverse-list" darauf
;; - Länge bleibt gleich
;; - list-sum bleibt gleich
;; - (reverse (reverse liste)) = liste
(check-property
 (for-all ((liste (list-of number)))
   (= (length liste)
      (length (reverse liste)))))

(check-property
 (for-all ((liste (list-of natural)))
   (= (list-sum liste)
      (list-sum (reverse liste)))))

(check-property
 (for-all ((liste (list-of natural)))
   (expect (reverse (reverse liste))
           liste)))


;;; Neues reverse vs eingebautes Reverse testen
;(check-property
; (for-all ((liste (list-of natural)))
;   (expect (reverse liste)
;           (rev-1 liste))))





