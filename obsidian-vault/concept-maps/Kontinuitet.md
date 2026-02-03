---
tags:
  - matematik
  - calculus
  - 01002
  - analysis
---

# Kontinuitet

## Definition
En funktion $f: \text{dom}(f) \to \mathbb{R}$ er **kontinuert** i $x_0 \in \text{dom}(f)$ hvis:

$$x \to x_0 \Rightarrow f(x) \to f(x_0)$$

### Epsilon-Delta Formulation
$$\forall \epsilon > 0 \quad \exists \delta > 0: \quad |x - x_0| < \delta \Rightarrow |f(x) - f(x_0)| < \epsilon$$

Se også: [[Epsilon-Delta Definition]]

## Types of Discontinuity
- **Jump discontinuity** - Se [[Heaviside-funktionen]]
- **Removable discontinuity** - Kan "repareres" ved at redefinere et punkt
- **Essential discontinuity** - Grænseværdi eksisterer ikke

## Related Concepts
- [[Grænseværdier]] - Kontinuitet kræver at grænseværdien eksisterer og er lig funktionsværdien
- [[Differentiabilitet]] - Differentiabilitet medfører kontinuitet (men ikke omvendt)
- [[Diskontinuitet]] - Modsat koncept

## Important Results
- Lineære funktioner er kontinuerte overalt
- Polynomier er kontinuerte overalt
- Rationelle funktioner er kontinuerte i deres domæne
- Komposition af kontinuerte funktioner er kontinuert

## Examples
### Kontinuerte funktioner
- $f(x) = ax + b$ (lineær funktion)
- $f(x) = x^2$ (polynomium)
- $\sin(x), \cos(x)$ (trigonometriske funktioner)

### Diskontinuerte funktioner
- [[Heaviside-funktionen]]: $h(x) = \begin{cases} 1 & x \geq 0 \\ 0 & x < 0 \end{cases}$
- [[ReLU Aktiveringsfunktion]]: Ikke differentiabel i $x=0$, men kontinuert

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=4|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

## Prerequisites
- [[Grænseværdier]]
- [[Funktioner]]

## Leads To
- [[Differentiabilitet]]
- [[Integralregning]]

