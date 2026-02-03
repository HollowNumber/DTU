---
tags:
  - matematik
  - functions
  - 01002
  - function-properties
---

# Injektivitet og Surjektivitet

## Definitions

### Injektiv (One-to-One)
En funktion $f: A \to B$ er **injektiv** hvis forskellige inputs giver forskellige outputs:

$$\forall x_1, x_2 \in A: x_1 \neq x_2 \Rightarrow f(x_1) \neq f(x_2)$$

Ækvivalent:
$$f(x_1) = f(x_2) \Rightarrow x_1 = x_2$$

### Surjektiv (Onto)
En funktion $f: A \to B$ er **surjektiv** hvis hvert element i $B$ er image af mindst ét element i $A$:

$$\forall y \in B \quad \exists x \in A: f(x) = y$$

Det vil sige: $\text{im}(f) = B$ (billedrummet er hele codomænet)

### Bijektiv
En funktion er **bijektiv** hvis den er både injektiv og surjektiv.

## Geometric Interpretation
- **Injektiv**: Horizontal line test - ingen vandret linje skærer grafen mere end én gang
- **Surjektiv**: Hver $y$-værdi i codomænet nås

## Examples

### Injektiv men ikke surjektiv
$$f: \mathbb{R} \to \mathbb{R}, \quad f(x) = e^x$$
- Injektiv: $e^{x_1} = e^{x_2} \Rightarrow x_1 = x_2$
- Ikke surjektiv: $\text{im}(f) = (0, \infty) \neq \mathbb{R}$

### Surjektiv men ikke injektiv
$$f: \mathbb{R} \to \mathbb{R}, \quad f(x) = x^2$$
(Hvis vi restrikterer codomænet til $[0, \infty)$)
- Ikke injektiv: $f(-2) = f(2) = 4$
- Surjektiv: Alle ikke-negative tal nås

### Bijektiv
$$f: \mathbb{R} \to \mathbb{R}, \quad f(x) = 2x + 3$$
- Både injektiv og surjektiv

## For Vector Functions
Fra eksempel i 01002:

$$f(\mathbf{x}) = A\mathbf{x}, \quad A = \begin{bmatrix} 1 & 2 \\ 2 & 4 \end{bmatrix}$$

- **Ikke injektiv**: $f\begin{bmatrix} -2 \\ 1 \end{bmatrix} = f\begin{bmatrix} 0 \\ 0 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix}$
- **Ikke surjektiv**: $\text{im}(f) = \text{span}\left\{\begin{bmatrix} 1 \\ 2 \end{bmatrix}\right\} \neq \mathbb{R}^2$

## Connection to Linear Algebra
For lineære transformationer $f(\mathbf{x}) = A\mathbf{x}$:
- **Injektiv** $\Leftrightarrow$ $\ker(A) = \{\mathbf{0}\}$ $\Leftrightarrow$ columns af $A$ er lineært uafhængige
- **Surjektiv** $\Leftrightarrow$ $\text{rank}(A) = m$ (for $A \in \mathbb{R}^{m \times n}$)

## Related Concepts
- [[Vektorfunktioner]]
- [[Domæne og Billedrum]]
- [[Inverse Funktioner]] - Kun bijektive funktioner har inverser
- [[Lineær Algebra]] - Rank og kernel

## Importance
- Afgør om ligningen $f(\mathbf{x}) = \mathbf{y}$ har:
  - **Surjektivitet**: Løsning for alle $\mathbf{y}$?
  - **Injektivitet**: Unik løsning?

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=1|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

