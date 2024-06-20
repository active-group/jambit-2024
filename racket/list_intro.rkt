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
    (cond
      ((empty? liste) 0)
      ((cons? liste)
       (+
        (first liste)
        (list-sum (rest liste)))))))

;; Multipliziere alle Zahlen einer Liste

(: list-mult (list-of-numbers -> number))
(check-expect (list-mult lis1) 42)
(check-expect (list-mult lis2) 966)
(check-expect (list-mult lis4) 120)
(check-expect (list-mult empty) 1)
(define list-mult
  (lambda (liste)
    (cond
      ((empty? liste) 1)
      ((cons? liste)
       (*
        (first liste)
        (list-mult (rest liste)))))))


;; Aus einer Liste die geraden Zahlen extrahieren

(: evens (list-of-numbers -> list-of-numbers))
(check-expect (evens lis1) lis1)
(check-expect (evens lis2) lis1)
(check-expect (evens lis4) (cons 2 (cons 4 empty)))
(define evens
  (lambda (liste)
    (cond
      ((empty? liste) empty)
      ((cons? liste)
       (if (even? (first liste))
           (cons (first liste) (evens (rest liste)))
           (evens (rest liste)))))))

;;; ÜBUNG: Funktion, die alle positiven Zahlen extrahiert!

(: positives (list-of-numbers -> list-of-numbers))
(check-expect (positives lis4) lis4)
(check-expect (positives (cons -5 lis4)) lis4)
(check-expect (positives (cons 25 (cons -2 empty))) (cons 25 empty))
(define positives
  (lambda (liste)
    (cond
      ((empty? liste) empty)
      ((cons? liste)
       (if (pos? (first liste))
           (cons (first liste) (positives (rest liste)))
           (positives (rest liste)))))))

(: pos? (number -> boolean))
(define pos?
  (lambda (zahl)
    (> zahl 0)))

(: filter (list-of-numbers (number -> boolean) -> list-of-numbers))
(define filter
  (lambda (liste predicate?)
    (cond
      ((empty? liste) empty)
      ((cons? liste)
       (if (predicate? (first liste))
           (cons (first liste) (filter (rest liste) predicate?))
           (filter (rest liste) predicate?))))))

(define neues-evens
  (lambda (liste)
    (filter liste even?)))

(define neues-positives
  (lambda (liste)
    (filter liste pos?)))

(: do-operation ((number number -> number) number number -> number))
(define do-operation
  (lambda (op zahl1 zahl2)
    (op zahl1 zahl2)))

;; flip: Vertauscht Funktionsargumente!

;; (flip - 2 3) -> 1
;; (flip / 2 4) -> 2

(define op-type (signature (number number -> number)))

(: flip (op-type number number -> number))
(check-expect (flip - 2 3) 1)
(check-expect (flip / 2 4) 2)
(define flip
  (lambda (op zahl1 zahl2)
    (op zahl2 zahl1)))



;; ÜBUNG
;; fn-after-fn: bekommt zwei einstellige Funktionen,
;; die hintereinander auf eine Zahl angewandt werden
;; (fn-after-fn inc double 3) -> 8
;; (fn-after-fn double inc 3) -> 7

(: inc (number -> number))
(define inc
  (lambda (zahl)
    (+ 1 zahl)))

(: double (number -> number))
(define double
  (lambda (zahl)
    (* 2 zahl)))

;; Signatur/Typ auch so möglich
;; (define op1-type (signature (number -> number)))
;; (: fn-after-fn (op1-type op1-type number -> number))

(: fn-after-fn ((number -> number) (number -> number) number -> number))
(check-expect (fn-after-fn inc double 3) 8)
(check-expect (fn-after-fn double inc 3) 7)
(define fn-after-fn
  (lambda (fn1 fn2 zahl)
    (fn2 (fn1 zahl))))

;; ÜBUNG: Eine Funktion, die jedes Element einer Liste um 1 erhöht
;; [1 2 3 4] -> [2 3 4 5]
;; [3 7] -> [4 8]
(: inc-list (... -> ...))
(check-expect (inc-list lis1) (cons 43 empty))
(check-expect (inc-list lis4) (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty))))))
(define inc-list
  (lambda (liste)
    (cond
      ((empty? liste) ...)
      ((cons? liste) ...))))


;; ÜBUNG: Eine Funktion, die jedes Element einer Liste verdoppelt erhöht
;; [1 2 3 4] -> [2 4 6 8]
;; [3 7] -> [6 14]
(: double-list (... -> ...))
(check-expect (double-list lis1) (cons 84 empty))
(check-expect (double-list lis4) (cons 2 (cons 4 (cons 6 (cons 8 (cons 10 empty))))))
(define double-list
  (lambda (liste)
    (cond
      ((empty? liste) ...)
      ((cons? liste) ...))))



     













