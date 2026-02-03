---
tags:
  - linear-algebra
  - differential-equations
  - 01001
  - complex-analysis
---

# Komplekse Egenværdier

## Definition

For en reel matrix $\mathbf{A} \in \mathbb{R}^{n \times n}$ kan egenværdierne være komplekse tal:

$$\lambda = \alpha + i\beta \quad (\alpha, \beta \in \mathbb{R})$$

Hvis $\mathbf{A}$ er reel og $\lambda$ er en kompleks egenværdi med egenvektor $\mathbf{v}$, så er den kompleks-konjugerede $\bar{\lambda}$ også en egenværdi med egenvektor $\bar{\mathbf{v}}$.

## Eulers Formel

$$e^{i\beta t} = \cos(\beta t) + i\sin(\beta t)$$

For en kompleks egenværdi $\lambda = \alpha + i\beta$:

$$e^{\lambda t} = e^{\alpha t}(\cos(\beta t) + i\sin(\beta t))$$

Hvor:
- $\text{Re}(e^{\lambda t}) = e^{\alpha t}\cos(\beta t)$
- $\text{Im}(e^{\lambda t}) = e^{\alpha t}\sin(\beta t)$

## Differentialligninger

Løsningen til $f'(t) = \lambda f(t)$ for kompleks $\lambda$ er:

$$f(t) = c e^{\lambda t} \quad (c \in \mathbb{C})$$

For systemer $\mathbf{f}'(t) = \mathbf{A}\mathbf{f}(t)$ med komplekse egenværdier får vi oscillerende løsninger.

## Eksempel

For matrix:
$$\mathbf{A} = \begin{bmatrix} -1 & -3 \\ 3 & -1 \end{bmatrix}$$

Karakteristisk polynomium:
$$P_\mathbf{A}(Z) = (1+Z)^2 + 9$$

Egenværdier:
$$\lambda_1 = -1 + 3i, \quad \lambda_2 = -1 - 3i$$

Egenvektorer:
$$\mathbf{v}_1 = \begin{bmatrix} i \\ 1 \end{bmatrix}, \quad \mathbf{v}_2 = \begin{bmatrix} -i \\ 1 \end{bmatrix}$$

## Related Concepts

- [[Ordinære Differentialligninger (ODE)]]
- [[Lineære ODE'er]]
- [[Egenværdier og Egenvektorer]]
- [[Diagonalisering]]
- [[Eulers Formel]]

## Covered In

- [[2025-11-28-01001-lecture.pdf#page=1|01001 Lecture Nov 28]]

## Course

[[01001-Matematik 1a]]

## Prerequisites

- Komplekse tal
- Egenværdier og egenvektorer
- Differentialligninger

## Applications

- Oscillerende systemer (fjedre, penduler)
- Elektriske kredsløb med AC
- Kvantemekanik
- Svingninger i mekaniske systemer
