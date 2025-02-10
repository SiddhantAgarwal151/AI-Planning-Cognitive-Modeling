# Hero's Quest Interactive Story Planning

## Overview
This project implements an interactive text-based story using an AI planning system (PDDL). In this story, the hero must defeat an evil villain and rescue a princess. The planning model includes at least 10 actions with multiple solution paths.

## How to Run
1. Clone or download this repository.
2. Make sure you have Python installed. This project uses [pyperplan](https://github.com/aibasel/pyperplan) as the planner.
3. Install the required software (if using pyperplan, follow its installation instructions).
4. Run the planner with the following commands:
   - For the domain: `pyperplan --domain hero_quest_domain.pddl --problem hero_quest_problem.pddl`
5. To simulate an interactive session:
   - Use your favorite shell or a simple Python script that reads user input.
   - The script converts user commands into actions (or suggestions for actions) in the planning system.
   - Optionally, integrate an LLM (e.g., GPT) to generate natural language output from the current state or action effects.

## Extending the Interaction
- Each action can be supplemented with additional rule-based finite state machine interaction rules.
- These rules can add flavor text, branching dialog choices, or even unexpected interactions similar to the design of beats in Façade.
- For example, when executing `interrogate_npc`, the system can ask follow-up questions and allow the user to steer the conversation.

## Files Included
- `hero_quest_domain.pddl`: The domain definition with predicates and actions.
- `hero_quest_problem.pddl`: The problem file that sets the initial state and goals.
- `interactive_story.py`: (Optional) A sample Python driver that demonstrates how to prompt the planner based on user input.
- `README.md`: This file.

## Running Sample Interactions
Two example transcript logs (provided below) demonstrate how the system might handle input.