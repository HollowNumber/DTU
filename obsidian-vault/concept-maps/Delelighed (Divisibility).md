---
tags:
  - discrete-math
  - number-theory
  - 01017
  - integers
---

# Delelighed (Divisibility)

## Definition

For heltal $a$ og $b$ hvor $a \neq 0$:

**$a$ deler $b$** (notation: $a \mid b$) hvis der findes et heltal $c$ sådan at:
$$b = ac$$

Ækvivalent: $\frac{b}{a}$ er et heltal.

**Terminologi:**
- $a$ kaldes en **faktor** eller **divisor** af $b$
- $b$ kaldes et **multiplum** af $a$
- $a \nmid b$ betyder at $a$ **ikke** deler $b$

## Sætninger

**Theorem 1:** For heltal $a, b, c$ hvor $a \neq 0$:

1. Hvis $a \mid b$ og $a \mid c$, så $a \mid (b + c)$
2. Hvis $a \mid b$, så $a \mid bc$ for alle heltal $c$
3. Hvis $a \mid b$ og $b \mid c$, så $a \mid c$ (transitivitet)

## Eksempler

**Eksempel 1:**
- $3 \mid 15$ fordi $15 = 3 \cdot 5$
- $4 \mid 16$ fordi $16 = 4 \cdot 4$
- $3 \nmid 7$ fordi $7/3 = 2.\overline{3}$ (ikke heltal)

**Eksempel 2 (anvendelse af sætning):**
- Da $3 \mid 6$ og $3 \mid 9$, så $3 \mid (6 + 9) = 15$ ✓
- Da $5 \mid 10$, så $5 \mid 10c$ for ethvert heltal $c$
- Da $2 \mid 4$ og $4 \mid 12$, så $2 \mid 12$ ✓

## Related Concepts

- [[Primtal (Prime Numbers)]]
- [[Største Fælles Divisor (GCD)]]
- [[Modular Aritmetik]]
- [[Euclids Algoritme]]

## Covered In

- [[2025-09-25-01017-lecture.pdf#page=1|01017 Lecture Sep 25]]

## Course

[[01017-Discrete Mathematics]]

## Prerequisites

- Heltal (integers)
- Grundlæggende algebra

## Applications

- Kryptografi (RSA)
- Talteori
- Computer science (hashing, modular aritmetik)
- Bevis for primtalssætninger
