; Q1
(define (compose-all funcs)
  (define (apply funcs x)
    (if (null? funcs)
        x
        (apply (cdr funcs) ((car funcs) x)))
  )
  (define (composed x)
    (apply funcs x))
  composed
)

; Q2
(define (tail-replicate x n)
  (define (attach result n)
    (if (= n 0)
        result
        (attach (cons x result) (- n 1))))
  (attach nil n)
)
