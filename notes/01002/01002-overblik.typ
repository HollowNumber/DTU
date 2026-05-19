#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Eksamensoverblik — Alle Emner",
  date: datetime(year: 2026, month: 5, day: 12),
  author: "Mikkel M.H. Pedersen (s255015)",
  semester: "2026 Spring"
)

#show math.phi: math.phi.alt
#let vecrow = vecrow.with(delim: "[")
#let dmat = dmat.with(delim: "[")
#show: super-T-as-transpose

#note-box(title: "Pensum — Hvad er IKKE til eksamen")[
  - *Afsnit 2.10*: Projektioner på underrum (ortogonalt komplement)
  - *Afsnit 7.5*: Greens, Stokes' og Gauss' sætninger
  - *Afsnit 7.2 (sidste 4 sider)*: Fladeintegraler og flux
  - *Demo 11*: Flux-beregninger
  - *Fladeintegral-delen af Demo 9*
  - *Gruppeprojektet*
]

// ─────────────────────────────────────────────────────────────────────────────
= 1. Vektorfunktioner & Jacobi-matricen
// ─────────────────────────────────────────────────────────────────────────────

En vektorfunktion $va(f): U -> RR^k$, $U subset.eq RR^n$ åben, er *differentiabel* i $va(x)_0$ hvis:

$
va(f)(va(x)_0 + va(h)) - va(f)(va(x)_0) - vb(J)_(va(f))(va(x)_0) va(h) - va(epsilon)(va(h)) norm(va(h)) = va(0)
$

hvor $va(epsilon)(va(h)) -> va(0)$ for $va(h) -> va(0)$.

#definition(title: "Jacobi-matricen")[
  $vb(J)_(va(f))(va(x)_0) in RR^(k times n)$ med poster:

  $
  vb(J)_(va(f)) = mat(
    pdv(f_1, x_1), pdv(f_1, x_2), dots.c, pdv(f_1, x_n);
    pdv(f_2, x_1), dots.down, , dots.v;
    dots.v, , dots.down, dots.v;
    pdv(f_k, x_1), dots.c, dots.c, pdv(f_k, x_n)
  )
  $

  Specielle tilfælde:
  - $k=1$: $vb(J)_f = (grad f)^TT$ (rækkevektor)
  - $k=1, n=1$: $vb(J)_f = mat(f'(x_0))$
]

#theorem(title: "Generaliseret Kæderegel (3.8.4)")[
  Hvis $va(f): U -> RR^k$ diff. i $va(x)_0$ og $va(g): V -> RR^lambda$ diff. i $va(y)_0 = va(f)(va(x)_0)$:

  $
  vb(J)_(va(g) compose va(f))(va(x)_0) = vb(J)_(va(g))(va(y)_0) dot vb(J)_(va(f))(va(x)_0)
  $

  Dimensioner: $(lambda times k) dot (k times n) = lambda times n$.
]

#note-box(title: "Gradient og Hesse-matricen")[
  For $f: U -> RR$:
  $
  grad f(va(x)) = vec(pdv(f, x_1), pdv(f, x_2), dots.v, pdv(f, x_n)) in RR^n, quad
  vb(H)_f(va(x)) = mat(
    pdv(f, x_1, 2), pdv(f, x_1, x_2), dots.c;
    pdv(f, x_2, x_1), dots.down, ;
    dots.v, , pdv(f, x_n, 2)
  ) in RR^(n times n)
  $

  $vb(H)_f$ er altid symmetrisk for $f in C^2$.
]

#definition(title: "Retningsafledt")[
  For $f: U -> RR$ og enhedsvektor $va(u) in RR^n$ ($norm(va(u)) = 1$):
  $
  D_(va(u)) f(va(x)_0) = lim_(h -> 0) frac(f(va(x)_0 + h va(u)) - f(va(x)_0), h) = iprod(grad f(va(x)_0), va(u))
  $

  Den retning der *maksimerer* $D_(va(u)) f$ er $va(u) = frac(grad f, norm(grad f))$ (gradientens retning).
]

