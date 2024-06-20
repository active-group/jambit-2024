;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname bruch) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
(define funktionale-programmierung "cool")

(define-record Person
  make-person
  person?
  (person-name string)
  (person-schuhgröße rational))


;; ÜBUNG:
;; modelliere Brüche
;; Funktionen:
;; - multiplizieren, addieren, kürzen, vergleichen

;; Ein Bruch besteht aus:
;; - Zähler
;; - Nenner

(define-record bruch
  really-make-bruch
  bruch?
  (bruch-zähler integer)
  (bruch-nenner natural))

(define make-bruch
  (lambda (zähler nenner)
    (if (= 0 nenner)
        (violation "Error: Nenner darf nicht Null sein")
        (really-make-bruch zähler nenner))))

(define bruch1 (make-bruch 1 2))
(define bruch2 (make-bruch -2 6))

;; multiplizere zwei Brüche
(: mult (bruch bruch -> bruch))
(check-expect (mult bruch1 bruch2) (make-bruch -2 12))
(define mult
  (lambda (bruch1 bruch2)
    (define zähler (* (bruch-zähler bruch1) (bruch-zähler bruch2)))
    (define nenner (* (bruch-nenner bruch1) (bruch-nenner bruch2)))
    (make-bruch zähler nenner)))
   







