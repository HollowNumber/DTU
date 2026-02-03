---
tags:
  - matematik
  - calculus
  - 01001
  - fundamentals
---

# Differentialregning (Calculus)

## Definition

**Differentialregning** (differential calculus) er den gren af matematik der studerer ændringshastigheder og hældninger af kurver. Det centrale koncept er den **afledede**.

Den afledede af en funktion $f(x)$ i punktet $x$ er defineret som:

$$f'(x) = \lim_{h \to 0} \frac{f(x+h) - f(x)}{h}$$

## Grundlæggende Begreber

### Hældning af Tangent

Den afledede $f'(a)$ angiver hældningen af tangenten til grafen $y = f(x)$ i punktet $(a, f(a))$.

### Grænseværdi

Beregning af afledede kræver forståelse af grænseværdier (limits).

### Kontinuitet

En funktion skal være kontinuerlig i et punkt for at være differentierbar der. Men kontinuitet garanterer ikke differentiabilitet.

## Notationer

Forskellige notationer for den afledede:
- $f'(x)$ (Lagrange notation)
- $\frac{df}{dx}$ (Leibniz notation)
- $\frac{dy}{dx}$ (når $y = f(x)$)
- $Df(x)$ (operator notation)

## Afledningsregler

### Potensregel
$$\frac{d}{dx}x^n = nx^{n-1}$$

### Sumregel
$$\frac{d}{dx}[f(x) + g(x)] = f'(x) + g'(x)$$

### Produktregel
$$\frac{d}{dx}[f(x) \cdot g(x)] = f'(x)g(x) + f(x)g'(x)$$

### Kvotientregel
$$\frac{d}{dx}\left[\frac{f(x)}{g(x)}\right] = \frac{f'(x)g(x) - f(x)g'(x)}{[g(x)]^2}$$

### Kæderegel (Chain Rule)
$$\frac{d}{dx}f(g(x)) = f'(g(x)) \cdot g'(x)$$

## Afledede af Standardfunktioner

$$\begin{align}
\frac{d}{dx}\sin(x) &= \cos(x) \\
\frac{d}{dx}\cos(x) &= -\sin(x) \\
\frac{d}{dx}e^x &= e^x \\
\frac{d}{dx}\ln(x) &= \frac{1}{x} \\
\frac{d}{dx}a^x &= a^x \ln(a)
\end{align}$$

## Højere Ordens Afledede

**Anden afledte:** $f''(x)$ eller $\frac{d^2f}{dx^2}$

**$n$-te afledte:** $f^{(n)}(x)$ eller $\frac{d^n f}{dx^n}$

Anden afledte angiver krumning (convexity/concavity).

## Anvendelser

### Optimering
Find maksimum/minimum ved at løse $f'(x) = 0$.

### Fysik
- Hastighed er afledede af position: $v = \frac{dx}{dt}$
- Acceleration er afledede af hastighed: $a = \frac{dv}{dt} = \frac{d^2x}{dt^2}$

### Tangentlinjer
Ligning for tangent i $(a, f(a))$:
$$y - f(a) = f'(a)(x - a)$$

## Eksempler

**Eksempel 1:** Find $\frac{d}{dx}(3x^2 + 2x - 5)$

$$\frac{d}{dx}(3x^2 + 2x - 5) = 6x + 2$$

**Eksempel 2:** Find $\frac{d}{dx}\sin(x^2)$ (kæderegel)

$$\frac{d}{dx}\sin(x^2) = \cos(x^2) \cdot 2x = 2x\cos(x^2)$$

## Related Concepts

- [[Grænseværdier]] - Fundamentet for afledede
- [[Kontinuitet]] - Nødvendig (men ikke tilstrækkelig) for differentiabilitet
- [[Afledede Funktioner]] - Funktionen $f'(x)$
- [[Partielle Afledede]] - Udvidelse til flere variable
- [[Integralregning]] - Omvendt proces
- [[Ordinære Differentialligninger (ODE)]] - Ligninger med afledede
- [[Hastighed og Acceleration]] - Fysiske anvendelser

## Covered In

- Multiple 01001 lectures
- [[2026-02-02-10060-lecture.pdf|10060 Lecture Feb 02]] (fysik anvendelser)

## Course

[[01001-Matematik 1a]]

## Prerequisites

- [[Funktioner]]
- [[Grænseværdier]]
- Grundlæggende algebra

## Applications

- Fysik (bevægelse, kræfter)
- Økonomi (marginalomkostninger)
- Ingeniørvidenskab (optimering)
- Machine learning (gradient descent)
- Signalbehandling
