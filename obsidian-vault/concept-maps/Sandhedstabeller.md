---
tags:
  - logic
  - discrete-math
  - 01017
  - fundamentals
---

# Sandhedstabeller

## Definition

En **sandhedstabel** (truth table) er en matematisk tabel der viser sandhedsværdien af en sammensat proposition for alle mulige kombinationer af sandhedsværdier for dens atomare propositioner.

## Formål

Sandhedstabeller bruges til at:
1. Analysere logiske udtryk
2. Bevise logisk ækvivalens
3. Identificere tautologier og kontradiktioner
4. Designe digitale kredsløb

## Struktur

For $n$ propositioner er der $2^n$ rækker i sandhedstabellen (én for hver kombination).

### Grundlæggende Operatorer

**Negation ($\neg$):**

| $p$ | $\neg p$ |
|-----|----------|
| T   | F        |
| F   | T        |

**Konjunktion ($\land$):**

| $p$ | $q$ | $p \land q$ |
|-----|-----|-------------|
| T   | T   | T           |
| T   | F   | F           |
| F   | T   | F           |
| F   | F   | F           |

**Disjunktion ($\lor$):**

| $p$ | $q$ | $p \lor q$ |
|-----|-----|------------|
| T   | T   | T          |
| T   | F   | T          |
| F   | T   | T          |
| F   | F   | F          |

**Implikation ($\to$):**

| $p$ | $q$ | $p \to q$ |
|-----|-----|-----------|
| T   | T   | T         |
| T   | F   | F         |
| F   | T   | T         |
| F   | F   | T         |

**Bikonditional ($\leftrightarrow$):**

| $p$ | $q$ | $p \leftrightarrow q$ |
|-----|-----|-----------------------|
| T   | T   | T                     |
| T   | F   | F                     |
| F   | T   | F                     |
| F   | F   | T                     |

## Komplekse Udtryk

For at konstruere sandhedstabel for $(p \lor q) \land \neg r$:

| $p$ | $q$ | $r$ | $p \lor q$ | $\neg r$ | $(p \lor q) \land \neg r$ |
|-----|-----|-----|------------|----------|---------------------------|
| T   | T   | T   | T          | F        | F                         |
| T   | T   | F   | T          | T        | T                         |
| T   | F   | T   | T          | F        | F                         |
| T   | F   | F   | T          | T        | T                         |
| F   | T   | T   | T          | F        | F                         |
| F   | T   | F   | T          | T        | T                         |
| F   | F   | T   | F          | F        | F                         |
| F   | F   | F   | F          | T        | F                         |

## Anvendelse: Bevis Logisk Ækvivalens

For at bevise $\neg(p \land q) \equiv \neg p \lor \neg q$ (De Morgans lov):

| $p$ | $q$ | $p \land q$ | $\neg(p \land q)$ | $\neg p$ | $\neg q$ | $\neg p \lor \neg q$ |
|-----|-----|-------------|-------------------|----------|----------|----------------------|
| T   | T   | T           | F                 | F        | F        | F                    |
| T   | F   | F           | T                 | F        | T        | T                    |
| F   | T   | F           | T                 | T        | F        | T                    |
| F   | F   | F           | T                 | T        | T        | T                    |

Kolonner 4 og 7 er identiske, derfor er udtrykkene ækvivalente.

## Tautologier og Kontradiktioner

**Tautologi:** Altid sand (alle rækker T)

**Eksempel:** $p \lor \neg p$

| $p$ | $\neg p$ | $p \lor \neg p$ |
|-----|----------|-----------------|
| T   | F        | T               |
| F   | T        | T               |

**Kontradiktion:** Altid falsk (alle rækker F)

**Eksempel:** $p \land \neg p$

| $p$ | $\neg p$ | $p \land \neg p$ |
|-----|----------|------------------|
| T   | F        | F                |
| F   | T        | F                |

Se [[Tautologier og Kontradiktioner]]

## Related Concepts

- [[Propositioner (Propositions)]]
- [[Logiske Operatorer]]
- [[Conjunction og Disjunction]]
- [[Negation]]
- [[Implikation og Biimplikation]]
- [[Logisk Ækvivalens]]
- [[De Morgans Love]]
- [[Tautologier og Kontradiktioner]]

## Covered In

- [[2025-09-04-01017-lecture.pdf|01017 Lecture Sep 04]]
- Multiple 01017 lectures

## Course

[[01017-Discrete Mathematics]]

## Prerequisites

- [[Propositioner (Propositions)]]
- [[Logiske Operatorer]]

## Applications

- Digital circuit design
- Boolean algebra simplification
- Programming (conditional logic)
- Formal verification
- Database query optimization