#note-box(title: "Gradient ⊥ Niveaukurver")[
  Niveaumængden $N_c = {va(x) in U : f(va(x)) = c}$.

  Gradienten $grad f(va(x)_0)$ er *vinkelret* på niveaukurven/-fladen gennem $va(x)_0$:
  $
  iprod(grad f(va(x)_0), va(t)) = 0 quad "for alle tangentvektorer" va(t) "til" N_c "i" va(x)_0
  $

  Dette bruges til at finde normalvektorer til kurver/flader.
]

// ─────────────────────────────────────────────────────────────────────────────
= 2. Indreprodukt, Norm & Projektioner
// ─────────────────────────────────────────────────────────────────────────────

#definition(title: "Indreprodukt (2.1.2)")[
  En funktion $iprod(*,*): V times V -> FF$ er et indreprodukt hvis den opfylder:
  1. $iprod(va(x), va(x)) >= 0$
  2. $iprod(va(x), va(x)) = 0 <=> va(x) = va(0)$
  3. $iprod(va(x), va(y)) = overline(iprod(va(y), va(x)))$
  4. $iprod(c va(x) + d va(y), va(z)) = c iprod(va(x), va(z)) + d iprod(va(y), va(z))$
]

#note-box(title: "Standardeksempler")[
  $
  vb(x), vb(y) in RR^n &: quad iprod(vb(x), vb(y)) = vb(y)^TT vb(x) = sum_i x_i y_i \
  vb(x), vb(y) in CC^n &: quad iprod(vb(x), vb(y)) = vb(y)^* vb(x) = sum_i x_i overline(y_i) \
  vb(A), vb(B) in CC^(m times n) &: quad iprod(vb(A), vb(B))_F = tr(vb(B)^* vb(A)) quad "Frobenius" \
  p, q in P([a,b]) &: quad iprod(p, q) = integral_a^b p(x) overline(q(x)) dd(x)
  $
]

#definition(title: "Norm (2.1.1)")[
  Norm $norm(*): V -> RR$ opfylder: (1) $norm(vb(x)) >= 0$, (2) $norm(vb(x))=0 <=> vb(x)=vb(0)$, (3) $norm(c vb(x)) = abs(c) norm(vb(x))$, (4) trekantsulighed.

  Fra indreprodukt: $norm(vb(x)) = sqrt(iprod(vb(x), vb(x)))$. For $RR^n$: $norm(vb(x)) = sqrt(sum_i x_i^2)$.
]

#definition(title: "Projektion")[
  Projektion af $vb(x)$ på underrum $Y = op("span")(vb(y))$:
  $
  op("proj")_Y(vb(x)) = frac(iprod(vb(x), vb(y)), norm(vb(y))^2) vb(y)
  $

  Hvis $vb(u) = vb(y)/norm(vb(y))$ (normaliseret): $op("proj")_Y(vb(x)) = iprod(vb(x), vb(u)) vb(u)$.
]

// ─────────────────────────────────────────────────────────────────────────────
= 3. Gram-Schmidt & ONB
// ─────────────────────────────────────────────────────────────────────────────

#definition(title: "Ortonormal Basis (ONB) (2.4.1)")[
  $beta = vb(u)_1, dots, vb(u)_n$ er en ONB hvis $op("span")(beta) = V$ og $iprod(vb(u)_i, vb(u)_j) = delta_(i j)$.
]

#theorem(title: "Gram-Schmidt")[
  Givet lineært uafhængige $vb(v)_1, dots, vb(v)_m$. Konstruér ONB $vb(u)_1, dots, vb(u)_m$:

  $
  vb(w)_1 &= vb(v)_1, quad &&vb(u)_1 = frac(vb(w)_1, norm(vb(w)_1)) \
  vb(w)_j &= vb(v)_j - sum_(i=1)^(j-1) iprod(vb(v)_j, vb(u)_i) vb(u)_i, quad &&vb(u)_j = frac(vb(w)_j, norm(vb(w)_j))
  $

  #note-box[Tjek altid at $iprod(vb(w)_j, vb(u)_i) = 0$ for $i < j$ inden normalisering.]
]

// ─────────────────────────────────────────────────────────────────────────────
= 4. Spektralsætningen & Diagonalisering
// ─────────────────────────────────────────────────────────────────────────────

