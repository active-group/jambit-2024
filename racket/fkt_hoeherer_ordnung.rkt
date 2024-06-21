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
(: flip (... -> ...))
(check-expect ...)
(define flip
  (lambda (...)
    ...))





