---
tags:
  - logic
  - discrete-math
  - 01017
  - fundamentals
---

# Propositioner (Propositions)

## Definition
En **proposition** (udsagn) er en deklarativ sætning der erklærer et faktum, som enten er sandt eller falsk, men ikke begge dele.

## Characteristics
- Declarative (not questions or commands)
- Has definite truth value (T or F)
- Cannot be both true and false

## Examples

### Valid Propositions
1. "Washington D.C. is the capital of the USA" (T)
2. "Toronto is the capital of Canada" (F)
3. "$1 + 1 = 2$" (T)
4. "$2 + 2 = 3$" (F)

### NOT Propositions
1. "What time is it?" (question)
2. "Read this carefully" (command)
3. "$x + 1 = 2$" (depends on $x$ - not definite)
4. "$x + y = z$" (depends on variables)

## Notation
- **Propositional variables**: $p, q, r, s, \ldots$
- **Truth values**: 
  - $T$ or $\top$ or 1 (true)
  - $F$ or $\bot$ or 0 (false)

## Atomic vs Compound
- **Atomic propositions**: Cannot be broken down further
  - Example: "$2 + 2 = 4$"
- **Compound propositions**: Built from simpler propositions using [[Logiske Operatorer]]
  - Example: "It is raining **and** the ground is wet"

## Related Concepts
- [[Logiske Operatorer]] - Ways to combine propositions
- [[Negation]] - Forming $\neg p$
- [[Conjunction og Disjunction]] - AND and OR
- [[Implikation og Biimplikation]] - IF-THEN statements
- [[Kontrapositive og Converse]] - Transformations of conditionals
- [[Logisk Ækvivalens]] - When propositions have same truth values

## Covered In
- [[2025-09-04-01017-lecture.pdf|01017 Lecture Sep 04, 2025]]

## Course
[[01017-Discrete Mathematics]]

## Applications
- Logic circuits in computer hardware
- Boolean algebra in programming
- Conditional statements in code (if-then)
- Database queries
- Proof verification

## Connection to Programming
```python
# Propositions in Python
p = True   # "It is raining"
q = False  # "It is sunny"

# Compound proposition: "It is raining AND sunny"
result = p and q  # False
```

