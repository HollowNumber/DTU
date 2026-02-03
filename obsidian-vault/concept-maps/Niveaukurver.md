---
tags:
  - matematik
  - multivariable-calculus
  - 01002
  - visualization
---

# Niveaukurver

## Definition
For en funktion $f: A \to \mathbb{R}$ (hvor $A \subseteq \mathbb{R}^n$) og en konstant $c \in \mathbb{R}$, er **niveaukurven** $N_c$ defineret som:

$$N_c = \{\mathbf{x} \in \text{dom}(f) \mid f(\mathbf{x}) = c\}$$

Det er mængden af alle inputværdier der giver output $c$.

## Terminology
- **Niveau kurver** (2D): Når $n = 2$ (funktioner af 2 variabler)
- **Niveau flader** (3D): Når $n = 3$ (funktioner af 3 variabler)
- **Niveau sæt** (højerere dimensioner): Generel term

## Example: Hemisphere Function
For funktionen:
$$f(x_1, x_2) = \sqrt{16 - x_1^2 - x_2^2}$$

Niveaukurverne er koncentriske cirkler:
$$N_c: x_1^2 + x_2^2 = 16 - c^2$$

For $c \in [0, 4]$:
- $N_0$: Cirkel med radius 4 (største)
- $N_1$: Cirkel med radius $\sqrt{15}$
- $N_4$: Punkt ved $(0,0)$ (mindste)

## Purpose
Niveaukurver bruges til at visualisere funktioner hvor grafen er i højere dimensioner end vi kan tegne:

- **Funktion** $f: \mathbb{R}^2 \to \mathbb{R}$ har graf i $\mathbb{R}^3$ (kan visualiseres)
- Men niveaukurver kan tegnes i $\mathbb{R}^2$ planet (lettere at se)

## Applications
- **Topografiske kort** - Højdekurver er niveaukurver
- **Isobarer** - Linjer med samme tryk (vejrkort)
- **Isothermer** - Linjer med samme temperatur
- **Potentielle energi** i fysik

## Related Concepts
- [[Grafer af Funktioner]] - Alternativ visualiseringsmetode
- [[Kontourplot]] - Samme koncept
- [[Implicit Funktioner]] - Niveaukurver definerer ofte implicitte funktioner

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=2|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

## Prerequisites
- [[Funktioner af Flere Variabler]]
- [[Domæne og Billedrum]]

