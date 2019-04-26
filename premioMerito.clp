(deftemplate nota
0 10 nota_final
 ((baixa (z 0 4))
  (media (4 0)(6 1)(8 0))
  (alta (s 8 10))
 )
)
;(plot-fuzzy-value t "=TV" 0 10(create-fuzzy-value nota baixa)
;(create-fuzzy-value nota media)(create-fuzzy-value nota alta))

(deftemplate frequencia
0 25 faltas
 ((alta (z 0 5))
  (media (5 0)(9 1)(11 0))
  (baixa (s 12 25))
 )
)

;(plot-fuzzy-value t "-+|" 0 25(create-fuzzy-value frequencia alta)
;(create-fuzzy-value frequencia media)(create-fuzzy-value frequencia baixa))


(deftemplate chance
0 100 porcento
    ((sem_chance (z 0 55))
    (com_chance (60 0)(80 1)(100 0))
    )
)
;(plot-fuzzy-value t "TV" 0 80(create-fuzzy-value chance sem_chance)
;(create-fuzzy-value chance com_chance))

; primeira regra o aluno tem chance nota alta 
(defrule regra_um
  (declare (salience 10))
  (nota alta)
  (frequencia alta)
  
=>
  (assert (chance com_chance))
)

; segunda regra nota média frequencia alta 
(defrule regra_dois
  (declare (salience 10))
  (nota media)
  (frequencia alta)
  
=>
  (assert (chance com_chance))
)

; terceira regra nota média frequencia média 
(defrule regra_dois
  (declare (salience 10))
  (nota media)
  (frequencia media)
  
=>
  (assert (chance sem_chance))
)


; deffacts 

;fato 1
(deffact fatos
(notas (8 0)(9 1)(9 0))
(frequencia (0 0)(0 1)(0 0))

;fato 2
(deffact fatos
(notas (2 0)(3 1)(4 0))
(frequencia (0 0)(5 1)(6 0))

; fato 3
(deffact fatos
(notas (7 0)(8 1)(8.5 0))
(frequencia (5 0)(8 1)(12 0))

