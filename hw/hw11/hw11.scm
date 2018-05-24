(define (find s predicate)
  (if (null? s)
      #f
      (if (predicate (car s))
          (car s)
          (find (cdr-stream s) predicate)))
)

(define (scale-stream s k)
  (if (null? s)
      nil
      (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k)))
)

(define (has-cycle s)
  (define (have-seen seen s)
      (if (null? seen)
          #f
          (if (eq? (car seen) s)
              #t
              (have-seen (cdr seen) s))))
  (define (has-cycle-helper seen s)
      (if (null? s)
          #f
          (if (have-seen seen s)
              #t
              (has-cycle-helper (cons s seen) (cdr-stream s))
          )))
  (has-cycle-helper nil s)
)


(define (has-cycle-constant s)

)
