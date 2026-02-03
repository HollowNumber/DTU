---
tags:
  - logic
  - discrete-math
  - 01017
  - proof-techniques
---

# Kontrapositive og Converse

## Definition

Givet en betinget udsagn (conditional statement) $p \to q$:

### Converse (Omvendt)
**Converse** bytter hypotese og konklusion:
$$q \to p$$

**IKKE logisk ækvivalent** med originalen

### Contrapositive (Kontrapositive)
**Contrapositive** negerer begge dele og bytter rækkefølgen:
$$\neg q \to \neg p$$

**ER logisk ækvivalent** med originalen

### Inverse (Invers)
**Inverse** negerer begge dele men holder samme rækkefølge:
$$\neg p \to \neg q$$

**IKKE logisk ækvivalent** med originalen

## Eksempler

**Original:** "Hvis det regner, så er jorden våd"  
$p \to q$

**Converse:** "Hvis jorden er våd, så regner det"  
$q \to p$ (FALSK - kunne være en sprinkler)

**Contrapositive:** "Hvis jorden ikke er våd, så regner det ikke"  
$\neg q \to \neg p$ (SAND - logisk ækvivalent)

**Inverse:** "Hvis det ikke regner, så er jorden ikke våd"  
$\neg p \to \neg q$ (FALSK - kunne være en sprinkler)

## Sandhedstabel

| $p$ | $q$ | $p \to q$ | $q \to p$ | $\neg q \to \neg p$ | $\neg p \to \neg q$ |
|-----|-----|-----------|-----------|---------------------|---------------------|
| T   | T   | T         | T         | T                   | T                   |
| T   | F   | F         | T         | F                   | T                   |
| F   | T   | T         | F         | T                   | F                   |
| F   | F   | T         | T         | T                   | T                   |

Bemærk: kolonner 3 og 5 er identiske (contrapositive er ækvivalent)

## Related Concepts

- [[Implikation og Biimplikation]]
- [[Propositioner (Propositions)]]
- [[Logiske Operatorer]]
- [[Logisk Ækvivalens]]

## Covered In

- [[2025-09-04-01017-lecture.pdf#page=3|01017 Lecture Sep 04]]

## Course

[[01017-Discrete Mathematics]]

## Prerequisites

- [[Propositioner (Propositions)]]
- [[Implikation og Biimplikation]]

## Applications

- Matematiske beviser (især bevis ved kontraposition)
- Logisk ræsonnering
- Programmering (conditionals)
- Fejlfinding i logik
