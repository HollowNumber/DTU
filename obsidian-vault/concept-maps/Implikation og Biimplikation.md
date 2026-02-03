---
tags:
  - logic
  - discrete-math
  - 01017
  - conditionals
---

# Implikation og Biimplikation

## Implication ($p \to q$)

### Definition
**Conditional statement** (implikation): "if $p$, then $q$"

- **$p$**: hypothesis (antecedent, premise)
- **$q$**: conclusion (consequent)

### Truth Table
| $p$ | $q$ | $p \to q$ |
|-----|-----|-----------|
| T   | T   | T         |
| T   | F   | F         |
| F   | T   | T         |
| F   | F   | T         |

**Key insight**: $p \to q$ is false **only** when $p$ is true and $q$ is false!

### Why is False → Anything True?
When the hypothesis is false, the implication is **vacuously true**.

Example: "If pigs can fly, then I'm the king of Denmark"
- Pigs can't fly (false premise)
- So the entire statement is vacuously true (doesn't matter what the conclusion is)

## Related Forms of $p \to q$

### Converse
**Definition**: Switch hypothesis and conclusion

$$q \to p$$

Example:
- Original: "If it's raining, then the ground is wet"
- Converse: "If the ground is wet, then it's raining"

#important[
  The converse is **NOT** logically equivalent to the original!
  
  The ground could be wet from a sprinkler.
]

### Contrapositive
**Definition**: Negate both and switch order

$$\neg q \to \neg p$$

Example:
- Original: "If it's raining, then the ground is wet"
- Contrapositive: "If the ground is not wet, then it's not raining"

#important[
  The contrapositive **IS** logically equivalent to the original!
  
  They always have the same truth value.
]

### Inverse
**Definition**: Negate both but keep order

$$\neg p \to \neg q$$

Example:
- Original: "If it's raining, then the ground is wet"
- Inverse: "If it's not raining, then the ground is not wet"

#important[
  The inverse is **NOT** logically equivalent to the original!
  
  (Same issue as converse - sprinkler could wet the ground)
]

## Summary Table

| Form | Expression | Equivalent To |
|------|------------|---------------|
| Original | $p \to q$ | Contrapositive |
| Converse | $q \to p$ | Inverse |
| Contrapositive | $\neg q \to \neg p$ | Original |
| Inverse | $\neg p \to \neg q$ | Converse |

## Biconditional ($p \leftrightarrow q$)

### Definition
"$p$ if and only if $q$" (abbreviated: "$p$ iff $q$")

$$p \leftrightarrow q \equiv (p \to q) \land (q \to p)$$

### Truth Table
| $p$ | $q$ | $p \leftrightarrow q$ |
|-----|-----|----------------------|
| T   | T   | T                    |
| T   | F   | F                    |
| F   | T   | F                    |
| F   | F   | T                    |

**Meaning**: True when $p$ and $q$ have the **same truth value**

### Example
"A triangle is equilateral **if and only if** all three sides are equal"

This means:
1. If triangle is equilateral → all sides equal (forward)
2. If all sides equal → triangle is equilateral (backward)

## Programming Equivalents

### Implication
```python
# p → q is equivalent to (not p) or q
def implies(p, q):
    return (not p) or q

# Example
p = True
q = False
result = implies(p, q)  # False
```

### Contrapositive in Code
```python
# These are equivalent:
if p:
    assert q  # p → q

if not q:
    assert not p  # ¬q → ¬p (contrapositive)
```

## Proof Techniques

### Direct Proof
Assume $p$ is true, prove $q$ is true.

### Contrapositive Proof
Assume $\neg q$ is true, prove $\neg p$ is true.

Often easier than direct proof!

### Example
**Claim**: If $n^2$ is even, then $n$ is even

**Contrapositive**: If $n$ is odd, then $n^2$ is odd
- Assume $n$ is odd: $n = 2k + 1$
- Then $n^2 = (2k+1)^2 = 4k^2 + 4k + 1 = 2(2k^2 + 2k) + 1$ (odd)
- Therefore the original claim is true! ✓

## Related Concepts
- [[Logiske Operatorer]]
- [[Kontraposition og Konvers]]
- [[Propositioner (Propositions)]]
- [[Logisk Ækvivalens]]
- [[Proof Techniques]]

## Covered In
- [[2025-09-04-01017-lecture.pdf|01017 Lecture Sep 04, 2025]]

## Course
[[01017-Discrete Mathematics]]

## Applications
- Mathematical proofs (especially contrapositive proofs)
- Program verification (pre/post conditions)
- Database integrity constraints
- Logic puzzles
- Formal specification in software engineering

