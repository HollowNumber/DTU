---
tags:
  - machine-learning
  - neural-networks
  - 01002
  - activation-functions
---

# ReLU Aktiveringsfunktion

## Definition
**ReLU** (Rectified Linear Unit) er en ikke-lineær aktiveringsfunktion:

### Skalar version
$$\text{ReLU}: \mathbb{R} \to \mathbb{R}$$
$$\text{ReLU}(x) = \max(0, x) = \begin{cases} x & x \geq 0 \\ 0 & x < 0 \end{cases}$$

### Vektor version
$$\text{ReLU}: \mathbb{R}^n \to \mathbb{R}^n$$
$$\text{ReLU}(\mathbf{x}) = \begin{bmatrix} \text{ReLU}(x_1) \\ \text{ReLU}(x_2) \\ \vdots \\ \text{ReLU}(x_n) \end{bmatrix}$$

## Properties
- **Kontinuert** overalt
- **Ikke differentiabel** i $x = 0$
- **Ikke-lineær** - Se bevis i øvelserne
- **Billig at beregne** - Simple max-operation

## Why ReLU?
1. Introducerer ikke-linearitet i [[Neurale Netværk]]
2. Hurtigere beregning end sigmoid eller tanh
3. Afhjælper "vanishing gradient" problemet
4. Sparse aktivering (mange neuroner outputter 0)

## Related Concepts
- [[Heaviside-funktionen]] - Lignende struktur, men diskontinuert
- [[Aktiveringsfunktioner]] - ReLU er én type
- [[Neurale Netværk]] - Anvendes i skjulte lag
- [[Ikke-linearitet]] - Hvorfor neurale netværk behøver ReLU

## Variants
- **Leaky ReLU**: $\max(0.01x, x)$ - Tillader små negative værdier
- **Parametric ReLU (PReLU)**: Lærer slope for negative værdier
- **ELU (Exponential Linear Unit)**: Smooth version

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=2|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

## Prerequisites
- [[Stykkevis Definerede Funktioner]]
- [[Kontinuitet]]

## Applications
- Deep Learning frameworks (PyTorch, TensorFlow)
- Convolutional Neural Networks
- Feedforward Neural Networks

