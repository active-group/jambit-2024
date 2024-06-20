;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname list_intro) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
;;; Listen

;; Eine Liste ist eins der Folgenden
;; - eine leere Liste
;; - eine nicht-leere Liste (Cons-List)

;; Eine leere Liste besteht aus... nix?
(define-record empty-list
  make-empty
  empty?)

;; Eine nicht-leere Liste besteht aus
;; - einer Zahl
;; - einer weiteren Liste (der restlichen Zahlen)
(define-record cons-list
  cons
  cons?
  (first number)
  (rest list-of-numbers))

(define list-of-numbers (signature (mixed empty-list cons-list)))

;;; ÜBUNG: Erstelle Listen:
;; []
;; [42]
;; [23 42]
;; [12 23 42]
;; [1 2 3 4 5]

(define empty (make-empty))

(define lis1 (cons 42 empty))
(define lis2 (cons 23 lis1))
(define lis3 (cons 12 lis2))
(define lis4 (cons 1
                   (cons 2
                         (cons 3
                               (cons 4
                                     (cons 5 empty))))))
;;; Extrahiere 2. Element einer Liste
(: second (list-of-numbers -> number))
(check-expect (second lis2) 42)
(check-expect (second lis4) 2)
(define second
  (lambda (lis)
    (first (rest lis))))

;; Alle Elemente einer Liste aufaddieren
(: list-sum (list-of-numbers -> number))
(check-expect (list-sum lis1) 42)
(check-expect (list-sum empty) 0)
(check-expect (list-sum lis4) 15)
(define list-sum
  (lambda (liste)
    ...))




