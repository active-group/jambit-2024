;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname shower-product) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
;;; Duschprodukte
;; Es gibt Seife, Shampoo, Duschgel, Mixtur
;; Seife besteht aus:
;; - pH-Wert
;; Shampoo besteht aus:
;; - Farbe
;; - Haartyp
;; Duschgel besteht zu gleichen Teilen aus Shampoo und Seife
;; Mixtur:
;; besteht aus zwei Duschprodukten, mit prozentualem Anteil

(define product
  (signature (mixed soap shampoo shower-gel mixture)))

; Aufgabe:
; Bestimme den Seifenanteil eines Duschproduktes


; Seife hat folgende Eigenschaften:
; - pH-Wert
(define-record soap
  make-soap
  soap?
  (soap-ph rational))

(define soap1 (make-soap 5.7))
(define soap2 (make-soap 6.2))

; Shampoo hat folgende Eigenschaften:
; - Farbe
; - Haartyp
(define-record shampoo
  make-shampoo
  shampoo?
  (shampoo-color string)
  (shampoo-type string))

(define shampoo1 (make-shampoo "brown" "dry"))
(define shampoo2 (make-shampoo "blonde" "dandruff"))


; Duschgel besteht aus:
; - Seife
; - Shampoo
(define-record shower-gel
  make-shower-gel
  shower-gel?
  (shower-gel-soap soap)
  (shower-gel-shampoo shampoo))

(define shower-gel1 (make-shower-gel soap1 shampoo1))

; Eine Mixtur hat folgende Eigenschaften:
; - Duschprodukt #1
; - Anteil Duschprodukt #1
; - Duschprodukt #2
(define-record mixture
  make-mixture
  mixture?
  (mixture-product-1 product)
  (mixture-ratio-1 rational)
  (mixture-product-2 product))

(define mix1 (make-mixture soap1 0.2 shampoo1))
(define mix2 (make-mixture shampoo1 0.2 shower-gel1))

(: how-much-soap (product -> rational))
(check-expect (how-much-soap soap1) 1)
(check-expect (how-much-soap shampoo1) 0)
(check-expect (how-much-soap shower-gel1) 0.5)
(check-expect (how-much-soap mix1) 0.2)
(check-expect (how-much-soap mix2) 0.4)

(define how-much-soap
  (lambda (product)
    (cond
      ((soap? product) 1)
      ((shampoo? product) 0)
      ((shower-gel? product) 0.5)
      ((mixture? product)
       (+
        (*
         (mixture-ratio-1 product)
         (how-much-soap (mixture-product-1 product)))
        (* (- 1 (mixture-ratio-1 product))
           (how-much-soap (mixture-product-2 product))))))))





