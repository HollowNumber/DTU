---
tags:
  - logic
  - discrete-math
  - 01017
  - boolean-operators
---

# Conjunction og Disjunction

## Definition

### Conjunction (Konjunktion)

For propositioner $p$ og $q$, er **konjunktionen** $p \land q$ (læses "$p$ og $q$") sand når både $p$ og $q$ er sande, ellers falsk.

**Sandhedstabel:**

| $p$ | $q$ | $p \land q$ |
|-----|-----|-------------|
| T   | T   | T           |
| T   | F   | F           |
| F   | T   | F           |
| F   | F   | F           |

### Disjunction (Disjunktion)

For propositioner $p$ og $q$, er **disjunktionen** $p \lor q$ (læses "$p$ eller $q$") falsk når både $p$ og $q$ er falske, ellers sand.

**Sandhedstabel:**

| $p$ | $q$ | $p \lor q$ |
|-----|-----|------------|
| T   | T   | T          |
| T   | F   | T          |
| F   | T   | T          |
| F   | F   | F          |

### Exclusive Or (Eksklusiv Or)

For propositioner $p$ og $q$, er **eksklusiv or** $p \oplus q$ (også $p \text{ XOR } q$) sand når nøjagtigt én af $p$ og $q$ er sand.

**Sandhedstabel:**

| $p$ | $q$ | $p \oplus q$ |
|-----|-----|--------------|
| T   | T   | F            |
| T   | F   | T            |
| F   | T   | T            |
| F   | F   | F            |

## Forskelle

**Inclusive OR** ($\lor$): Sand når mindst én er sand (kan være begge)  
**Exclusive OR** ($\oplus$): Sand når nøjagtigt én er sand (ikke begge)

## Eksempler

**Conjunction:**
- $p$: "Det regner"
- $q$: "Det er koldt"
- $p \land q$: "Det regner OG det er koldt" (begge skal være sande)

**Disjunction:**
- $p$: "Jeg tager bussen"
- $q$: "Jeg tager toget"
- $p \lor q$: "Jeg tager bussen ELLER toget" (mindst én er sand)

**Exclusive Or:**
- $p$: "Kaffe med mælk"
- $q$: "Kaffe uden mælk"
- $p \oplus q$: "Enten mælk ELLER ikke mælk" (ikke begge)

## Related Concepts

- [[Propositioner (Propositions)]]
- [[Logiske Operatorer]]
- [[Negation]]
- [[Implikation og Biimplikation]]
- [[Sandhedstabeller]]

## Covered In

- [[2025-09-04-01017-lecture.pdf#page=1|01017 Lecture Sep 04]]

## Course

[[01017-Discrete Mathematics]]

## Prerequisites

- Forståelse af propositioner
- Sandhedsværdier (T/F)

## Applications

- Programmering (if-statements, boolean logic)
- Digital logik og kredsløb
- Database queries (SQL: AND, OR)
- Søgemaskiner (boolean search)
- Bevis i matematik
