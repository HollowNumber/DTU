---
tags:
  - logic
  - discrete-math
  - 01017
  - fundamentals
---

# Logiske Operatorer

## Definition
**Logiske operatorer** (logical connectives) bruges til at konstruere nye propositioner fra eksisterende propositioner.

## Primary Operators

### Negation ($\neg$)
**Symbol**: $\neg p$ (også $\overline{p}$, $\sim p$, $!p$)

**Meaning**: "not $p$" eller "it is not the case that $p$"

**Truth Table**:
| $p$ | $\neg p$ |
|-----|----------|
| T   | F        |
| F   | T        |

Se også: [[Negation]]

### Conjunction ($\land$)
**Symbol**: $p \land q$

**Meaning**: "$p$ and $q$"

**Truth**: True only when **both** $p$ and $q$ are true

**Truth Table**:
| $p$ | $q$ | $p \land q$ |
|-----|-----|-------------|
| T   | T   | T           |
| T   | F   | F           |
| F   | T   | F           |
| F   | F   | F           |

### Disjunction ($\lor$)
**Symbol**: $p \lor q$

**Meaning**: "$p$ or $q$" (inclusive OR)

**Truth**: False only when **both** $p$ and $q$ are false

**Truth Table**:
| $p$ | $q$ | $p \lor q$ |
|-----|-----|------------|
| T   | T   | T          |
| T   | F   | T          |
| F   | T   | T          |
| F   | F   | F          |

### Exclusive OR ($\oplus$)
**Symbol**: $p \oplus q$ (også XOR)

**Meaning**: "$p$ or $q$ but not both"

**Truth**: True when **exactly one** is true

**Truth Table**:
| $p$ | $q$ | $p \oplus q$ |
|-----|-----|--------------|
| T   | T   | F            |
| T   | F   | T            |
| F   | T   | T            |
| F   | F   | F            |

### Implication ($\to$)
**Symbol**: $p \to q$ (også $p \Rightarrow q$)

**Meaning**: "if $p$, then $q$"

**Truth**: False only when $p$ is true and $q$ is false

**Truth Table**:
| $p$ | $q$ | $p \to q$ |
|-----|-----|-----------|
| T   | T   | T         |
| T   | F   | F         |
| F   | T   | T         |
| F   | F   | T         |

#note-box[
  When $p$ is false, $p \to q$ is **always true** (vacuously true)!
]

See: [[Implikation og Biimplikation]]

### Biconditional ($\leftrightarrow$)
**Symbol**: $p \leftrightarrow q$ (også $p \Leftrightarrow q$)

**Meaning**: "$p$ if and only if $q$" (abbreviated: "$p$ iff $q$")

**Truth**: True when $p$ and $q$ have the **same truth value**

**Truth Table**:
| $p$ | $q$ | $p \leftrightarrow q$ |
|-----|-----|----------------------|
| T   | T   | T                    |
| T   | F   | F                    |
| F   | T   | F                    |
| F   | F   | T                    |

## Operator Precedence
From highest to lowest:
1. $\neg$ (negation)
2. $\land$ (conjunction)
3. $\lor$ (disjunction)
4. $\to$ (implication)
5. $\leftrightarrow$ (biconditional)

Example: $\neg p \land q \to r$ means $((\neg p) \land q) \to r$

## Alternative Notations

| Concept | Math | Programming |
|---------|------|-------------|
| Negation | $\neg p$ | `!p`, `not p` |
| Conjunction | $p \land q$ | `p && q`, `p and q` |
| Disjunction | $p \lor q$ | `p \|\| q`, `p or q` |
| XOR | $p \oplus q$ | `p ^ q`, `p xor q` |
| Implication | $p \to q$ | `!p \|\| q` |

## Related Concepts
- [[Propositioner (Propositions)]] - What operators work on
- [[Konjunktion og Disjunktion]] - Detailed AND/OR
- [[Implikation og Biimplikation]] - Detailed IF-THEN
- [[Truth Tables]] - Analyzing complex expressions
- [[Logisk Ækvivalens]] - When two expressions are the same

## Covered In
- [[2025-09-04-01017-lecture.pdf|01017 Lecture Sep 04, 2025]]

## Course
[[01017-Discrete Mathematics]]

## Applications
- Digital logic circuits
- Boolean expressions in programming
- Database query logic (SQL WHERE clauses)
- Proof construction
- Conditional logic in AI

## Programming Examples

### Python
```python
p = True
q = False

# Conjunction
result1 = p and q  # False

# Disjunction
result2 = p or q   # True

# Negation
result3 = not p    # False

# Implication (no direct operator)
result4 = (not p) or q  # False
```

### Logic Circuit
```
    p ──┬── NOT ──┐
        │         AND ── output
    q ──┴─────────┘
```
This implements $\neg p \land q$

