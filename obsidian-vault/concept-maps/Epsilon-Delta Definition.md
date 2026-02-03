---
tags:
  - matematik
  - analysis
  - 01002
  - limits
---

# Epsilon-Delta Definition

## Definition
Den formelle **epsilon-delta definition** af [[Kontinuitet]] siger at en funktion $f$ er kontinuert i $x_0$ hvis:

$$\forall \epsilon > 0 \quad \exists \delta > 0: \quad |x - x_0| < \delta \Rightarrow |f(x) - f(x_0)| < \epsilon$$

## Interpretation
- **$\epsilon$** (epsilon): Hvor tæt vi vil have $f(x)$ på $f(x_0)$ (præcision i output)
- **$\delta$** (delta): Hvor tæt $x$ skal være på $x_0$ (præcision i input)

For enhver ønsket output-præcision $\epsilon$ (uanset hvor lille), kan vi finde en input-præcision $\delta$ der garanterer det.

## Visual Interpretation
```
       f(x₀) + ε  ┄┄┄┄┄┄┄┄┄┄┄┄┄
                  │         │
       f(x₀) ────────────●─────
                  │         │
       f(x₀) - ε  ┄┄┄┄┄┄┄┄┄┄┄┄┄
                  │    │    │
                 x₀-δ x₀  x₀+δ
```

Hvis $x$ er inden for $\delta$ af $x_0$, så er $f(x)$ inden for $\epsilon$ af $f(x_0)$.

## Example: Linear Function
For $f(x) = ax + b$, vis kontinuitet i $x_0$:

**Bevis:**
$$|f(x) - f(x_0)| = |ax + b - (ax_0 + b)| = |a||x - x_0|$$

Givet $\epsilon > 0$, vælg $\delta = \frac{\epsilon}{|a|}$ (antag $a \neq 0$).

Så:
$$|x - x_0| < \delta \Rightarrow |f(x) - f(x_0)| = |a||x - x_0| < |a| \cdot \frac{\epsilon}{|a|} = \epsilon$$

## Strategy for Proofs
1. Start med $|f(x) - f(x_0)|$
2. Manipulér udtryk for at få $|x - x_0|$ ud
3. Find relationen mellem $\epsilon$ og $\delta$
4. Vælg passende $\delta$ (ofte en funktion af $\epsilon$)
5. Verificér at det virker

## Negation (Diskontinuitet)
For at vise at $f$ er **diskontinuert** i $x_0$, vis at:

$$\exists \epsilon > 0 \quad \forall \delta > 0: \quad \exists x: |x - x_0| < \delta \text{ og } |f(x) - f(x_0)| \geq \epsilon$$

### Example: Heaviside Function
For [[Heaviside-funktionen]] $h(x)$ i $x_0 = 0$:

Vælg $\epsilon = \frac{1}{2}$.

For enhver $\delta > 0$, kan vi finde $x = -\frac{\delta}{2}$ hvor:
$$|x - 0| = \frac{\delta}{2} < \delta$$
men
$$|h(x) - h(0)| = |0 - 1| = 1 > \frac{1}{2}$$

## Related Concepts
- [[Kontinuitet]] - Overordnet koncept
- [[Grænseværdier]] - Epsilon-delta også bruges for grænseværdier
- [[Diskontinuitet]]

## Historical Note
Formaliseret af Weierstrass i 1800-tallet for at gøre calculus rigorøs.

## Covered In
- [[2026-02-03-01002-lecture.pdf#page=4|01002 Lecture Feb 03, 2026]]

## Course
[[01002-Matematik 1b]]

## Prerequisites
- [[Absolutværdi]]
- [[Kvantorer]] (∀, ∃)
- [[Logik]]

