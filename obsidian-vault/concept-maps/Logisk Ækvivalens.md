---
tags:
  - logic
  - discrete-math
  - 01017
  - equivalence
---

# Logisk Ækvivalens

## Definition

To sammensatte propositioner $p$ og $q$ er **logisk ækvivalente** hvis de har samme sandhedsværdi under alle mulige tildeling af sandhedsværdier til deres atomare propositioner.

**Notation:** $p \equiv q$ eller $p \Leftrightarrow q$

## Metoder til at Bevise Ækvivalens

### 1. Sandhedstabel
Konstruer sandhedstabeller for begge propositioner og verificer at alle rækker er identiske.

### 2. Logiske Love
Anvend kendte ækvivalenslove til at transformere den ene proposition til den anden.

## Vigtige Ækvivalenslove

### De Morgans Love
$$\neg(p \land q) \equiv \neg p \lor \neg q$$
$$\neg(p \lor q) \equiv \neg p \land \neg q$$

### Kommutativitet
$$p \land q \equiv q \land p$$
$$p \lor q \equiv q \lor p$$

### Associativitet
$$(p \land q) \land r \equiv p \land (q \land r)$$
$$(p \lor q) \lor r \equiv p \lor (q \lor r)$$

### Distributivitet
$$p \land (q \lor r) \equiv (p \land q) \lor (p \land r)$$
$$p \lor (q \land r) \equiv (p \lor q) \land (p \lor r)$$

### Dobbelt Negation
$$\neg(\neg p) \equiv p$$

### Identitetslove
$$p \land T \equiv p$$
$$p \lor F \equiv p$$

### Dominans Love
$$p \land F \equiv F$$
$$p \lor T \equiv T$$

### Implikation som Disjunction
$$p \to q \equiv \neg p \lor q$$

### Kontrapositive Ækvivalens
$$p \to q \equiv \neg q \to \neg p$$

### Bikonditional
$$p \leftrightarrow q \equiv (p \to q) \land (q \to p)$$

## Eksempler

**Eksempel 1: Bevis at $\neg(p \land q) \equiv \neg p \lor \neg q$**

| $p$ | $q$ | $p \land q$ | $\neg(p \land q)$ | $\neg p$ | $\neg q$ | $\neg p \lor \neg q$ |
|-----|-----|-------------|-------------------|----------|----------|----------------------|
| T   | T   | T           | F                 | F        | F        | F                    |
| T   | F   | F           | T                 | F        | T        | T                    |
| F   | T   | F           | T                 | T        | F        | T                    |
| F   | F   | F           | T                 | T        | T        | T                    |

Kolonner 4 og 7 er identiske, så propositionerne er ækvivalente.

**Eksempel 2: Simplificering**

Simplificer: $(p \land q) \lor (p \land \neg q)$

$$\begin{align}
(p \land q) \lor (p \land \neg q) &\equiv p \land (q \lor \neg q) \quad \text{(distributivitet)} \\
&\equiv p \land T \quad \text{(tautologi)} \\
&\equiv p \quad \text{(identitet)}
\end{align}$$

## Related Concepts

- [[Propositioner (Propositions)]]
- [[Logiske Operatorer]]
- [[De Morgans Love]]
- [[Kontrapositive og Converse]]
- [[Sandhedstabeller]]
- [[Tautologier og Kontradiktioner]]

## Covered In

- [[2025-09-04-01017-lecture.pdf#page=2|01017 Lecture Sep 04]]
- Multiple 01017 lectures (september 2025)

## Course

[[01017-Discrete Mathematics]]

## Prerequisites

- [[Propositioner (Propositions)]]
- [[Logiske Operatorer]]
- Sandhedstabeller

## Applications

- Forenkling af logiske udtryk i programmering
- Optimering af boolean expressions
- Bevis i matematik
- Digital logik design (circuit simplification)
- SAT solvers
