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
(: concat ((list-of number) (list-of number) -> (list-of number)))
(check-expect (concat (list 1 2 3) (list 4 5 6)) (list 1 2 3 4 5 6))




     