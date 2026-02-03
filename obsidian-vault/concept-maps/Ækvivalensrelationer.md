---
tags:
  - discrete-math
  - relations
  - 01017
  - set-theory
---

# Ækvivalensrelationer

## Definition
En relation $R$ på en mængde $S$ er en **ækvivalensrelation** hvis og kun hvis den opfylder tre egenskaber:

### 1. Reflexive (Refleksiv)
$$\forall a \in S: a R a$$

Hvert element er relateret til sig selv.

### 2. Symmetric (Symmetrisk)
$$\forall a, b \in S: a R b \Rightarrow b R a$$

Hvis $a$ relaterer til $b$, så relaterer $b$ til $a$.

### 3. Transitive (Transitiv)
$$\forall a, b, c \in S: (a R b \land b R c) \Rightarrow a R c$$

Hvis $a$ relaterer til $b$ og $b$ relaterer til $c$, så relaterer $a$ til $c$.

## Notation
Når $R$ er en ækvivalensrelation, skriver vi ofte $\sim$ i stedet for $R$:
$$a \sim b$$

## Ækvivalensklasser

### Definition
For et element $a \in S$, er **ækvivalensklassen** af $a$ defineret som:

$$[a]_{\sim} = \{x \in S \mid x \sim a\}$$

Alle elementer der er ækvivalente med $a$.

### Example: Congruence Modulo 4
Relation: $a \equiv b \pmod{4}$ (dvs. $4 | (a-b)$)

**Ækvivalensklasser**:
$$[0]_{\equiv 4} = \{\ldots, -8, -4, 0, 4, 8, 12, \ldots\}$$
$$[1]_{\equiv 4} = \{\ldots, -3, 1, 5, 9, 13, \ldots\}$$
$$[2]_{\equiv 4} = \{\ldots, -2, 2, 6, 10, 14, \ldots\}$$
$$[3]_{\equiv 4} = \{\ldots, -1, 3, 7, 11, 15, \ldots\}$$

Disse fire klasser:
- Er **disjunkte** (ingen overlap)
- **Dækker** hele $\mathbb{Z}$ (hver integer er i præcis én klasse)
- Kaldes en **partition** af $\mathbb{Z}$

## Important Properties

### Theorem
Lad $\sim$ være en ækvivalensrelation på $S$. Følgende tre udsagn er ækvivalente:

1. $a \sim b$
2. $[a]_{\sim} = [b]_{\sim}$
3. $[a]_{\sim} \cap [b]_{\sim} = \emptyset$

**Intuition**: 
- Hvis $a$ og $b$ er relaterede, har de samme ækvivalensklasse
- Hvis ikke relaterede, har de disjunkte klasser
- Der er ingen "partial overlap"

### Partition Property
Ækvivalensklasser partitionerer mængden $S$:
- Every element is in exactly one equivalence class
- Classes are either identical or disjoint
- Union of all classes equals $S$

## Common Examples

### 1. Equality ($=$)
På enhver mængde $S$:
- Reflexive: $a = a$ ✓
- Symmetric: $a = b \Rightarrow b = a$ ✓
- Transitive: $a = b \land b = c \Rightarrow a = c$ ✓

Ækvivalensklasser: Singleton sets $\{a\}$

### 2. Congruence Modulo n
På $\mathbb{Z}$: $a \equiv b \pmod{n}$
- Reflexive: $n | (a - a) = 0$ ✓
- Symmetric: $n | (a - b) \Rightarrow n | (b - a)$ ✓
- Transitive: Yes ✓

Ækvivalensklasser: $[0], [1], \ldots, [n-1]$

### 3. Same Last Name
På en mængde af personer:
- Reflexive: Same last name as yourself ✓
- Symmetric: If you share last name with me, I share with you ✓
- Transitive: If A and B share, and B and C share, then A and C share ✓

Ækvivalensklasser: Families with same surname

### 4. Parallel Lines
På mængden af linjer i planet:
- Reflexive: Line is parallel to itself ✓
- Symmetric: If $l_1 \parallel l_2$, then $l_2 \parallel l_1$ ✓
- Transitive: If $l_1 \parallel l_2$ and $l_2 \parallel l_3$, then $l_1 \parallel l_3$ ✓

Ækvivalensklasser: All lines with same slope

## Counter-Example: Not Equivalence

**Relation**: $<$ (less than) on $\mathbb{Z}$

- Reflexive? NO: $a \not< a$
- Symmetric? NO: $2 < 3$ but $3 \not< 2$
- Transitive? YES: $a < b \land b < c \Rightarrow a < c$

Missing reflexivity and symmetry → not an equivalence relation!

## Related Concepts
- [[Relationer]] - General relations
- [[Ækvivalensklasser]] - Classes formed by equivalence
- [[Partially Ordered Sets (Posets)]] - Different type of relation
- [[Mængder (Sets)]] - Sets that relations work on

## Covered In
- [[2025-11-20-01017-lecture.pdf|01017 Lecture Nov 20, 2025]]

## Course
[[01017-Discrete Mathematics]]

## Prerequisites
- [[Relationer]]
- [[Mængder (Sets)]]
- [[Logiske Operatorer]] - For understanding quantifiers

## Applications
- Modular arithmetic (cryptography)
- Classification problems (machine learning)
- Abstract algebra (quotient groups)
- Type systems in programming
- Database normalization

## Programming Example
```python
# Equivalence relation: same remainder when divided by 4
def equivalence_class_mod_4(a):
    """Returns the equivalence class [a] under ≡_4"""
    return a % 4

# Check if two numbers are equivalent
def equivalent_mod_4(a, b):
    return equivalence_class_mod_4(a) == equivalence_class_mod_4(b)

# Examples
print(equivalent_mod_4(5, 9))   # True (both in [1])
print(equivalent_mod_4(5, 10))  # False (5 in [1], 10 in [2])
```

