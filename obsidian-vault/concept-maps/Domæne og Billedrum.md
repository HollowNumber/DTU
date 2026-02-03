---
tags:
  - matematik
  - functions
  - 01002
  - fundamentals
---

# Domæne og Billedrum

## Definitions

### Domæne (Domain)
**Domænet** $\text{dom}(f)$ eller $A$ er definitionsmængden - mængden af alle gyldige input til funktionen $f$.

$$\text{dom}(f) = A \subseteq \mathbb{R}^n$$

### Codomæne (Codomain)
**Codomænet** $\text{codom}(f)$ eller $B$ er dispositionsmængden - mængden hvor output potentielt kan ligge.

$$\text{codom}(f) = B$$

### Billedrum/Værdimængde (Image/Range)
**Billedrummet** $\text{im}(f)$ eller $\text{Vm}(f)$ er mængden af faktiske output værdier:

$$\text{im}(f) = \{f(\mathbf{x}) \mid \mathbf{x} \in \text{dom}(f)\}$$

## Key Relationship
$$\text{im}(f) \subseteq \text{codom}(f)$$

Ligehed gælder hvis og kun hvis $f$ er [[Injektivitet og Surjektivitet|surjektiv]].

## Example: Hemisphere Function
$$f(x_1, x_2) = \sqrt{16 - x_1^2 - x_2^2}$$

### Domæne
Kræver at argumentet til kvadratroden er ikke-negativ:
$$\text{dom}(f) = \{(x_1, x_2) \in \mathbb{R}^2 \mid x_1^2 + x_2^2 \leq 16\}$$

Dette er en disk med radius 4.

### Codomæne
$$\text{codom}(f) = \mathbb{R}$$

### Billedrum
$$f(0,0) = 4 \quad \text{(maksimum)}$$
$$f(4,0) = 0 \quad \text{(minimum)}$$

Derfor:
$$\text{im}(f) = [0, 4]$$

## Visualization
```
dom(f) ----f----> im(f) ⊆ codom(f)
 (input)        (output)
```

## For Vector Functions
For $\mathbf{f}: \mathbb{R}^n \to \mathbb{R}^k$:

$$\text{im}(\mathbf{f}) = \{\mathbf{f}(\mathbf{x}) \mid \mathbf{x} \in \mathbb{R}^n\}$$

### Linear Transformations
For $\mathbf{f}(\mathbf{x}) = A\mathbf{x}$:

$$\text{im}(\mathbf{f}) = \text{col}(A) = \text{span}(\text{columns of } A)$$

## Related Concepts
- [[Injektivitet og Surjektivitet]] - Surjektivitet betyder $\text{im}(f) = \text{codom}(f)$
- [[Vektorfunktioner]]
- [[Niveaukurver]] - Visualiserer domænet og billedrummet
- [[Lineær Algebra]] - Column space

## Importance
- Definerer hvor funktionen er veldefineret
- Vigtigt for at løse ligninger $f(\mathbf{x}) = \mathbf{y}$
- Bruges til at tjekke surjektivitet

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=1|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

## Prerequisites
- [[Mængdelære]]
- [[Funktioner]]

