---
tags:
  - differential-equations
  - matematik
  - 01001
  - linear-algebra
---

# Lineære ODE'er

## Definition
En **lineær ODE** er en ligning på formen:

$$L(f(t)) = q(t)$$

hvor:
- $q(t) \in C_{\infty}(\mathbb{R})$ er en given funktion
- $L: C_{\infty}(\mathbb{R}) \to C_{\infty}(\mathbb{R})$ er en **lineær afbildning**

## Lineær Afbildning
$L$ er lineær betyder:
$$L(\alpha f + \beta g) = \alpha L(f) + \beta L(g)$$

for alle funktioner $f, g$ og skalarer $\alpha, \beta$.

## Standard Form
En $n$-te ordens lineær ODE kan skrives:

$$a_n(t)f^{(n)}(t) + a_{n-1}(t)f^{(n-1)}(t) + \cdots + a_1(t)f'(t) + a_0(t)f(t) = q(t)$$

hvor $a_i(t)$ er givne funktioner.

## Homogen vs Inhomogen

### Homogen Lineær ODE
Når $q(t) = 0$ (nulfunktionen):
$$L(f(t)) = 0$$

**Eksempel**: $f''(t) + 2f'(t) + f(t) = 0$

### Inhomogen Lineær ODE
Når $q(t) \neq 0$:
$$L(f(t)) = q(t)$$

**Eksempel**: $f''(t) + 2f'(t) + f(t) = \cos(t)$$

Se også: [[Homogene og Inhomogene ODE'er]]

## Klassifikation af Eksempler

### Eksempel (a)
$$f''(t) + 2f'(t) + f(t) = \cos(t)$$

- **Lineær?** JA - $L(f) = f'' + 2f' + f$
- **Homogen?** NEJ - $q(t) = \cos(t) \neq 0$
- **Type**: Inhomogen lineær ODE

### Eksempel (b)
$$e^t \cdot f'(t) + \cos(t) \cdot f(t) = 0$$

- **Lineær?** JA - $L(f) = e^t f' + \cos(t) f$
- **Homogen?** JA - $q(t) = 0$
- **Type**: Homogen lineær ODE

### Eksempel (c)
$$(f'(t))^2 + f(t) = 0$$

- **Lineær?** NEJ - leddet $(f'(t))^2$ er ikke lineært
- **Type**: Ikke-lineær ODE

## Struktur af Løsningsmængden

Dette er hvorfor lineære ODE'er er specielle!

### For Homogen Lineær ODE
Løsningsmængden er et **vektorrum**!

Hvis $f_1$ og $f_2$ er løsninger til $L(f) = 0$, så er:
$$f(t) = c_1 f_1(t) + c_2 f_2(t)$$
også en løsning for alle konstanter $c_1, c_2$.

**Dimension**: For $n$-te ordens ODE er løsningsmængden $n$-dimensional.

### For Inhomogen Lineær ODE
Generel løsning er:
$$f(t) = f_p(t) + f_h(t)$$

hvor:
- $f_p$ er en **partikulær løsning** til $L(f) = q(t)$
- $f_h$ er den **generelle løsning** til $L(f) = 0$ (homogen del)

## Eksempler på Lineære ODE'er

### Førsteordens Lineær
$$f'(t) + p(t)f(t) = q(t)$$

**Løsningsmetode**: Integrerende faktor

### Andenordens Lineær med Konstante Koefficienter
$$af''(t) + bf'(t) + cf(t) = q(t)$$

**Løsningsmetode**:
1. Find karakteristisk ligning: $ar^2 + br + c = 0$
2. Løs for $r$ (rødderne)
3. Konstruér homogen løsning baseret på rødder
4. Find partikulær løsning for inhomogen del

### Euler's Ligning
$$t^2 f''(t) + \alpha t f'(t) + \beta f(t) = 0$$

Speciel form der er lineær men har variable koefficienter.

## Forbindelse til Lineær Algebra

**Hvorfor er dette vigtigt?**

Fra **Sætning 11.4.1** ved vi strukturen af løsninger til:
$$Ax = b$$

Samme struktur gælder for lineære ODE'er:
- Homogen: Kernen af $L$ (nulrummet)
- Inhomogen: Partikulær løsning + homogen løsning

## Superpositionsprincip

For homogen lineær ODE $L(f) = 0$:

Hvis $f_1, f_2, \ldots, f_n$ er løsninger, så er:
$$f(t) = c_1 f_1(t) + c_2 f_2(t) + \cdots + c_n f_n(t)$$
også en løsning for alle konstanter $c_i$.

Dette gælder **IKKE** for ikke-lineære ODE'er!

## Related Concepts
- [[Ordinære Differentialligninger (ODE)]] - Overordnet koncept
- [[Homogene og Inhomogene ODE'er]]
- [[Egenværdier og Egenvektorer]] - Løsning af systemer
- [[Diagonalisering]] - Systematisk løsning
- [[Komplekse Egenværdier]] - Når rødder er komplekse
- [[Eulers Formel]] - Komplekse eksponentialfunktioner
- [[Lineær Algebra]] - Struktur af løsningsmængder
- [[Lineære Afbildninger]]

## Covered In
- [[2025-11-25-01001-lecture.pdf|01001 Lecture Nov 25, 2025]]

## Course
[[01001-Matematik 1a]]

## Prerequisites
- [[Differentialregning]]
- [[Lineær Algebra]] - Vektorrum, basis, dimension
- [[Funktioner]]

## Applications
- Mekanik (harmonisk oscillator)
- Elektriske kredsløb (RLC circuits)
- Signalbehandling
- Kontrolsystemer
- Kvantemeka nik (Schrödinger ligning)

## Numerical Methods
Når analytiske løsninger ikke findes:
- Euler's method
- Runge-Kutta methods
- Implemented in `scipy.integrate.solve_ivp` (Python)