#note-box(title: "Matrixtyper")[
  #table(
    columns: (auto, auto, auto),
    inset: 6pt,
    [*Type*], [*Betingelse*], [*Konsekvens*],
    [Reel symmetrisk], [$vb(A) = vb(A)^TT, vb(A) in M_n(RR)$], [Reel ortogonal diagonaliserbar],
    [Hermitisk], [$vb(A)^* = vb(A)$], [Unitær diagonaliserbar; reelle egenværdier],
    [Normal], [$vb(A)^* vb(A) = vb(A) vb(A)^*$], [Unitær diagonaliserbar],
  )
]

#theorem(title: "Spektralsætningen")[
  $vb(A) in M_n(RR)$ er *reel symmetrisk* $<=>$ $vb(A) = vb(Q) vb(Lambda) vb(Q)^TT$ med $vb(Q)$ reel ortogonal ($vb(Q)^TT = vb(Q)^(-1)$) og $vb(Lambda) = dmat(lambda_1, dots.down, lambda_n, fill: 0)$.

  $RR^n$ har en ONB af egenvektorer for $vb(A)$.
]

#note-box(title: "Algoritme: Find spektraldekomposition")[
  1. Find egenværdier: løs $det(vb(A) - lambda vb(I)) = 0$
  2. For hver $lambda_i$: løs $(vb(A) - lambda_i vb(I)) vb(v) = vb(0)$
  3. Hvis $"am"(lambda_i) = 1$: normaliser egenvektoren
  4. Hvis $"am"(lambda_i) > 1$: anvend Gram-Schmidt på egenrummet $E_(lambda_i)$
  5. Opstil $vb(Q) = mat(vb(q)_1, vb(q)_2, dots, vb(q)_n)$
]

#lemma(name: "Lemma 2.8.1")[
  Hermitisk $vb(A)$: alle egenværdier er reelle. Egenvektorer fra *forskellige* egenværdier er ortogonale.
]

#definition(title: "Kvadratisk Form")[
  En *kvadratisk form* er $q: RR^n -> RR$:
  $
  q(va(x)) = va(x)^TT vb(A) va(x) + vb(b)^TT va(x) + c
  $

  $vb(A)$ kan altid antages *symmetrisk* (erstat $vb(A)$ med $frac(vb(A) + vb(A)^TT, 2)$).

  Gradienten: $grad q(va(x)) = 2 vb(A) va(x) + vb(b)$.
]

#note-box(title: "Reduktion af Kvadratisk Form (eliminér blandede led)")[
  Givet $q(x_1, x_2) = a x_1^2 + b x_1 x_2 + d x_2^2$ (blandede led).

  *Skriv som matrixform:* $q = va(x)^TT vb(A) va(x)$ med $vb(A) = mat(a, b/2; b/2, d)$ (det blandede led deles med 2).

  *Reduktion via spektraldekomposition:*
  1. Diagonalisér $vb(A) = vb(Q) vb(Lambda) vb(Q)^TT$ (find egenværdier $lambda_1, lambda_2$ og ONB af egenvektorer)
  2. Substituer $tilde(va(x)) = vb(Q)^TT va(x)$ (rotation; ingen skalering da $vb(Q)$ ortogonal)
  3. Da $q = va(x)^TT vb(A) va(x) = tilde(va(x))^TT vb(Lambda) tilde(va(x)) = lambda_1 tilde(x)_1^2 + lambda_2 tilde(x)_2^2$

  De nye koordinater $tilde(va(x))$ har *ingen* blandede led. Definithed aflæses af $lambda_1, lambda_2$.
]

// ─────────────────────────────────────────────────────────────────────────────
= 5. Taylor-polynomier
// ─────────────────────────────────────────────────────────────────────────────

#definition(title: "Taylor-polynomium (1D)")[
  $f: I -> RR$ $K$ gange diff. i $x_0$:
  $
  P_(K,f,x_0)(x) = sum_(k=0)^K frac(f^((k))(x_0), k!) (x - x_0)^k
  $
]

#note-box(title: "Vigtige Taylorudviklinger (ved $x_0 = 0$)")[
  $
  e^x &= 1 + x + frac(x^2, 2!) + frac(x^3, 3!) + dots \
  sin(x) &= x - frac(x^3, 3!) + frac(x^5, 5!) - dots \
  cos(x) &= 1 - frac(x^2, 2!) + frac(x^4, 4!) - dots \
  ln(1+x) &= x - frac(x^2, 2) + frac(x^3, 3) - dots quad (abs(x) < 1)
  $
]

