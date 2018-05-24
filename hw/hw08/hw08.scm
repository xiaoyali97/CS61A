(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)

(define (sign x)
  (cond
    ((> x 0) 1)
    ((= x 0) 0)
    (else -1)
  )
)

(define (square x) (* x x))

(define (pow b n)
  (cond
    ((= n 1) b)
    ((even? n) (square (pow b (/ n 2))))
    (else (* b (square (pow b (/ (- n 1) 2)))))
  )
)

(define (ordered? s)
  (cond
    ((null? (cdr s)) True)
    ((<= (car s) (cadr s)) (ordered? (cdr s)))
    (else False)
  )
)

(define (nodots s)
  (cond
    ((null? s) '())
    ((pair? s)
      (if (pair? (car s))
        (append (list (nodots (car s))) (nodots (cdr s)))
        (append (list (car s)) (nodots (cdr s)))
      ))
    (else (list s))
  )
)

; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond ((empty? s) #f)
          ((> (car s) v) #f)
          ((= (car s) v) #t)
          (else (contains? (cdr s) v)) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond ((empty? s) (list v))
          ((contains? s v) s)
          (else
            (if (> v (car s))
                (append (list (car s)) (add (cdr s) v))
                (append (list v) s)
                )
            ) ; replace this line
          ))

(define (intersect s t)
    (cond ((or (empty? s) (empty? t)) nil)
          (else
            (cond
              ((= (car s) (car t)) (append (list (car s)) (intersect (cdr s) (cdr t))))
              ((< (car s) (car t)) (intersect (cdr s) t))
              (else (intersect s (cdr t)))
              )
            ) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond ((empty? s) t)
          ((empty? t) s)
          (else (union (add s (car t)) (cdr t))) ; replace this line
          ))
