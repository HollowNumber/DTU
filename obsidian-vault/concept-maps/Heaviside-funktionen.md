---
tags:
  - matematik
  - special-functions
  - 01002
  - discontinuity
---

# Heaviside-funktionen

## Definition
**Heaviside-funktionen** (også kaldet unit step function) er defineret som:

$$h: \mathbb{R} \to \mathbb{R}$$
$$h(x) = \begin{cases} 1 & x \geq 0 \\ 0 & x < 0 \end{cases}$$

## Properties
- **Diskontinuert** i $x = 0$ - Jump discontinuity
- **Kontinuert** overalt ellers
- **Ikke differentiabel** i $x = 0$

## Proof of Discontinuity
Vis at $h$ er diskontinuert i $x_0 = 0$ ved [[Epsilon-Delta Definition]]:

Vælg $\epsilon = \frac{1}{2}$.

For enhver $\delta > 0$, vælg $x \in ]-\delta, 0[$.

Så:
$$|x - 0| < \delta$$
men
$$|h(x) - h(0)| = |0 - 1| = 1 > \frac{1}{2} = \epsilon$$

Derfor kan vi ikke finde et $\delta$ der opfylder epsilon-delta betingelsen.

## Visualization
Graf af Heaviside-funktionen viser et "spring" ved $x = 0$:
- Åben cirkel ved $(0, 0)$
- Fyldt cirkel ved $(0, 1)$

## Applications
- **Signal processing** - Modellerer tænd/sluk signaler
- **Control theory** - Step input
- **Differential equations** - Piecewise forcing functions

## Related Concepts
- [[ReLU Aktiveringsfunktion]] - Lignende struktur: $\text{ReLU}(x) = x \cdot h(x)$
- [[Diskontinuitet]] - Klassisk eksempel på jump discontinuity
- [[Stykkevis Definerede Funktioner]]

## Generalization
Shifted Heaviside function:
$$h(x - a) = \begin{cases} 1 & x \geq a \\ 0 & x < a \end{cases}$$

## Derivative
I distributionel forstand:
$$h'(x) = \delta(x)$$
hvor $\delta$ er Dirac delta funktionen.

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=5|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

## Prerequisites
- [[Stykkevis Definerede Funktioner]]
- [[Kontinuitet]]

