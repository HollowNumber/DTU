---
tags:
  - matematik
  - linear-algebra
  - 01001
  - fundamentals
---

# Lineær Algebra

## Definition

**Lineær algebra** er studiet af vektorrum, lineære afbildninger, og systemer af lineære ligninger. Det er fundamentet for mange områder af matematik og anvendelser i naturvidenskab og teknik.

## Centrale Begreber

### Vektorrum

Et **vektorrum** $V$ over et felt $F$ (typisk $\mathbb{R}$ eller $\mathbb{C}$) er en mængde med to operationer:
- Vektoraddition: $\mathbf{u} + \mathbf{v} \in V$
- Skalarmultiplikation: $c\mathbf{v} \in V$ for $c \in F$

Disse skal opfylde visse aksiomer (associativitet, kommutativitet, etc.).

### Basis og Dimension

En **basis** for $V$ er en lineært uafhængig mængde af vektorer der udspænder $V$.

**Dimensionen** af $V$ er antallet af vektorer i en basis.

**Eksempel:** $\mathbb{R}^3$ har basis $\{(1,0,0), (0,1,0), (0,0,1)\}$ og dimension 3.

### Lineær Uafhængighed

Vektorer $\mathbf{v}_1, \ldots, \mathbf{v}_n$ er **lineært uafhængige** hvis:
$$c_1\mathbf{v}_1 + c_2\mathbf{v}_2 + \cdots + c_n\mathbf{v}_n = \mathbf{0}$$
kun når $c_1 = c_2 = \cdots = c_n = 0$.

### Span (Udspændingsrum)

$$\text{span}(\mathbf{v}_1, \ldots, \mathbf{v}_n) = \{c_1\mathbf{v}_1 + \cdots + c_n\mathbf{v}_n \mid c_i \in F\}$$

## Matricer

En $m \times n$ **matrix** er en rektangulær tabel af tal:

$$\mathbf{A} = \begin{bmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn}
\end{bmatrix}$$

### Matrix Operationer

**Addition:** $(A + B)_{ij} = a_{ij} + b_{ij}$

**Skalarmultiplikation:** $(cA)_{ij} = c \cdot a_{ij}$

**Multiplikation:** $(AB)_{ij} = \sum_{k=1}^n a_{ik}b_{kj}$

### Inverse Matrix

Matrix $\mathbf{A}$ er **invertibel** hvis der findes $\mathbf{A}^{-1}$ sådan at:
$$\mathbf{A}\mathbf{A}^{-1} = \mathbf{A}^{-1}\mathbf{A} = \mathbf{I}$$

## Determinant

For en $n \times n$ matrix, **determinanten** $\det(\mathbf{A})$ er et tal der bl.a. angiver:
- Om matricen er invertibel ($\det(\mathbf{A}) \neq 0$)
- Skalering af volumen under lineær transformation

For $2 \times 2$ matrix:
$$\det\begin{bmatrix} a & b \\ c & d \end{bmatrix} = ad - bc$$

## Lineære Ligningssystemer

System af $m$ ligninger med $n$ ubekendte:
$$\mathbf{Ax} = \mathbf{b}$$

hvor $\mathbf{A}$ er $m \times n$ matrix, $\mathbf{x} \in \mathbb{R}^n$, $\mathbf{b} \in \mathbb{R}^m$.

### Løsningsstruktur

**Theorem 11.4.1:** Løsningsmængden til $\mathbf{Ax} = \mathbf{b}$ er:
$$\{\mathbf{x}_p + \mathbf{x}_h \mid \mathbf{x}_h \in \ker(\mathbf{A})\}$$

hvor $\mathbf{x}_p$ er en partikulær løsning.

## Kernel og Image

**Kernel (nulrum):**
$$\ker(\mathbf{A}) = \{\mathbf{x} \mid \mathbf{Ax} = \mathbf{0}\}$$

**Image (billedrum):**
$$\text{Im}(\mathbf{A}) = \{\mathbf{Ax} \mid \mathbf{x} \in \mathbb{R}^n\}$$

**Rank-nullity theorem:**
$$\dim(\ker(\mathbf{A})) + \dim(\text{Im}(\mathbf{A})) = n$$

## Egenværdier og Egenvektorer

For kvadratisk matrix $\mathbf{A}$:
$$\mathbf{Av} = \lambda\mathbf{v}$$

hvor $\lambda$ er en **egenværdi** og $\mathbf{v} \neq \mathbf{0}$ er en **egenvektor**.

Se [[Egenværdier og Egenvektorer]] for detaljer.

## Diagonalisering

Matrix $\mathbf{A}$ er diagonaliserbar hvis:
$$\mathbf{A} = \mathbf{PDP}^{-1}$$

hvor $\mathbf{D}$ er diagonal og $\mathbf{P}$ har egenvektorer som kolonner.

Se [[Diagonalisering]] for detaljer.

## Related Concepts

- [[Vektorer]]
- [[Matrixmultiplikation]]
- [[Basis og Dimension]]
- [[Kernel og Image]]
- [[Lineære Transformationer]]
- [[Lineære Afbildninger]]
- [[Egenværdier og Egenvektorer]]
- [[Diagonalisering]]
- [[Lineære ODE'er]] - Anvendelse til diff.ligninger

## Covered In

- Multiple 01001 lectures (entire semester)

## Course

[[01001-Matematik 1a]]

## Prerequisites

- Grundlæggende algebra
- [[Funktioner]]
- [[Vektorer]]

## Applications

- Computer graphics (transformationer)
- Machine learning (PCA, SVD)
- Fysik (kvantemekanik)
- Ingeniørvidenskab (strukturanalyse)
- Kryptografi
- Google PageRank
- Løsning af differentialligninger
