---
tags:
  - linear-algebra
  - matematik
  - 01001
  - eigenvalues
---

# Diagonalisering

## Definition

En kvadratisk matrix $\mathbf{A} \in \mathbb{R}^{n \times n}$ er **diagonaliserbar** hvis der findes en invertibel matrix $\mathbf{P}$ og en diagonal matrix $\mathbf{D}$ således at:

$$\mathbf{A} = \mathbf{P}\mathbf{D}\mathbf{P}^{-1}$$

Ækvivalent: $\mathbf{A}$ er diagonaliserbar hvis der findes en basis for $\mathbb{R}^n$ bestående af egenvektorer for $\mathbf{A}$.

## Konstruktion

Hvis $\mathbf{A}$ har $n$ lineært uafhængige egenvektorer $\mathbf{v}_1, \ldots, \mathbf{v}_n$ med tilhørende egenværdier $\lambda_1, \ldots, \lambda_n$:

**Matrix P (egenvektor matrix):**
$$\mathbf{P} = [\mathbf{v}_1 \mid \mathbf{v}_2 \mid \cdots \mid \mathbf{v}_n]$$

**Matrix D (diagonal matrix af egenværdier):**
$$\mathbf{D} = \begin{bmatrix} 
\lambda_1 & 0 & \cdots & 0 \\
0 & \lambda_2 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & \lambda_n
\end{bmatrix}$$

## Kriterier for Diagonaliserbarhed

En matrix $\mathbf{A} \in \mathbb{R}^{n \times n}$ er diagonaliserbar hvis:

1. $\mathbf{A}$ har $n$ forskellige egenværdier, ELLER
2. Summen af dimensionerne af alle egenrum er $n$

**OBS:** Ikke alle matricer er diagonaliserbare over $\mathbb{R}$.

Eksempel på ikke-diagonaliserbar matrix:
$$\mathbf{A} = \begin{bmatrix} 1 & 1 \\ 0 & 1 \end{bmatrix}$$

## Diagonalisering over Komplekse Tal

Hvis $\mathbf{A} \in \mathbb{R}^{n \times n}$ ikke er diagonaliserbar over $\mathbb{R}$, kan den ofte diagonaliseres over $\mathbb{C}$.

Over $\mathbb{C}$ har ethvert $n \times n$ karakteristisk polynomium $n$ rødder (talt med multiplicitet), hvilket gør det lettere at finde egenværdier.

## Anvendelse: Løsning af ODE-systemer

For systemet $\mathbf{f}'(t) = \mathbf{A}\mathbf{f}(t)$ hvor $\mathbf{A}$ er diagonaliserbar:

Hvis $\mathbf{A} = \mathbf{P}\mathbf{D}\mathbf{P}^{-1}$, så er den fuldstændige løsning:

$$\mathbf{f}(t) = c_1 \mathbf{v}_1 e^{\lambda_1 t} + c_2 \mathbf{v}_2 e^{\lambda_2 t} + \cdots + c_n \mathbf{v}_n e^{\lambda_n t}$$

hvor $c_1, \ldots, c_n \in \mathbb{R}$ er konstanter bestemt af begyndelsesbetingelser.

## Eksempel

$$\mathbf{A} = \begin{bmatrix} 3 & 1 \\ 0 & 2 \end{bmatrix}$$

**Egenværdier:** $\lambda_1 = 3, \lambda_2 = 2$

**Egenvektorer:** 
$$\mathbf{v}_1 = \begin{bmatrix} 1 \\ 0 \end{bmatrix}, \quad \mathbf{v}_2 = \begin{bmatrix} 1 \\ -1 \end{bmatrix}$$

**Diagonalisering:**
$$\mathbf{P} = \begin{bmatrix} 1 & 1 \\ 0 & -1 \end{bmatrix}, \quad \mathbf{D} = \begin{bmatrix} 3 & 0 \\ 0 & 2 \end{bmatrix}$$

Verificer: $\mathbf{A} = \mathbf{P}\mathbf{D}\mathbf{P}^{-1}$

## Related Concepts

- [[Egenværdier og Egenvektorer]]
- [[Lineære ODE'er]]
- [[Komplekse Egenværdier]]
- [[Basis og Dimension]]
- [[Lineære Transformationer]]

## Covered In

- [[2025-11-28-01001-lecture.pdf#page=1|01001 Lecture Nov 28]]
- Multiple 01001 lectures (november 2025)

## Course

[[01001-Matematik 1a]]

## Prerequisites

- [[Egenværdier og Egenvektorer]]
- Lineær algebra
- Matrix multiplikation og inversion

## Applications

- Løsning af differentialligningssystemer
- Matrix eksponentiation ($\mathbf{A}^n = \mathbf{P}\mathbf{D}^n\mathbf{P}^{-1}$)
- Principal Component Analysis (PCA)
- Kvantemekanik (operatorer)
- Stabilitet analyse af dynamiske systemer
