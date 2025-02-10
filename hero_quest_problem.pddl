(define (problem quest_instance)
  (:domain hero_quest)
  (:objects 
    hero - person
    village forest castle - location
    sword - item
    guard1 villain princess - npc
  )
  (:init 
    (at hero village)
    (alive guard1)
    (alive villain)
    (alive princess)
  )
  (:goal (and 
    (villain_defeated)
    (princess_rescued)
  ))
)