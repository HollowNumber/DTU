---
tags:
  - matematik
  - multivariable-calculus
  - 01002
  - vectors
---

# Koordinatfunktioner

## Definition
For en vektorfunktion $\mathbf{f}: A \to \mathbb{R}^k$, kan vi skrive output som:

$$\mathbf{f}(\mathbf{x}) = \begin{bmatrix} f_1(\mathbf{x}) \\ f_2(\mathbf{x}) \\ \vdots \\ f_k(\mathbf{x}) \end{bmatrix}$$

Funktionerne $f_1, f_2, \ldots, f_k$ kaldes **koordinatfunktioner** for $\mathbf{f}$.

Hver $f_i: A \to \mathbb{R}$ er en skalarfunktion.

## Example
For en lineær transformation $\mathbf{f}(\mathbf{x}) = A\mathbf{x}$ med:

$$A = \begin{bmatrix} 1 & 2 \\ 2 & 4 \end{bmatrix}$$

Koordinatfunktionerne er:
- $f_1(x_1, x_2) = x_1 + 2x_2$
- $f_2(x_1, x_2) = 2x_1 + 4x_2$

## Importance
- Gør det muligt at analysere vektorfunktioner komponent for komponent
- Hver koordinatfunktion kan behandles separat
- Nyttigt for kontinuitet og differentiabilitet (tjek hver komponent)

## Related Concepts
- [[Vektorfunktioner]] - Overordnet koncept
- [[Lineære Transformationer]] - Specielt tilfælde
- [[Partielle Afledede]] - Bruges til at analysere koordinatfunktioner

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=1|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

