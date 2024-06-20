;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname animal) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))

;;; ZUSAMMENGESETZTE DATEN

;; Eine Uhrzeit besteht aus
;; - Stunde
;; - Minute

;; "Besteht aus", "hat folgende Eigenschaften"
;; -> zusammengesetzte Daten, in Racket: Record

(define-record time
  make-time              ; Konstruktor
  (time-hour natural)    ; Stunden-Selektor (Getter)
  (time-minute natural)) ; Minuten-Selektor (Getter)

;; Signaturen
(: make-time (natural natural -> time))
(: time-hour (time -> natural))
(: time-minute (time -> natural))

(define t1 (make-time 12 15))
(define t2 (make-time 20 30))

;;; ÜBUNG
;; Schreibe ein Programm, das zu einer gegebenen Uhrzeit
;; die verstrichenen Minuten seit Mitternacht zurückgibt

;; msm  = minutes-since-midnight

(: msm (time -> natural))
(check-expect (msm t1) 735)
(check-expect (msm t2) 1230)
(define msm
  (lambda (zeit)
 (+ (* 60 (time-hour zeit))
    (time-minute zeit))))

;; Berechne Zeit aus Minuten seit Mitternacht
(: msm->time (natural -> time))
(check-expect (msm->time 735) t1)
(check-expect (msm->time 1230) t2)
(define msm->time
  (lambda (msm)
    (define hour (quotient msm 60))
    (define minutes (remainder msm 60))
    
    (make-time hour minutes)))

;; Ein Gürteltier hat folgende Eigenschaften
;; - lebendig oder tot
;; - Gewicht in g
;; ---> zusammengesetzte Daten

(define-record dillo
  make-dillo
  dillo?
  (dillo-alive? boolean)
  (dillo-weight natural))


(define dillo1 (make-dillo #t 20000)) ; Gürteltier, lebendig
(define dillo2 (make-dillo #f 15000)) ; Gürteltier, tot

;; Überfahre ein Gürteltier
(: run-over-dillo (dillo -> dillo))
(check-expect (run-over-dillo dillo1)
              (make-dillo #f 20000))
(check-expect (run-over-dillo dillo2)
              (make-dillo #f 15000))

(define run-over-dillo
  (lambda (dillo)
    (make-dillo #f (dillo-weight dillo))))

;;; ÜBUNG
;; weiteres Tier: Gewicht, und weitere Eigenschaft
;; Funktion, die Tier überfährt

;; Ein Papagei hat folgende Eigenschaften
;; - Gewicht in Gramm
;; - Satz, den er sagt

(define-record parrot
  make-parrot
  parrot?
  (parrot-weight natural)
  (parrot-sentence string))

(define p1 (make-parrot 500 "Mein Schatz!!")) ; Pirat-Papagei
(define p2 (make-parrot 350 "Ich grüße Sie")) ; höflicher Papagei

;; Überfahre Papagei
(: run-over-parrot (parrot -> parrot))
(check-expect (run-over-parrot p1) (make-parrot 500 ""))
(check-expect (run-over-parrot p2) (make-parrot 350 ""))
(define run-over-parrot
  (lambda (p)
    (make-parrot (parrot-weight p) "")))


;;; GEMISCHTE DATEN
;; Wir wollen Tiere überfahren

;; Ein Tier ist eines der Folgenden
;; - Dillo
;; - Papagei
;; -> "ist eines der Folgenden"-> gemischte Daten

(define animal (signature (mixed dillo parrot)))

(: run-over-animal (animal -> animal))
(check-expect (run-over-animal dillo1) (make-dillo #f 20000))
(check-expect (run-over-animal p1) (make-parrot 500 ""))
(define run-over-animal
  (lambda (animal)
    (cond
      ((dillo? animal) (run-over-dillo animal))
      ((parrot? animal) (run-over-parrot animal)))))


;; ÜBUNG: Gewicht eines Tieres zurückgeben
(: animal-weight (animal -> natural))
(check-expect (animal-weight dillo1) 20000)
(check-expect (animal-weight p1) 500)
(define animal-weight
  (lambda (animal)
    (cond
      ((dillo? animal) (dillo-weight animal))
      ((parrot? animal) (parrot-weight animal)))))


;;; Expression-Problem
;; neue Fälle vs neue Funktionen


