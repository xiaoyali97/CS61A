; Q4
(define (rle s)
  (define (compress s target count)
    (cond ((null? s) (cons-stream (list target count) nil))
          ((= target (car s)) (compress (cdr-stream s) target (+ count 1)))
          (else
            (cons-stream (list target count) (compress (cdr-stream s) (car s) 1)))
  ))
  (if (null? s) nil (compress (cdr-stream s) (car s) 1))
)

; Q4 testing functions
(define (list-to-stream lst)
    (if (null? lst) nil
                    (cons-stream (car lst) (list-to-stream (cdr lst))))
)

(define (stream-to-list s)
    (if (null? s) nil
                 (cons (car s) (stream-to-list (cdr-stream s))))
)

; Q5
(define (insert n s)
  (define (insert-helper head tail n inserted)
    (cond ((pair? inserted) inserted)
          ((null? tail) (append head (list n)))
          ((< n (car tail)) (insert-helper head tail n (append head (list n) tail)))
          (else (insert-helper (append head (list (car tail))) (cdr tail) n inserted))
       )
  )
  (insert-helper nil s n nil)
)

; Q6
(define (deep-map fn s)
  (cond
    ((null? s) nil)
    ((list? (car s)) (cons (deep-map fn (car s)) (deep-map fn (cdr s))))
    (else (cons (fn (car s)) (deep-map fn (cdr s))))
    )
)

; Q7
; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s) nil
      (cons (fn (car s))
            (map fn (cdr s)))))

(define (filter fn s)
  (cond ((null? s) nil)
        ((fn (car s)) (cons (car s)
                            (filter fn (cdr s))))
        (else (filter fn (cdr s)))))

; Implementing and using these helper procedures is optional. You are allowed
; to delete them.
(define (unique s)
  (if (null? s) nil
      (cons (car s)
          (unique (filter (lambda (x) (not (eq? (car s) x))) (cdr s)))))
)

(define (count name s)
  (cond ((null? s) 0)
        ((eq? name (car s)) (+ 1 (count name (cdr s))))
        (else (count name (cdr s))))
)

(define (tally names)
  (map (lambda (name) (cons name (count name names))) (unique names))
)