#theorem(title: "Restled (4.3.1)")[
  Lagrange form: $R_K(x) = frac(f^((K+1))(xi), (K+1)!)(x-x_0)^(K+1)$ for et $xi$ mellem $x_0$ og $x$.

  Peano form: $R_K(x) = epsilon_K(x - x_0) dot abs(x-x_0)^K$ med $epsilon_K -> 0$ for $x -> x_0$.
]

#definition(title: "Taylor-polynomium (multivariabel, 2. orden)")[
  $f: U -> RR$, $U subset.eq RR^n$:
  $
  P_(2,f,va(x)_0)(va(x)) = f(va(x)_0) + (grad f(va(x)_0))^TT (va(x) - va(x)_0) + frac(1, 2) (va(x) - va(x)_0)^TT vb(H)_f(va(x)_0) (va(x) - va(x)_0)
  $
]

#note-box(title: "Grænseovergange via Taylor (Peano)")[
  Strategi: erstat $f(x)$ med $P_K(x) + epsilon_K(x) abs(x-x_0)^K$ og forenkl.

  Eksempel: $lim_(x->0) frac(sin x, x)$. Brug $sin x = x + epsilon_1(x) x$:
  $frac(sin x, x) = frac(x + epsilon_1(x) x, x) = 1 + epsilon_1(x) -> 1$.
]

#definition(title: "Tangentlinje og Tangentplan")[
  *Tangentlinje* til $f: RR -> RR$ i $x_0$: $L(x) = f(x_0) + f'(x_0)(x - x_0)$

  *Tangentplan* til $f: RR^2 -> RR$ i $(x_0, y_0)$:
  $
  L(x,y) = f(x_0, y_0) + pdv(f, x)(x_0, y_0)(x - x_0) + pdv(f, y)(x_0, y_0)(y - y_0)
  $

  Svarende til 1. ordens Taylor: $P_(1,f,va(x)_0)(va(x)) = f(va(x)_0) + (grad f(va(x)_0))^TT (va(x) - va(x)_0)$.
]

// ─────────────────────────────────────────────────────────────────────────────
= 6. Ekstremum & Optimering
// ─────────────────────────────────────────────────────────────────────────────

#theorem(title: "Nødvendig betingelse for lokal ekstremi")[
  $f: U -> RR$ glat. Lokalt max/min i $va(x)_0$ kræver $grad f(va(x)_0) = va(0)$.

  Sådanne punkter kaldes *stationære punkter (s.p.)*.
]

#theorem(title: "Klassifikation via Hessematricen")[
  Lad $va(x)_0$ være s.p. ($grad f(va(x)_0) = va(0)$). Egenværdier af $vb(H)_f(va(x)_0) = lambda_1, dots, lambda_n$:

  #table(
    columns: (auto, auto),
    inset: 6pt,
    [*Egenværdier*], [*Konklusion*],
    [Alle $lambda_i > 0$], [Egentligt lokalt *minimum*],
    [Alle $lambda_i < 0$], [Egentligt lokalt *maximum*],
    [Blandede fortegn], [*Saddelpunkt*],
    [Mindst én $lambda_i = 0$], [Ingen konklusion],
  )
]

#note-box(title: "Genvej: 2×2 Hessematrix")[
  For $f: U -> RR$, $U subset.eq RR^2$. Lad $vb(H) = vb(H)_f(va(x)_0) = mat(A, B; B, D)$.

  $det(vb(H)) = A D - B^2$

  #table(
    columns: (auto, auto, auto),
    inset: 6pt,
    [*Betingelse*], [*Type*], [*Konklusion*],
    [$det(vb(H)) > 0$ og $A > 0$], [PD], [Lokalt *minimum*],
    [$det(vb(H)) > 0$ og $A < 0$], [ND], [Lokalt *maximum*],
    [$det(vb(H)) < 0$], [Indefinit], [*Saddelpunkt*],
    [$det(vb(H)) = 0$], [—], [Ingen konklusion],
  )

  *Husk:* Kun brugbar i 2D. For $n >= 3$ bruges egenværdier.
]

#theorem(title: "Weierstrass (5.1.1)")[
  $f: [a,b] -> RR$ kontinuert $=>$ $f$ antager minimum $m$ og maximum $M$, og $"Im"(f) = [m,M]$.
]

