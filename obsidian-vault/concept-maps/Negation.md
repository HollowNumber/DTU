---
tags:
  - logic
  - discrete-math
  - 01017
  - boolean-operators
---

# Negation

## Definition

For en proposition $p$ er **negationen** af $p$, noteret $\neg p$ (også $\overline{p}$, $\sim p$, eller $!p$), propositionen:

"Det er ikke tilfældet at $p$"

Negationen $\neg p$ er sand når $p$ er falsk, og falsk når $p$ er sand.

**Sandhedstabel:**

| $p$ | $\neg p$ |
|-----|----------|
| T   | F        |
| F   | T        |

## Notationer

Forskellige notationer for negation:
- $\neg p$ (logik)
- $\overline{p}$ (alternativ)
- $\sim p$ (matematik)
- $-p$ (nogle kontekster)
- $Np$ (prefix notation)
- $!p$ (programmering)

## Eksempler

**Eksempel 1:**
- $p$: "Det regner"
- $\neg p$: "Det regner ikke" eller "Det er ikke tilfældet at det regner"

**Eksempel 2:**
- $p$: "$2 + 2 = 4$" (sand)
- $\neg p$: "$2 + 2 \neq 4$" (falsk)

**Eksempel 3:**
- $p$: "Alle fugle kan flyve" (falsk, pga. pingviner)
- $\neg p$: "Ikke alle fugle kan flyve" (sand)

## Dobbelt Negation

Reglen om dobbelt negation:
$$\neg(\neg p) \equiv p$$

To negationer ophæver hinanden.

**Eksempel:**
- $p$: "Jeg er sulten"
- $\neg p$: "Jeg er ikke sulten"
- $\neg(\neg p)$: "Jeg er ikke ikke-sulten" = "Jeg er sulten"

## De Morgans Love

Negation af konjunktion og disjunktion:

$$\neg(p \land q) \equiv \neg p \lor \neg q$$
$$\neg(p \lor q) \equiv \neg p \land \neg q$$

**Eksempel:**
- $p$: "Det regner", $q$: "Det er koldt"
- $\neg(p \land q)$: "Det er ikke tilfældet at det både regner og er koldt"
- $\neg p \lor \neg q$: "Det regner ikke eller det er ikke koldt" (ækvivalent)

## Related Concepts

- [[Propositioner (Propositions)]]
- [[Conjunction og Disjunction]]
- [[Logiske Operatorer]]
- [[De Morgans Love]]
- [[Kontrapositive og Converse]]

## Covered In

- [[2025-09-04-01017-lecture.pdf#page=1|01017 Lecture Sep 04]]

## Course

[[01017-Discrete Mathematics]]

## Prerequisites

- Forståelse af propositioner
- Sandhedsværdier

## Applications

- Programmering (NOT operator, !)
- Boolean algebra
- Logiske beviser
- Database queries
- Digital kredsløb (NOT gate)
