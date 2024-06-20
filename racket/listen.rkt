;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname listen) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
;; Sprachebene "Schreib Dein Programm!" (ohne Anfänger)
;; Jetzt eingebaut: map, filter, fold
;; (filter even? (list 1 2 3 4 5))
;; (map (lambda (x) (+ x 1)) (list 1 2 3))
;; (fold 0 + (list 1 2 3 4))

;; Schreibe eine Funktion, die alle kurzen Wörter
;; aus einer Liste entfernt (<= 4 Buchstaben)
;; Hilfsfunktion: string-length
(: entferne-kurze-wörter ((list-of string) -> (list-of string)))
(check-expect (entferne-kurze-wörter (cons "Hallo" (cons "du" empty)))
              (cons "Hallo" empty))
(define entferne-kurze-wörter
  (lambda (liste)
    (filter (lambda (x) (> (string-length x) 4))
            liste)))

;; Funktion setzt an jedes Wort einer Liste "!"
;; Hilfsfunktion: (string-append "Ha" "llo") -> "Hallo"
(: add! ((list-of string) -> (list-of string)))
(check-expect (add! (list "Hallo" "du")) (list "Hallo!" "du!"))
(define add!
  (lambda (liste)
    (map (lambda (x) (string-append x "!"))
         liste)))

;; Funktion setzt an jedes Wort einer Liste "!!!"
;; Hilfsfunktion: (string-append "Ha" "llo") -> "Hallo"
(: add!!! ((list-of string) -> (list-of string)))
(check-expect (add!!! (list "Hallo" "du")) (list "Hallo!!!" "du!!!"))
(define add!!!
  (lambda (liste)
    (add! (add! (add! liste)))))

;; Alle Wörter einer Liste zusammenschreiben als ein String
;; Hinweis: Lösen mit fold: (fold 0 + (list 1 2 3 4))

(: list->word ((list-of string) -> string))
(check-expect (list->word (list "Hallo" "du")) "Hallodu")
(define list->word
  (lambda (liste)
    (fold "" string-append liste)))

;;; Zwei Listen aneinanderhängen
(: concat ((list-of %a) (list-of %a) -> (list-of %a)))
(check-expect (concat (list 1 2 3) (list 4 5 6)) (list 1 2 3 4 5 6))
(check-expect (concat (list "Hi" "du") (list "was" "geht")) (list "Hi" "du" "was" "geht"))
(define concat
  (lambda (liste1 liste2)
    (cond
      ((empty? liste1) liste2)
      ((cons? liste1)
       (cons (first liste1)
             (concat (rest liste1) liste2))))))

;; map-Signatur erweitert
;; (: map ((%a -> %a) (list-of %a) -> (list-of %a)))

;; map-Signatur weiter erweitern
;; (: map ((%a -> %b) (list-of %a) -> (list-of %b)))
(check-expect (words-length (list "Hallo" "du")) (list 5 2))
(define words-length
  (lambda (liste)
    (map string-length liste)))

;; filter-Signatur
;; (: filter (... -> ...))
;; Bsp.-Aufruf: (filter even? (list 1 2 3 4 5))
;; (: filter ((%a -> boolean) (list-of %a) -> (list-of %a))



;;; (add-to-list (list 1 2 3) 4) -> (list 1 2 3 4)
(: add-to-list ((list-of %a) %a -> (list-of %a)))
(check-expect (add-to-list (list 1 2 3) 4) (list 1 2 3 4))
(define add-to-list
  (lambda (liste element)
    (cond
      ((empty? liste) (list element))
      ((cons? liste)
       (cons
        (first liste)
        (add-to-list (rest liste) element))))))

;;; rev: Dreht eine Liste um
(: rev ((list-of %a) -> (list-of %a)))
(check-expect (rev (list 1 2 3 4)) (list 4 3 2 1))
(define rev
  (lambda (liste)
    (cond
      ((empty? liste) empty)
      ((cons? liste)
       (add-to-list (rev (rest liste))
                    (first liste))))))

;;; Akkumulator benutzen:
;; weiterer Parameter, der resultierende Liste aufbaut
;(check-expect (rev (list 1 2 3 4)) (list 4 3 2 1))

(define rev-1
  (lambda (liste res)
    (cond
      ((empty? liste) res)
      ((cons? liste)
       (rev-1 (rest liste)
              (cons (first liste) res))))))


(define inc (lambda (x) (+ x 1)))

(map inc (list 1 2 3 4))

;; map endrekursiv mit Akkumulator

(define map-1
  (lambda (liste fn res)
    (cond
      ((empty? liste) (reverse res))
      ((cons? liste)
       (map-1 (rest liste) fn (cons (fn (first liste))
                                    res))))))
        
;; Fakultätsfunktion:
;; gegeben n >= 1: Berechne 1 * ... * n

(: factorial (natural -> natural))
(check-expect (factorial 1) 1)
(check-expect (factorial 5) 120)
(define factorial
  (lambda (n)
    (cond
      ((= n 1) 1)
      ((> n 1)
       (* n
          (factorial (- n 1)))))))

(define second
  (lambda (liste)
    (first (rest liste))))

;;; Schreibe Funktion, die n-tes Element aus Liste extrahiert
(: nth ((list-of %a) natural -> %a))
(check-expect (nth (list "A" "B" "C") 2) "B")
(define nth
  (lambda (liste n)
    (cond
      ((= n 1) (first liste))
      ((> n 1)
       (nth (rest liste) (- n 1))))))

;;; QuickSort
(: quicksort ((list-of number) -> (list-of number)))
(check-expect (quicksort (list 5 2 8 3 7)) (list 2 3 5 7 8))
(define quicksort
  (lambda (liste)
    (cond
      ((empty? liste) empty)
      ((cons? liste)
       (define kleinere ...)
       (define größere ...)
       
       ...
       (first liste)
       ...
       (rest liste)
       ...))))