#definition(title: "Positiv (semi-)definithed")[
  En symmetrisk matrix $vb(A) in M_n(RR)$ er:
  #table(
    columns: (auto, auto, auto),
    inset: 6pt,
    [*Betegnelse*], [*Egenværdier*], [*Ækvivalent betingelse*],
    [Positiv definit (PD)], [alle $lambda_i > 0$], [$va(x)^TT vb(A) va(x) > 0$ for $va(x) != va(0)$],
    [Positiv semidefinit (PSD)], [alle $lambda_i >= 0$], [$va(x)^TT vb(A) va(x) >= 0$],
    [Negativ definit (ND)], [alle $lambda_i < 0$], [$va(x)^TT vb(A) va(x) < 0$ for $va(x) != va(0)$],
    [Negativ semidefinit (NSD)], [alle $lambda_i <= 0$], [$va(x)^TT vb(A) va(x) <= 0$],
    [Indefinit], [blandede fortegn], [saddelpunkt],
  )

  $vb(H)_f(va(x)_0)$ PD $=>$ lokalt min. $vb(H)_f(va(x)_0)$ ND $=>$ lokalt max.
]

#note-box(title: "Strategi: Find alle lokale ekstrema for $f: U -> RR$")[
  1. Find alle s.p.: løs $grad f(va(x)) = va(0)$
  2. Beregn $vb(H)_f$ i hvert s.p.
  3. Find egenværdier af $vb(H)_f$ og klassificér
]

#note-box(title: "Strategi: Globalt ekstremum på kompakt mængde $K$")[
  $K$ er kompakt hvis den er lukket og begrænset (fx lukket disk, interval $[a,b]^n$).

  Weierstrass: $f$ kontinuert på $K =>$ $f$ antager sit globale max og min.

  *Fremgangsmåde:*
  1. Find alle indre stationære punkter (løs $grad f = va(0)$ på $K^circle$)
  2. Find ekstrema på randen $partial K$ (parametrisér randen og gentag)
  3. Sammenlign alle funktionsværdier — størst er globalt max, mindst er globalt min
]

// ─────────────────────────────────────────────────────────────────────────────
= 7. Riemann-integralet & Integrationsteknikker
// ─────────────────────────────────────────────────────────────────────────────

#definition(title: "Stamfunktion (6.2.1)")[
  $F: I -> RR$ er stamfunktion til $f$ hvis $F'(x) = f(x)$. Betegnes $F(x) = integral f(x) dd(x)$.
]

#note-box(title: "Basale stamfunktioner")[
  $
  integral x^alpha dd(x) &= frac(x^(alpha+1), alpha+1) + C quad (alpha != -1) \
  integral frac(1, x) dd(x) &= ln abs(x) + C \
  integral e^(alpha x) dd(x) &= frac(1, alpha) e^(alpha x) + C \
  integral sin(x) dd(x) &= -cos(x) + C \
  integral cos(x) dd(x) &= sin(x) + C
  $
]

#theorem(title: "Partiel Integration")[
  $
  integral_a^b f(x) g(x) dd(x) = [F(x) g(x)]_a^b - integral_a^b F(x) g'(x) dd(x)
  $

  Tommelfingerregel: vælg $g(x)$ som det "nemmeste" at differentiere (polynomium $>$ trig $>$ exp).
]

#theorem(title: "Substitution")[
  Lad $x = phi(u)$, $phi$ diff. og injektiv:
  $
  integral_a^b f(x) dd(x) = integral_(phi^(-1)(a))^(phi^(-1)(b)) f(phi(u)) phi'(u) dd(u)
  $
]

// ─────────────────────────────────────────────────────────────────────────────
= 8. Dobbelt- og Trippelintegraler
// ─────────────────────────────────────────────────────────────────────────────

#theorem(title: "Fubinis Sætning")[
  For $f$ kontinuert på $B = [a_1, b_1] times [a_2, b_2]$:
  $
  integral_B f(x,y) dd(x,y) = integral_(a_2)^(b_2) integral_(a_1)^(b_1) f(x,y) dd(x) dd(y) = integral_(a_1)^(b_1) integral_(a_2)^(b_2) f(x,y) dd(y) dd(x)
  $

  Integrationsrækkefølgen kan byttes (for kontinuerte $f$ over rektangler).
]

