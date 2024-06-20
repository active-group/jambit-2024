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
    ...)



;; Funktion setzt an jedes Wort einer Liste "!"
;; Hilfsfunktion: (string-append "Ha" "llo") -> "Hallo"


