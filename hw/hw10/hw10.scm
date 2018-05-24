(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner start (accumulate combiner (term n) (- n 1) term))
  )
)

(define (accumulate-tail combiner start n term)
  (define (accumulate-helper result combiner start n term)
    (if (= n 0)
      result
      (accumulate-helper (combiner result (term n)) combiner start (- n 1) term))
  )
  (accumulate-helper start combiner start n term)
)

(define-macro (list-of expr for var in seq if filter-fn)
  (list 'map (list 'lambda (list var) expr) 
  (list 'filter (list 'lambda (list var) filter-fn) seq))
)
