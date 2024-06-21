;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname fkt_hoeherer_ordnung) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
;;; FUNKTIONEN HÖHERER ORDNUNG

;; return-flipped vertauscht Argumente einer Funktion (und wendet Funktion an)
(: return-flipped ((%a %a -> %a) %a %a -> %a))
(check-expect (return-flipped / 4 2) 0.5)
(check-expect (return-flipped - 4 2) -2)
(define return-flipped
  (lambda (f a b)
    (f b a)))

;; flip vertauscht Argumente einer Funktion
(: flip ((%a %a -> %a) -> (%a %a -> %a)))
;; (check-expect ...)
(define flip
  (lambda (f)
    (lambda (a b)
      (f b a))))

;; Funktion, die eine beliebige Zahl auf jedes Listenelement addiert
(: add-n ((list-of number) number -> (list-of number)))
(check-expect (add-n (list 1 2 3) 5) (list 6 7 8))
(check-expect (add-n (list 3) 7) (list 10))
(define add-n
  (lambda (liste n)
    (map (lambda (element) (+ n element))
         liste)))

;; Funktion, die 5 auf jedes Listenelement addiert (benutze add-n)
(: add-5 ((list-of number) -> (list-of number)))
(check-expect (add-n (list 1 2 3) 5) (list 6 7 8))
(define add-5
  (lambda (liste)
    (add-n liste 5)))



;;; map via fold implementieren:

(: my-fold (%res (%a %res -> %res) (list-of %a) -> %res))
(check-expect (my-fold 0 + (list 1 2 3)) 6)
(define my-fold
  (lambda (e fn liste)
    (cond
      ((empty? liste) e)
      ((cons? liste)
       (fn (first liste) (my-fold e fn (rest liste)))))))

(: my-map ((list-of %a) (%a -> %b) -> (list-of %b)))
(check-expect (my-map (list 1 2 3 4) (lambda (x) (+ 1 x))) (list 2 3 4 5))
(check-expect (my-map (list "A" "AA" "AAA" "A")
                      (lambda (x) (string-length x)))
              (list 1 2 3 1))

(define my-map
  (lambda (liste fn)
    (fold empty
          (lambda (element result)
            (cons (fn element) result))
          liste)))


