---
tags:
  - complex-analysis
  - matematik
  - 01001
  - exponential-functions
---

# Eulers Formel

## Definition

Eulers formel er en fundamental relation i kompleks analyse:

$$e^{i\theta} = \cos(\theta) + i\sin(\theta)$$

For ethvert reelt tal $\theta$.

## Specielle Tilfælde

### Eulers Identitet

Ved $\theta = \pi$:
$$e^{i\pi} + 1 = 0$$

Dette forbinder 5 fundamentale matematiske konstanter: $e, i, \pi, 1, 0$.

### For Generel Kompleks Eksponent

For $z = \alpha + i\beta$ (hvor $\alpha, \beta \in \mathbb{R}$):

$$e^{z} = e^{\alpha + i\beta} = e^\alpha e^{i\beta} = e^\alpha(\cos\beta + i\sin\beta)$$

Derfor:
- $\text{Re}(e^z) = e^\alpha \cos\beta$
- $\text{Im}(e^z) = e^\alpha \sin\beta$

## Afledning

Afledningen af $e^{i\beta t}$ med hensyn til $t$:

$$\frac{d}{dt}e^{i\beta t} = i\beta e^{i\beta t}$$

Generelt for $\lambda = \alpha + i\beta$:

$$\frac{d}{dt}e^{\lambda t} = \lambda e^{\lambda t}$$

## Anvendelse i Differentialligninger

For differentialligningen $f'(t) = \lambda f(t)$ hvor $\lambda \in \mathbb{C}$:

Løsning: $f(t) = ce^{\lambda t}$ for $c \in \mathbb{C}$

Hvis $\lambda = \alpha + i\beta$:
$$f(t) = ce^{\alpha t}(\cos(\beta t) + i\sin(\beta t))$$

Dette giver oscillerende løsninger når $\beta \neq 0$.

## Eksempel

For $f(t) = e^{2it}$ hvor $t \in \mathbb{R}$:

$$f(t) = \cos(2t) + i\sin(2t)$$

Hvor:
- $\text{Re}(f(t)) = \cos(2t)$
- $\text{Im}(f(t)) = \sin(2t)$

Afledning:
$$f'(t) = 2i e^{2it} = 2i(\cos(2t) + i\sin(2t)) = -2\sin(2t) + 2i\cos(2t)$$

## Related Concepts

- [[Komplekse Egenværdier]]
- [[Ordinære Differentialligninger (ODE)]]
- [[Komplekse Tal]]
- [[Trigonometriske Funktioner]]
- [[Oscillationer]]

## Covered In

- [[2025-11-28-01001-lecture.pdf#page=1|01001 Lecture Nov 28]]

## Course

[[01001-Matematik 1a]]

## Prerequisites

- Komplekse tal
- Trigonometri
- Eksponentialfunktioner
- Afledede

## Applications

- Løsning af ODE'er med komplekse egenværdier
- Fourier analyse
- Signal processing
- Kvantemekanik (bølgefunktioner)
- Elektriske kredsløb (AC-analyse)
- Svingninger og bølger
