---
tags:
  - matematik
  - multivariable-calculus
  - 01002
  - linear-algebra
---

# Vektorfunktioner

## Definition
En **vektorfunktion** er en funktion af typen $f: A \to \mathbb{R}^k$ hvor $A = \text{dom}(f) \subseteq \mathbb{R}^n$.

Vektorfunktionen kaldes en funktion af $n$ variabler med $k$-dimensionelle output.

## Key Components
- **Domæne** ($\text{dom}(f)$): Definitionsmængden - [[Domæne og Billedrum]]
- **Codomæne** ($\text{codom}(f)$): Dispositionsmængden
- **Billedrum** ($\text{im}(f)$): Værdimængden (image/range)

## Related Concepts
- [[Koordinatfunktioner]] - Komponenterne af en vektorfunktion
- [[Lineære Transformationer]] - Specielt tilfælde hvor $f(x) = Ax$
- [[Injektivitet og Surjektivitet]] - Egenskaber for vektorfunktioner
- [[Neurale Netværk]] - Kompositioner af vektorfunktioner

## Examples
### Linear Vector Function
$$f(x) = Ax$$
hvor $A \in \mathbb{R}^{k \times n}$

### Non-linear Vector Function
$$\text{ReLU}: \mathbb{R}^n \to \mathbb{R}^n$$

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=1|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

## Prerequisites
- [[Lineær Algebra]]
- [[Funktioner]]

## Applications
- [[Neurale Netværk]] - Hver lag er en vektorfunktion
- [[Computer Graphics]] - Transformationer
- Machine Learning - Feature mappings