#note-box(title: "Integration over vilkårlige 2D-områder")[
  Type 1 (lodret snit): $B = {(x,y) : a <= x <= b, g_1(x) <= y <= g_2(x)}$:
  $integral_B f dd(A) = integral_a^b integral_(g_1(x))^(g_2(x)) f(x,y) dd(y) dd(x)$

  Type 2 (vandret snit): $B = {(x,y) : c <= y <= d, h_1(y) <= x <= h_2(y)}$:
  $integral_B f dd(A) = integral_c^d integral_(h_1(y))^(h_2(y)) f(x,y) dd(x) dd(y)$
]

// ─────────────────────────────────────────────────────────────────────────────
= 9. Koordinatskift & Transformationssætningen
// ─────────────────────────────────────────────────────────────────────────────

#theorem(title: "Transformationssætningen (6.6.2)")[
  Lad $va(r): Gamma -> B$ stykkevis $C^1$, injektiv på $Gamma^circle$, $det vb(J)_(va(r))(va(u)) != 0$ på $Gamma^circle$:
  $
  integral_B f(va(x)) dd(va(x)) = integral_Gamma f(va(r)(va(u))) abs(det vb(J)_(va(r))(va(u))) dd(va(u))
  $
]

#note-box(title: "Standardkoordinater")[
  *Polære* ($n=2$): $va(r)(r,theta) = vec(r cos theta, r sin theta)$. Jacobi: $abs(det vb(J)) = r$.

  *Cylindriske* ($n=3$): $va(r)(r,theta,z) = vec(r cos theta, r sin theta, z)$. Jacobi: $abs(det vb(J)) = r$.

  *Sfæriske* ($n=3$): $va(r)(r,theta,phi) = vec(r sin theta cos phi, r sin theta sin phi, r cos theta)$. Jacobi: $abs(det vb(J)) = r^2 sin theta$.

  hvor $r >= 0$, $theta in [0, pi]$ (polær vinkel fra $z$-aksen), $phi in [0, 2pi]$.
]

// ─────────────────────────────────────────────────────────────────────────────
= 10. Kurveintegraler
// ─────────────────────────────────────────────────────────────────────────────

Lad $C$ parametriseres ved $va(r): [a,b] -> RR^n$, stykkevis $C^1$, regulær ($norm(va(r)'(u)) != 0$).

#definition(title: "Skalar kurveintegral (7.2.1, $m=1$)")[
  $
  integral_C f(va(x)) dd(va(s)) = integral_a^b f(va(r)(u)) norm(va(r)'(u)) dd(u)
  $

  Kurvelængden: $cal(l)(C) = integral_C 1 dd(va(s)) = integral_a^b norm(va(r)'(u)) dd(u)$.
]

#definition(title: "Vektorfelt-kurveintegral")[
  For vektorfelt $va(V): U -> RR^n$:
  $
  integral_C va(V) dot dd(va(s)) = integral_a^b iprod(va(V)(va(r)(u)), va(r)'(u)) dd(u)
  $

  #note-box[*Bemærk:* Her beregnes *ikke* $norm(va(r)'(u))$ — det forkortes ud.]
]

// ─────────────────────────────────────────────────────────────────────────────
= 11. Gradientfelter & Stamfunktionsproblemet
// ─────────────────────────────────────────────────────────────────────────────

#definition(title: "Gradientfelt")[
  $va(V): U -> RR^n$ er et *gradientfelt* hvis der findes $f: U -> RR$ med $grad f(va(x)) = va(V)(va(x))$.

  $f$ kaldes en *stamfunktion* til $va(V)$.
]

#theorem(title: "Test for gradientfelt (Lemma 7.3.2 & 7.3.3)")[
  Hvis $va(V)$ er $C^1$ og et gradientfelt $=>$ $vb(J)_(va(V))(va(x))$ er *symmetrisk* for alle $va(x) in U$.

  Hvis $U$ er *stjerneformet* gælder også omvendt:
  $
  va(V) "er gradientfelt" <==> vb(J)_(va(V))(va(x)) "er symmetrisk"
  <==> pdv(V_i, x_j) = pdv(V_j, x_i) quad forall i,j
  $
]

#note-box(title: "Stjerneformet vs. Ikke-simpelt-sammenhængende")[
  $U subset.eq RR^n$ er *stjerneformet* med centrum $va(x)^*$ hvis linjestykket fra $va(x)^*$ til ethvert $va(x) in U$ ligger i $U$.

  - $RR^n$, åben kugle, konveks mængde: stjerneformet $checkmark$
  - $RR^2 without {va(0)}$ (plan uden origo): *ikke* stjerneformet $times$

  *Vigtigt:* På $RR^2 without {va(0)}$ kan $vb(J)_(va(V))$ være symmetrisk *uden* at $va(V)$ er gradientfelt (eksempel: $va(V) = frac(1, x^2+y^2) vec(-y, x)$). Symmetrisk Jacobi er kun tilstrækkeligt på stjerneformede mængder.
]

