---
tags:
  - matematik
  - fundamentals
  - 01001
  - 01002
---

# Funktioner

## Definition

En **funktion** $f: A \to B$ er en regel der tildeler hvert element $x \in A$ præcis ét element $f(x) \in B$.

**Notation:** $f: A \to B$ læses "$f$ fra $A$ til $B$"

## Terminologi

- **Domæne (Domain):** Mængden $A$ (input-værdier)
- **Kodomæne (Codomain):** Mængden $B$ (mulige output-værdier)
- **Billedrum (Image/Range):** $\{f(x) \mid x \in A\} \subseteq B$ (faktiske output-værdier)
- **Graf:** Mængden $\{(x, f(x)) \mid x \in A\}$

Se også: [[Domæne og Billedrum]]

## Funktionstyper

### Injektiv (One-to-One)

$f$ er **injektiv** hvis forskellige input giver forskellige output:
$$f(x_1) = f(x_2) \implies x_1 = x_2$$

**Eksempel:** $f(x) = 2x$ er injektiv

### Surjektiv (Onto)

$f$ er **surjektiv** hvis hvert element i kodomænet rammes:
$$\forall b \in B, \exists a \in A: f(a) = b$$

**Eksempel:** $f: \mathbb{R} \to \mathbb{R}, f(x) = x^3$ er surjektiv

### Bijektiv

$f$ er **bijektiv** hvis den er både injektiv og surjektiv.

Se [[Injektivitet og Surjektivitet]] for detaljer.

## Operationer på Funktioner

### Komposition

Komposition af $f: A \to B$ og $g: B \to C$:
$$(g \circ f)(x) = g(f(x))$$

Se [[Komposition af Funktioner]]

### Inverse

Hvis $f: A \to B$ er bijektiv, findes der en **invers funktion** $f^{-1}: B \to A$ sådan at:
$$f^{-1}(f(x)) = x \text{ og } f(f^{-1}(y)) = y$$

Se [[Inverse Funktioner]]

## Specielle Funktionstyper

### Polynomier
$$p(x) = a_nx^n + a_{n-1}x^{n-1} + \cdots + a_1x + a_0$$

### Eksponentialfunktioner
$$f(x) = a^x \text{ eller } f(x) = e^x$$

### Trigonometriske Funktioner
$$\sin(x), \cos(x), \tan(x)$$

Se [[Trigonometriske Funktioner]]

### Logaritmefunktioner
$$f(x) = \log_a(x) \text{ eller } \ln(x)$$

### Stykkevis Definerede
Funktioner defineret forskelligt på forskellige domæner.

Se [[Stykkevis Definerede Funktioner]]

## Vektorfunktioner

Funktioner der afbilder til $\mathbb{R}^n$:
$$\mathbf{f}: \mathbb{R}^m \to \mathbb{R}^n$$

**Eksempel:** $\mathbf{f}(t) = (t^2, 2t, 1)$ fra $\mathbb{R}$ til $\mathbb{R}^3$

Se [[Vektorfunktioner]] og [[Funktioner af Flere Variabler]]

## Egenskaber

### Kontinuitet

En funktion er kontinuerlig hvis "lille ændring i input giver lille ændring i output".

Se [[Kontinuitet]]

### Differentiabilitet

En funktion er differentierbar hvis den afledede eksisterer.

Se [[Differentialregning]]

### Paritet

- **Lige funktion:** $f(-x) = f(x)$ (symmetri om $y$-aksen)
- **Ulige funktion:** $f(-x) = -f(x)$ (rotationssymmetri om origo)

### Monotoni

- **Voksende:** $x_1 < x_2 \implies f(x_1) \leq f(x_2)$
- **Strengt voksende:** $x_1 < x_2 \implies f(x_1) < f(x_2)$
- **Aftagende:** $x_1 < x_2 \implies f(x_1) \geq f(x_2)$

## Eksempler

**Eksempel 1:** $f: \mathbb{R} \to \mathbb{R}, f(x) = x^2$
- Domæne: $\mathbb{R}$
- Billedrum: $[0, \infty)$
- Ikke injektiv (f.eks. $f(-2) = f(2) = 4$)
- Ikke surjektiv (negative tal rammes ikke)

**Eksempel 2:** $f: [0, \infty) \to [0, \infty), f(x) = x^2$
- Både injektiv og surjektiv (bijektiv)
- Invers: $f^{-1}(x) = \sqrt{x}$

## Related Concepts

- [[Domæne og Billedrum]]
- [[Injektivitet og Surjektivitet]]
- [[Vektorfunktioner]]
- [[Koordinatfunktioner]]
- [[Kontinuitet]]
- [[Differentialregning]]
- [[Komposition af Funktioner]]
- [[Inverse Funktioner]]
- [[Grafer af Funktioner]]

## Covered In

- Multiple lectures in 01001 and 01002

## Course

[[01001-Matematik 1a]], [[01002-Matematik 1b]]

## Prerequisites

- [[Mængdelære]]
- Grundlæggende algebra

## Applications

- Modellering af fysiske fænomener
- Machine learning (activation functions)
- Økonomi (cost/profit functions)
- Computer graphics
- Data transformation
