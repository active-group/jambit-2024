;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname river) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
;;; Daten mit Selbstbezug

;; Ein Fluss ist eins der Folgenden:
;; - Bach mit Ursprungsort
;; - Zusammentreffen von zwei Flüssen

(define fluss (signature (mixed bach zusammentreffen)))

;; Ein Bach hat folgende Eigenschaften
;; - Ursprungsort

(define-record bach
  make-bach
  bach?
  (bach-ursprung string))

;; Ein Zusammentreffen hat folgende Eigenschaften
;; - Ort des Zusammentreffens
;; - Hauptfluss
;; - Nebenfluss

(define-record zusammentreffen
  make-zusammentreffen
  zusammentreffen?
  (zusammentreffen-ort string)
  (zusammentreffen-haupt fluss)
  (zusammentreffen-neben fluss))

(define eschach (make-bach "Heimliswald"))
(define prim (make-bach "Dreifaltigkeitsberg"))
(define schlichem (make-bach "Tieringen"))
(define neckar1 (make-zusammentreffen "Rottweil" eschach prim))
(define neckar2 (make-zusammentreffen "Epfendorf" neckar1 schlichem))

;; Fließt Wasser von Ort in den Fluss?

(: fließt? (string fluss -> boolean))

(define fließt?
  (lambda (ort fluss)
    (cond
      ((bach? fluss) (string=? ort (bach-ursprung fluss)))
      
      ((zusammentreffen? fluss)
       (or
        (string=? ort (zusammentreffen-ort fluss))
       
        (fließt? ort (zusammentreffen-neben fluss))
       
        (fließt? ort (zusammentreffen-haupt fluss)))))))

(fließt? "Heimliswald" neckar1)



