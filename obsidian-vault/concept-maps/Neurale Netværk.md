---
tags:
  - machine-learning
  - applied-math
  - 01002
  - neural-networks
---

# Neurale Netværk

## Definition
Et **neuralt netværk** er en komposition af [[Vektorfunktioner]] organiseret i lag:

$$\Phi = f_L \circ f_{L-1} \circ \cdots \circ f_2 \circ f_1$$

Hvert lag $f_i$ består typisk af:
1. **Lineær transformation**: $\mathbf{z} = A_i \mathbf{x} + \mathbf{b}_i$
2. **Aktiveringsfunktion**: $\mathbf{a} = \sigma_i(\mathbf{z})$

## Architecture Example
Fra 01002 lecture:

### Lag 1
$$f_1: \mathbb{R}^{784} \to \mathbb{R}^{50}$$
$$f_1(\mathbf{x}) = \sigma_1(A_1 \mathbf{x} + \mathbf{b}_1)$$

### Lag 2
$$f_2: \mathbb{R}^{50} \to \mathbb{R}^{10}$$
$$f_2(\mathbf{z}_1) = \sigma_2(A_2 \mathbf{z}_1 + \mathbf{b}_2)$$

### Samlet netværk
$$\Phi: \mathbb{R}^{784} \to \mathbb{R}^{10}$$
$$\Phi(\mathbf{x}) = \sigma_2(A_2 \sigma_1(A_1 \mathbf{x} + \mathbf{b}_1) + \mathbf{b}_2)$$

## Key Components
- **Vægte** (Weights): Matricerne $A_i$
- **Bias**: Vektorerne $\mathbf{b}_i$
- **Aktiveringsfunktioner**: $\sigma_i$ (ofte [[ReLU Aktiveringsfunktion]])
- **Lag** (Layers): Hver transformation $f_i$

## Mathematical Properties
- Netværket er en [[Vektorfunktioner|vektorfunktion]]
- Sammensætning af simple funktioner giver kompleks funktion
- Ikke-linearitet fra aktiveringsfunktioner er essentiel

## Related Concepts
- [[ReLU Aktiveringsfunktion]] - Mest brugte aktiveringsfunktion
- [[Vektorfunktioner]] - Matematisk fundament
- [[Komposition af Funktioner]]
- [[Lineære Transformationer]]

## Types
- **Feedforward Neural Networks** - Simple lag efter hinanden
- **Convolutional Neural Networks (CNN)** - For billedbehandling
- **Recurrent Neural Networks (RNN)** - For sekvenser

## Training
- **Backpropagation** - Beregner gradienter
- **Gradient Descent** - Optimerer vægte
- **Loss Function** - Måler hvor godt netværket performer

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=3|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

## Prerequisites
- [[Vektorfunktioner]]
- [[Lineære Transformationer]]
- [[Matrixmultiplikation]]

## Applications
- Computer Vision (billedgenkendelse)
- Natural Language Processing
- MNIST digit classification (eksempel i kurset)