#theorem(title: "Kurveintegral for gradientfelt (Lemma 7.4.1)")[
  Hvis $grad f = va(V)$ og $va(r): [a,b] -> U$ parametriserer kurven $C$:
  $
  integral_C va(V) dot dd(va(s)) = f(va(r)(b)) - f(va(r)(a))
  $

  For *lukket* kurve ($va(r)(a) = va(r)(b)$): $integral_C va(V) dot dd(va(s)) = 0$.
]

#note-box(title: "Algoritme: Find stamfunktion $f$ til $va(V)$ — stjerneintegral")[
  Brug stjerneparametrisering $va(r)(u) = u dot va(x)$, $u in [0,1]$:
  $
  f(va(x)) = integral_0^1 iprod(va(V)(u va(x)), va(x)) dd(u) + C
  $

  *Verificér* ved at beregne $grad f$ og tjekke $grad f = va(V)$.
]

#note-box(title: "Alternativ: Direkte integration (stykke-for-stykke)")[
  For $va(V)(x,y) = vec(V_1(x,y), V_2(x,y))$ i $RR^2$:

  1. Integrér $V_1$ mht. $x$: $quad f(x,y) = integral V_1(x,y) dd(x) + g(y)$
  2. Differentier mht. $y$: $quad pdv(f,y) = (dots) + g'(y) = V_2(x,y)$, løs for $g'(y)$
  3. Integrér $g'(y)$ for at finde $g(y)$

  *Eksempel:* $va(V)(x,y) = vec(y+y^2, x+2 x y)$

  1. $f = integral (y+y^2) dd(x) = x y + x y^2 + g(y)$
  2. $pdv(f,y) = x + 2 x y + g'(y) = x + 2 x y$ $=>$ $g'(y) = 0$
  3. $g(y) = C$ $=>$ $f(x,y) = x y + x y^2 + C$
]

#note-box(title: "Oversigt: Hvornår er $va(V)$ et gradientfelt?")[
  Tre ækvivalente betingelser (på stjerneformet $U$):
  1. $va(V) = grad f$ for en $f: U -> RR$
  2. $vb(J)_(va(V))(va(x))$ er symmetrisk
  3. $integral_C va(V) dot dd(va(s)) = 0$ for alle lukkede kurver $C subset U$
]

// ─────────────────────────────────────────────────────────────────────────────
= 12. Strømningskurver (Integralskurver)
// ─────────────────────────────────────────────────────────────────────────────

#definition(title: "Strømningskurve for vektorfelt")[
  Givet $va(V): U -> RR^n$. En *strømningskurve* (integralskurve) er en kurve $va(r): I -> U$ der opfylder:
  $
  va(r)'(t) = va(V)(va(r)(t)), quad va(r)(t_0) = va(x)_0 quad "begyndelsesbetingelse"
  $

  Dette er et *autonomt ODE-system*. Løs komponentvis:
  $
  cases(
    x_1'(t) = V_1(x_1(t), dots, x_n(t)),
    x_2'(t) = V_2(x_1(t), dots, x_n(t)),
    dots.v,
    x_n'(t) = V_n(x_1(t), dots, x_n(t))
  )
  $
]

#example[
  $va(V)(x,y) = vec(-y, x)$. Strømningskurver opfylder $x'=-y$, $y'=x$. Løsning: $va(r)(t) = vec(cos t, sin t)$ (cirkler mod uret).

  Hvis $va(V) = grad f$: strømningskurverne er *ortogonale* til niveaukurverne for $f$.
]
