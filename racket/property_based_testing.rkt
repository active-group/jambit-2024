;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname property_based_testing) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
;;; PROPERTY-BASED TESTING

;; Assioziativ-Gesetz
;; (a + b) + c = a + (b + c)

(check-property
 (for-all ((a rational)
           (b rational)
           (c rational))
   (= (+ (+ a b) c)
      (+ a (+ b c)))))
