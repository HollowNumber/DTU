---
tags:
  - differential-equations
  - matematik
  - 01001
  - fundamentals
---

# Ordinære Differentialligninger (ODE)

## Definition
En **$n$-te ordens ordinær differentialligning (ODE)** er en ligning på formen:

$$F(f^{(n)}(t), f^{(n-1)}(t), \ldots, f'(t), f(t), t) = 0$$

hvor $F$ er en funktion med $n + 2$ variabler.

## Notation
- $f'(t)$ eller $f^{(1)}(t)$ - første afledte
- $f''(t)$ eller $f^{(2)}(t)$ - anden afledte  
- $f^{(n)}(t)$ - $n$-te afledte
- $f^{(0)}(t) = f(t)$ - funktionen selv

## Løsning
En **løsning** til en ODE er en funktion $f(t)$ således at ligningen er opfyldt for alle $t \in \mathbb{R}$.

## Ordre (Order)
**Ordenen** af en ODE er den højeste afledte der optræder i ligningen.

### Førsteordens ODE
Kun $f'(t)$ og $f(t)$ optræder:
$$F(f'(t), f(t), t) = 0$$

**Eksempel**: $f'(t) - f(t) = 0$
- Løsning: $f(t) = Ce^t$

### Andenordens ODE
Op til $f''(t)$ optræder:
$$F(f''(t), f'(t), f(t), t) = 0$$

**Eksempel**: $f''(t) + f(t) = 0$
- Løsning: $f(t) = A\cos(t) + B\sin(t)$

## Typer af ODE'er

### Lineære ODE'er
Se [[Lineære ODE'er]]

En ODE er **lineær** hvis den kan skrives som:
$$L(f(t)) = q(t)$$

hvor $L$ er en lineær operator.

**Eksempel**: $f''(t) + 2f'(t) + f(t) = \cos(t)$

### Ikke-lineære ODE'er
Indeholder ikke-lineære termer af $f$ eller dens afledte.

**Eksempel**: $(f'(t))^2 + f(t) = 0$

Den kvadratiske term $(f'(t))^2$ gør den ikke-lineær.

## Simple Eksempler

### Eksempel 1: Eksponentiel vækst
$$f'(t) = kf(t)$$

**Løsning**: $f(t) = Ce^{kt}$

**Verifikation**: $(Ce^{kt})' = Cke^{kt} = k(Ce^{kt}) = kf(t)$ ✓

### Eksempel 2: Harmonisk oscillator
$$f''(t) + \omega^2 f(t) = 0$$

**Løsning**: $f(t) = A\cos(\omega t) + B\sin(\omega t)$

### Eksempel 3: Med forcing term
$$f'(t) - f(t) = e^t$$

**Løsning**: $f(t) = Ce^t + te^t$

## Hvorfor Studere ODE'er?

ODE'er beskriver dynamiske systemer - hvordan ting ændrer sig over tid:

- **Fysik**: Bevægelsesligninger ($F = ma$)
- **Biologi**: Populationsvækst
- **Økonomi**: Rente over tid
- **Engineering**: Elektriske kredsløb
- **Kemi**: Reaktionskinetik

## Eksistens og Entydighed

For de fleste ODE'er:
- Givet **initialværdi** $f(t_0) = f_0$
- Findes en **unik løsning**

Dette garanteres af **Picard-Lindelöfs sætning** (under visse betingelser).

## Related Concepts
- [[Lineære ODE'er]] - Special vigtig type
- [[Homogene og Inhomogene ODE'er]]
- [[Komplekse Funktioner med Reelt Input]]
- [[Differentialregning]] - Fundamentalt værktøj
- [[Lineær Algebra]] - For løsning af lineære ODE'er

## Covered In
- [[2025-11-25-01001-lecture.pdf|01001 Lecture Nov 25, 2025]]

## Course
[[01001-Matematik 1a]]

## Prerequisites
- [[Differentialregning]] - Forstå afledte
- [[Funktioner]] - Reelle og komplekse funktioner
- [[Lineær Algebra]] - For lineære ODE'er

## Leads To
- Partielle differentialligninger (PDE)
- Dynamiske systemer
- Kontrol teori

## Applications

### Physics
Newton's second law: $m\frac{d^2x}{dt^2} = F(x, \frac{dx}{dt}, t)$

### Population Growth
$$\frac{dP}{dt} = rP\left(1 - \frac{P}{K}\right)$$
(Logistic growth equation)

### RC Circuit
$$RC\frac{dV}{dt} + V = V_{in}(t)$$

