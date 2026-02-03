---
tags:
  - matematik
  - complex-analysis
  - 01001
---

# Komplekse Tal

## Definition

**Komplekse tal** udvider de reelle tal ved at inkludere $i$, den imaginære enhed, hvor:
$$i^2 = -1$$

Et komplekst tal $z$ har formen:
$$z = a + bi$$

hvor $a, b \in \mathbb{R}$ og:
- $a = \text{Re}(z)$ er **realdelen**
- $b = \text{Im}(z)$ er **imaginærdelen**

## Den Komplekse Plan

Komplekse tal kan repræsenteres som punkter i den komplekse plan:
- Horisontal akse: realdel
- Vertikal akse: imaginærdel

Punktet $(a, b)$ svarer til $z = a + bi$.

## Kompleks Konjugering

Den **kompleks-konjugerede** af $z = a + bi$ er:
$$\overline{z} = a - bi$$

**Egenskaber:**
- $\overline{z_1 + z_2} = \overline{z_1} + \overline{z_2}$
- $\overline{z_1 \cdot z_2} = \overline{z_1} \cdot \overline{z_2}$
- $z \cdot \overline{z} = a^2 + b^2 = |z|^2$ (reelt tal)

## Absolutværdi (Modulus)

$$|z| = |a + bi| = \sqrt{a^2 + b^2}$$

Dette er afstanden fra origo til punktet $z$ i den komplekse plan.

## Aritmetik

### Addition
$$(a + bi) + (c + di) = (a + c) + (b + d)i$$

### Subtraktion
$$(a + bi) - (c + di) = (a - c) + (b - d)i$$

### Multiplikation
$$(a + bi)(c + di) = (ac - bd) + (ad + bc)i$$

### Division
$$\frac{a + bi}{c + di} = \frac{(a + bi)(c - di)}{(c + di)(c - di)} = \frac{(ac + bd) + (bc - ad)i}{c^2 + d^2}$$

## Polær Form

Et komplekst tal kan skrives i **polær form**:
$$z = r(\cos\theta + i\sin\theta) = re^{i\theta}$$

hvor:
- $r = |z|$ er **modulet** (afstand fra origo)
- $\theta = \arg(z)$ er **argumentet** (vinkel fra positiv reel-akse)

**Eulers formel:**
$$e^{i\theta} = \cos\theta + i\sin\theta$$

Se [[Eulers Formel]]

## De Moivres Formel

$$(r e^{i\theta})^n = r^n e^{in\theta}$$

eller ækvivalent:
$$[\cos\theta + i\sin\theta]^n = \cos(n\theta) + i\sin(n\theta)$$

## Rødder

De $n$ komplekse $n$-te rødder af $z = re^{i\theta}$ er:
$$w_k = \sqrt[n]{r} \cdot e^{i(\theta + 2\pi k)/n}, \quad k = 0, 1, \ldots, n-1$$

**Eksempel:** De tre kubikrødder af 1 er:
$$1, \quad e^{2\pi i/3}, \quad e^{4\pi i/3}$$

## Komplekse Funktioner

### Eksponentialfunktion
$$e^{a+bi} = e^a(\cos b + i\sin b)$$

### Trigonometriske Funktioner
$$\sin(z) = \frac{e^{iz} - e^{-iz}}{2i}, \quad \cos(z) = \frac{e^{iz} + e^{-iz}}{2}$$

## Anvendelse i Differentialligninger

Komplekse egenværdier $\lambda = \alpha + i\beta$ fører til oscillerende løsninger:
$$e^{\lambda t} = e^{\alpha t}(\cos(\beta t) + i\sin(\beta t))$$

Se [[Komplekse Egenværdier]]

## Eksempler

**Eksempel 1:** Find $(2 + 3i) + (1 - 4i)$
$$(2 + 3i) + (1 - 4i) = 3 - i$$

**Eksempel 2:** Find $(1 + i)^2$
$$(1 + i)^2 = 1 + 2i + i^2 = 1 + 2i - 1 = 2i$$

**Eksempel 3:** Find $|3 + 4i|$
$$|3 + 4i| = \sqrt{3^2 + 4^2} = \sqrt{25} = 5$$

## Related Concepts

- [[Eulers Formel]]
- [[Komplekse Egenværdier]]
- [[Trigonometriske Funktioner]]
- [[Funktioner]]
- [[Ordinære Differentialligninger (ODE)]]

## Covered In

- [[2025-11-28-01001-lecture.pdf|01001 Lecture Nov 28]]
- Multiple 01001 lectures (november-december 2025)

## Course

[[01001-Matematik 1a]]

## Prerequisites

- Reelle tal
- [[Trigonometriske Funktioner]]
- Grundlæggende algebra

## Applications

- Elektriske kredsløb (AC analyse)
- Kvantemekanik (bølgefunktioner)
- Signal processing (Fourier transforms)
- Control theory
- Fluid dynamics
- Løsning af differentialligninger med oscillationer
