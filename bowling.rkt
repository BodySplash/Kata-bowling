#lang racket

(provide score)

(define (score lancés)
  
  (define (score-rec lancésRestant)
    
    (define (suite)
      (if (est-un-strike?)
          (list-tail lancésRestant 1)
          (list-tail lancésRestant 2)
      ))
    
    (define (est-un-strike?)
        (equal? 10 (list-ref lancésRestant 0))
        )
    
    (define (est-un-spare?)
        (equal? (somme-lancés) 10)
        )
    
    (define (somme-lancés)
        (+ (list-ref lancésRestant 0) (list-ref lancésRestant 1))
        )
    
    (define (score-frame)
      
      (define (bonus-spare)
        (list-ref lancésRestant 2)
        )
    
      (define (bonus-strike)
        (+ (list-ref lancésRestant 1) (list-ref lancésRestant 2))
        )
      
      (cond
        [(est-un-strike?) (+ (list-ref lancésRestant 0) (bonus-strike))]
        [(est-un-spare?) (+ (somme-lancés) (bonus-spare))]
        [else (somme-lancés)]
        ) 
      )
    
    (define (dernière-frame?)
      (> 4 (length lancésRestant))
      )
    
    (if (dernière-frame?)
        (score-frame)
        (+ (score-rec (suite)) (score-frame))
        ))
  
  (score-rec lancés))