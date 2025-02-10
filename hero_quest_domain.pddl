(define (domain hero_quest)
  (:requirements :strips :typing)
  (:types location item npc)
  
  (:predicates 
    (at ?p - person ?loc - location)
    (alive ?p - npc)
    (has ?p - person ?i - item)
    (gate_unlocked)
    (puzzle_solved)
    (spell_ready)
    (allied ?npc)
    (weapon_obtained)
    (villain_defeated)
    (princess_rescued)
    (quest_started)
  )

  ;; Action 1: Start Quest (or receive assignment)
  (:action start_quest
    :parameters (?hero - person ?village - location)
    :precondition (at ?hero ?village)
    :effect (quest_started)
  )

  ;; Action 2: Obtain Weapon
  (:action obtain_weapon
    :parameters (?hero - person ?village - location ?sword - item)
    :precondition (and (at ?hero ?village) (quest_started))
    :effect (weapon_obtained)
  )

  ;; Action 3: Explore Forest
  (:action explore_forest
    :parameters (?hero - person ?forest - location)
    :precondition (at ?hero ?forest)
    :effect (has ?hero treasure)  ;; could be some item; not strictly required
  )
  
  ;; Action 4: Fight Guard
  (:action fight_guard
    :parameters (?hero - person ?guard - npc ?loc - location)
    :precondition (and (at ?hero ?loc) (alive ?guard) (weapon_obtained))
    :effect (not (alive ?guard))
  )

  ;; Action 5: Interrogate NPC
  (:action interrogate_npc
    :parameters (?hero - person ?npc - npc ?loc - location)
    :precondition (and (at ?hero ?loc) (alive ?npc))
    :effect (allied ?npc)
  )

  ;; Action 6: Unlock Gate
  (:action unlock_gate
    :parameters (?hero - person ?loc - location)
    :precondition (and (at ?hero ?loc) (weapon_obtained))
    :effect (gate_unlocked)
  )

  ;; Action 7: Solve Puzzle
  (:action solve_puzzle
    :parameters (?hero - person ?loc - location)
    :precondition (at ?hero ?loc)
    :effect (puzzle_solved)
  )

  ;; Action 8: Cast Spell
  (:action cast_spell
    :parameters (?hero - person ?loc - location)
    :precondition (and (at ?hero ?loc) (puzzle_solved))
    :effect (spell_ready)
  )

  ;; Action 9: Rescue Princess
  (:action rescue_princess
    :parameters (?hero - person ?princess - npc ?loc - location)
    :precondition (and (at ?hero ?loc) (alive ?princess) (gate_unlocked))
    :effect (princess_rescued)
  )

  ;; Action 10: Defeat Villain
  (:action defeat_villain
    :parameters (?hero - person ?villain - npc ?loc - location)
    :precondition (and (at ?hero ?loc) (weapon_obtained)
                       (princess_rescued)
                       (or (spell_ready) (allied ?villain)) )  ;; multiple paths: use spell or allies
    :effect (villain_defeated)
  )
)