;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname image) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
;; Syntax
;; 2 + 5 ; Infix-Notation
;; Racket (Lisp-Dialekt):
;; -> (+ 2 5)

;; 2 + 3 * 5
;; Konventionen
;; -> zweideutig
;; (2 + 3) * 5
;; 2 + (3 * 5)

#;(+ 2 (* 3 5))

;; REPL: Berechne: 3 * (3 + 7) + 22

#;(+ 22
   (* 3
      (+ 3 7)))

(define name "Kim")

(define pi 3.141592)  ; Kreiszahl




