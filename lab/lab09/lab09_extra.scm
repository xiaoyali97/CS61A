;; Extra Scheme Questions ;;


; Q5
(define lst
  '((1) 2 (3 . 4) 5)
)

; Q6
(define (composed f g)
  (lambda (x) (f (g x)))
)

; Q7
(define (remove item lst)
  (filter (lambda (x) (not (= x item))) lst)
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q8
(define (max a b) (if (> a b) a b))
(define (min a b) (if (> a b) b a))
(define (gcd a b)
  (cond
    ((= 0 (min a b)) (max a b))
    ((> b a) (gcd b a))
    ((= 0 (modulo a b)) b)
    (else (gcd b (modulo a b)))
    )
)

;;; Tests
(gcd 24 60)
; expect 12
(gcd 1071 462)
; expect 21

; Q9
(define (no-repeats s)
  (cond
    ((null? s) '())

    )
)

; Q10
(define (substitute s old new)
  (cond
    ((null? s) '())
    ((pair? (car s))
        (append (list (substitute (car s) old new)) (substitute (cdr s) old new)))
    ((equal? (car s) old)
        (append (list new) (substitute (cdr s) old new)))
    (else (append (list (car s)) (substitute (cdr s) old new)))
  )
)

; Q11
(define (sub-all s olds news)
  (if (null? olds)
      s
      (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))
  )
)
