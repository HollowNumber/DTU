---
tags:
  - physics
  - mechanics
  - 10060
  - kinematics
---

# Kinematik 1D

## Definition
**Kinematik** er studiet af bevægelse uden at overveje kræfterne der forårsager bevægelsen. I 1D kinematik betragter vi bevægelse langs en enkelt akse.

## Grundlæggende Begreber

### Position
Position $x(t)$ angiver objektets placering på en tidspunkt $t$.

### Gennemsnitlig Hastighed
$$\overline{v} = \frac{\Delta x}{\Delta t} = \frac{x_2 - x_1}{t_2 - t_1}$$

### Instantan Hastighed  
$$v_x = \frac{dx}{dt}$$

Den instantane hastighed er den afledte af position med hensyn til tid.

### Gennemsnitlig Acceleration
$$\overline{a}_x = \frac{\Delta v_x}{\Delta t}$$

### Instantan Acceleration
$$a_x = \frac{dv_x}{dt} = \frac{d^2x}{dt^2}$$

## Bevægelsesligninger med Konstant Acceleration

Når $a$ er konstant, har vi følgende ligninger:

1. $v_x = v_{0x} + a_x t$
2. $x = x_0 + v_{0x}t + \frac{1}{2}a_x t^2$
3. $v_x^2 = v_{0x}^2 + 2a_x(x - x_0)$
4. $x = x_0 + \frac{1}{2}(v_{0x} + v_x)t$

## Vigtig Note
#note-box[
  $a \neq$ positiv $v$
  
  Acceleration kan være positiv mens hastighed er negativ (bremsning i negativ retning) eller omvendt.
]

## Problemløsningsstrategi

1. **Koordinatsystem**: Vælg origin og positiv retning
   - Sæt typisk $t = 0$ når $x_0 = 0$ hvis muligt
2. **Positiv retning**: Angiv hvor $x$, $v$, og $a$ er positive
3. **Symboler**: Omform givne oplysninger til symbolske størrelser
4. **Identificér**: Kendte og ukendte størrelser
5. **Skjult information**: Find implicit givne oplysninger
6. **Opstil ligninger**: Brug relevante bevægelsesligninger
7. **Check**: Enhedskontrol og grænsekontrol

## Related Concepts
- [[Hastighed og Acceleration]]
- [[Ordinære Differentialligninger (ODE)]] - Bevægelsesligninger er ODE'er
- [[Lineære ODE'er]] - Med konstant acceleration

## Covered In
- [[2026-02-02-10060-lecture.pdf|10060 Lecture Feb 02, 2026]]

## Course
[[10060-Fysik]]

## Prerequisites
- [[Differentialregning]] - For at forstå $v = dx/dt$
- [[Vektorer]] - Selv i 1D arbejder vi med retningsbevidste størrelser

## Applications
- Frit fald
- Projektilbevægelse (1D komponenter)
- Bremsedistance beregninger
- Kinematik i robotics

