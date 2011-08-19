#lang racket

(require rackunit
         "bowling.rkt")

(test-case 
 "Si tous les lancés dans la goutière"
 (check-equal? (score (make-list 20 0)) 0 "le score est de 0"))

(test-case 
 "Si tous les lancés font tomber une quille"
 (check-equal? (score (make-list 20 1)) 20 "le score est de 20"))

(test-case
 "Si on fait un spare"
 (check-equal? (score (append (list 3 7 4) (make-list 17 0))) 18 "Le score est celui du spare plus le bonus"))

(test-case
 "Si on fait un strike"
 (check-equal? (score (append (list 10 3 4) (make-list 16 0))) 24 "Le score est celui du strike plus le bonus"))

(test-case
 "Si on fait une partie parfaite"
 (check-equal? (score (make-list 12 10)) 300 "Le score est de 300"))