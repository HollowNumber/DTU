---
tags:
  - linear-algebra
  - matematik
  - 01001
  - differential-equations
---

# Egenværdier og Egenvektorer

## Definition

For en kvadratisk matrix $\mathbf{A} \in \mathbb{R}^{n \times n}$:

En **egenværdi** $\lambda$ og tilhørende **egenvektor** $\mathbf{v} \neq \mathbf{0}$ opfylder:

$$\mathbf{A}\mathbf{v} = \lambda \mathbf{v}$$

### Karakteristisk Polynomium

Egenværdierne findes ved at løse:

$$\det(\mathbf{A} - \lambda \mathbf{I}) = 0$$

Dette giver det **karakteristiske polynomium** $P_\mathbf{A}(\lambda)$.

### Egenrum

For en egenværdi $\lambda$ er **egenrummet** $E_\lambda$ defineret som:

$$E_\lambda = \ker(\mathbf{A} - \lambda \mathbf{I})$$

Det er mængden af alle egenvektorer tilhørende $\lambda$ (plus nulvektoren).

## Diagonalisering

En matrix $\mathbf{A}$ er **diagonaliserbar** hvis der findes en basis af egenvektorer for $\mathbb{R}^n$.

Hvis $\mathbf{A}$ har $n$ lineært uafhængige egenvektorer $\mathbf{v}_1, \ldots, \mathbf{v}_n$ med egenværdier $\lambda_1, \ldots, \lambda_n$:

$$\mathbf{A} = \mathbf{P}\mathbf{D}\mathbf{P}^{-1}$$

hvor:
- $\mathbf{P} = [\mathbf{v}_1 \mid \mathbf{v}_2 \mid \cdots \mid \mathbf{v}_n]$
- $\mathbf{D} = \text{diag}(\lambda_1, \lambda_2, \ldots, \lambda_n)$

## Eksempel

$$\mathbf{A} = \begin{bmatrix} 4 & 1 \\ 2 & 3 \end{bmatrix}$$

**Karakteristisk polynomium:**
$$P_\mathbf{A}(\lambda) = \det\begin{bmatrix} 4-\lambda & 1 \\ 2 & 3-\lambda \end{bmatrix} = (4-\lambda)(3-\lambda) - 2 = \lambda^2 - 7\lambda + 10$$

**Egenværdier:**
$$\lambda^2 - 7\lambda + 10 = 0 \implies \lambda_1 = 5, \lambda_2 = 2$$

**Egenvektorer:**
- For $\lambda_1 = 5$: $\mathbf{v}_1 = \begin{bmatrix} 1 \\ 1 \end{bmatrix}$
- For $\lambda_2 = 2$: $\mathbf{v}_2 = \begin{bmatrix} 1 \\ -2 \end{bmatrix}$

## Related Concepts

- [[Lineære ODE'er]]
- [[Komplekse Egenværdier]]
- [[Diagonalisering]]
- [[Kernel og Image]]
- [[Lineære Transformationer]]

## Covered In

- [[2025-11-28-01001-lecture.pdf#page=1|01001 Lecture Nov 28]]
- Multiple 01001 lectures (november-december 2025)

## Course

[[01001-Matematik 1a]]

## Prerequisites

- Matricer og determinanter
- Lineær algebra
- Vektorrum

## Applications

- Løsning af differentialligningssystemer
- Principal Component Analysis (PCA)
- Google PageRank algoritme
- Kvantemekanik
- Vibrations analyse i mekaniske systemer
- Stabilitet af dynamiske systemer
