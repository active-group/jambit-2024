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

(: make-time (natural natural -> time))
(: time-hour (time -> natural))
(: time-minute (time -> natural))

(define t1 (make-time 12 15))
(define t2 (make-time 20 30))



