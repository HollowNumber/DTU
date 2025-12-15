#import "@local/dtu-template:0.5.1":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk Grundlag)",
  title: "Kapitel 13: Systemer af lineære ordinære differentialligninger af første orden med konstante koefficienter",
  date: datetime(year: 2025, month: 11, day: 25),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2025 Fall"
)

#set math.mat(delim: "[")
#set math.vec(delim: "[")

= Introduktion til differentialligninger

== Grundlæggende notation

I dette kapitel arbejder vi med funktioner $f: RR -> RR$ (reelle funktioner) eller $f: RR -> CC$ (komplekse funktioner med reelt input).

Vi benytter notationen:
- $f'(t)$ eller $f^((1))(t)$ for den afledte
- $f''(t)$ eller $f^((2))(t)$ for den andenafledte
- $f^((n))(t)$ for den $n$'te afledte
- $f^((0))(t) = f(t)$

#note-box[
  *Engelsk terminologi:*
  - Reel funktion: _real-valued function_
  - Kompleks funktion med reelt input: _complex-valued function_
  - Ordinær differentialligning: _ordinary differential equation_ (ODE)
]

== Ordinære differentialligninger

#definition(
  title: "13.0.1 - Ordinær differentialligning (ODE)",
)[
  Lad $n$ være et naturligt tal. En *$n$'te-ordens ordinær differentialligning (ODE)* er en ligning på formen
  $ F(f^((n))(t), ..., f'(t), f(t), t) = 0 $
  hvor $F$ er en funktion, der tager $n + 2$ variable som input.

  En *løsning* til en sådan ODE er en reel funktion $f(t)$, således at
  $ F(f^((n))(t), ..., f'(t), f(t), t) = 0 $
  for alle $t in RR$.
]

#example(
  title: "Simpel førsteordens ODE",
)[
  Funktionen $f(t) = e^t$ er en løsning til ODE'en $f'(t) - f(t) = 0$, fordi $(e^t)' = e^t$.
]

== Lineære ODE'er

#definition(
  title: "13.0.2 - Lineær ODE",
)[
  En *lineær ODE* er en ligning på formen $L(f(t)) = q(t)$, hvor:
  - $q(t) in C_infinity (RR)$ er en funktion
  - $L: C_infinity (RR) -> C_infinity (RR)$ er en lineær afbildning

  Hvis $q(t)$ er nulfunktionen, kaldes den lineære ODE *homogen*.

  Ellers kaldes den *inhomogen*.
]

#important[
  Pointen med at studere lineære ODE'er i forbindelse med lineær algebra er, at Sætning 11.4.1 kan beskrive strukturen af løsningsmængden.
]

#example(
  title: "13.0.1 - Klassifikation af ODE'er",
)[
  Er følgende ODE'er lineære? Hvis ja, homogene eller inhomogene?

  *(a)* $f''(t) + 2f'(t) + f(t) = cos(t)$

  *Svar:* Lineær med $L(f(t)) = f''(t) + 2f'(t) + f(t)$ og $q(t) = cos(t)$.
  Da $q(t) eq.not 0$, er det en *inhomogen* lineær ODE.

  *(b)* $e^t dot f'(t) + cos(t) dot f(t) = 0$

  *Svar:* Lineær med $L(f(t)) = e^t dot f'(t) + cos(t) dot f(t)$ og $q(t) = 0$.
  Da $q(t) = 0$, er det en *homogen* lineær ODE.

  *(c)* $(f'(t))^2 + f(t) = 0$

  *Svar:* *Ikke lineær* på grund af leddet $(f'(t))^2$.
]

== Komplekse funktioner med reelt input

For en funktion $f: RR -> CC$ kan vi for ethvert $t in RR$ skrive:
$ f(t) = f_1(t) + i dot f_2(t) $
hvor $f_1(t) = op("Re")(f(t))$ og $f_2(t) = op("Im")(f(t))$.

#note-box[
  Hvis de afledte af $f_1$ og $f_2$ eksisterer, definerer vi den afledte af $f$ som:
  $ f' = f'_1 + i dot f'_2 $

  Tilsvarende: $f^((n)) = f_1^((n)) + i dot f_2^((n))$
]

= Lineære førsteordens ODE'er

== Definition og eksempler

En *førsteordens ODE* er en relation mellem en funktion $f(t)$ og dens afledte $f'(t)$.

#example(
  title: "13.1.1 - Verifikation af løsninger",
)[
  Undersøg om funktionen $f(t) = e^(2t)$ er en løsning til følgende ODE'er:

  *(a)* $f'(t) - 2f(t) = 0$

  *Svar:* Ved kædereglen: $f'(t) = (e^(2t))' = 2e^(2t)$.
  $ f'(t) - 2f(t) = 2e^(2t) - 2e^(2t) = 0 $
  Ja, $f(t) = e^(2t)$ er en løsning.

  *(b)* $(f'(t))^2 - 4f(t) = 0$

  *Svar:* $(f'(t))^2 - 4f(t) = (2e^(2t))^2 - 4e^(2t) = 4e^(4t) - 4e^(2t) eq.not 0$.
  Nej, $f(t) = e^(2t)$ er *ikke* en løsning.

  *(c)* $ln(f'(t)) - ln(f(t)) = ln(2)$

  *Svar:* $ln(2e^(2t)) - ln(e^(2t)) = ln(2) + ln(e^(2t)) - ln(e^(2t)) = ln(2)$.
  Ja, $f(t) = e^(2t)$ er en løsning.
]

== Fuldstændig løsning

#note-box[
  For ODE'en $f'(t) = f(t)$ er:
  - $f(t) = e^t$ en løsning
  - $f(t) = 2e^t$ og $f(t) = -5e^t$ er også løsninger
  - Faktisk er enhver funktion $f(t) = c dot e^t$ hvor $c in RR$ en løsning

  En beskrivelse af *alle* løsninger kaldes den *fuldstændige løsning*.
]

== Lineære førsteordens ODE'er med formel

En ODE på formen
$ f'(t) = a(t) f(t) + q(t) $ <eq:linear_first_order>
hvor $a(t)$ og $q(t)$ er funktioner i variablen $t$, kaldes en *lineær førsteordens ODE*.

#note-box[
  *Engelsk:* Funktionen $q(t)$ kaldes _forcing function_.

  - Hvis $q(t) = 0$: ODE'en er *homogen*
  - Hvis $q(t) eq.not 0$: ODE'en er *inhomogen*
]

== Stamfunktion og notation

Lad $P(t)$ betegne en *stamfunktion* for funktionen $a(t)$, dvs. $P'(t) = a(t)$.

#note-box[
  *Engelsk:* _primitive function_ eller _antiderivative_
]

#theorem(
  title: "13.1.1 - Fuldstændig løsning til lineær førsteordens ODE",
)[
  Den fuldstændige løsning til ODE'en $f'(t) = a(t) f(t) + q(t)$ er givet ved
  $ f(t) = e^(P(t)) integral e^(-P(t)) q(t) dif t $
  hvor $P(t)$ er en stamfunktion til $a(t)$.
]

#proof()[
  Husk at $P'(t) = a(t)$. Ved produktreglen og kædereglen:
  $ (e^(-P(t)) f(t))' = (e^(-P(t)))' f(t) + e^(-P(t)) f'(t) = -e^(-P(t)) a(t) f(t) + e^(-P(t)) f'(t) $

  Derfor gælder:
  $
    f'(t) = a(t) f(t) + q(t) &arrow.l.r.double e^(-P(t)) f'(t) - e^(-P(t)) a(t) f(t) = e^(-P(t)) q(t) \
    &arrow.l.r.double (e^(-P(t)) f(t))' = e^(-P(t)) q(t) \
    &arrow.l.r.double e^(-P(t)) f(t) = integral e^(-P(t)) q(t) dif t \
    &arrow.l.r.double f(t) = e^(P(t)) integral e^(-P(t)) q(t) dif t
  $
]

#important[
  Når man udregner integralet i Sætning 13.1.1, skal man *ikke glemme integrationskonstanten* - den er nødvendig for den fuldstændige løsning!
]

== Særtilfælde: Konstant koefficient

#corollary(
  name: "13.1.2 - Konstant koefficient",
)[
  Lad $a_0 in RR$, og lad $q(t)$ være en differentiabel, reel funktion.

  ODE'en $f'(t) = a_0 f(t) + q(t)$ har den fuldstændige løsning:
  $ f(t) = e^(a_0 t) integral e^(-a_0 t) q(t) dif t $

  Mere konkret, hvis $Q(t)$ er en stamfunktion til $e^(-a_0 t) q(t)$:
  $ f(t) = c dot e^(a_0 t) + e^(a_0 t) Q(t), quad c in RR $
]

#example(
  title: "13.1.2 - Anvendelse af Sætning 13.1.1",
)[
  Bestem den fuldstændige løsning til følgende ODE'er:

  *(a)* $f'(t) = f(t)$

  *Svar:* Her er $a(t) = 1$ og $q(t) = 0$. Stamfunktion: $P(t) = t$.
  $ f(t) = e^t integral e^(-t) dot 0 dif t = e^t integral 0 dif t = e^t dot c = c e^t $

  *(b)* $f'(t) = -sin(t) f(t) + sin(t)$

  *Svar:* Her er $a(t) = -sin(t)$ og $q(t) = sin(t)$. Stamfunktion: $P(t) = cos(t)$.
  $ f(t) = e^(cos(t)) integral e^(-cos(t)) sin(t) dif t = e^(cos(t)) (e^(-cos(t)) + c) = 1 + c e^(cos(t)) $

  *(c)* $f'(t) = -t^(-1) f(t) + 1$ med $t > 0$

  *Svar:* Her er $a(t) = -1/t$ og $q(t) = 1$. Stamfunktion: $P(t) = -ln(t)$.
  $ f(t) = e^(-ln(t)) integral e^(ln(t)) dif t = 1/t integral t dif t = 1/t (1/2 t^2 + c) = t/2 + c/t $
]

= Begyndelsesværdiproblemer

== Definition

#definition(
  title: "13.1.1 - Begyndelsesværdibetingelse",
)[
  Givet en reel funktion $f(t)$ og reelle tal $t_0$ og $y_0$, således at $f(t_0) = y_0$.

  Da siges funktionen $f(t)$ at opfylde *begyndelsesværdibetingelsen* $f(t_0) = y_0$.

  *Engelsk:* _initial-value condition_
]

#definition(
  title: "13.1.2 - Begyndelsesværdiproblem",
)[
  Lad $f(t)$ være en reel funktion, der opfylder:

  + $f(t)$ er en løsning til en $n$'te-ordens ODE $F(f^((n))(t), ..., f'(t), f(t), t) = 0$

  + $f(t)$ opfylder begyndelsesværdibetingelserne:
    $ f(t_0) = y_0, quad f'(t_0) = y_1, quad ..., quad f^((n-1))(t_0) = y_(n-1) $
    for givne $t_0 in RR$ og værdier $y_0, y_1, ..., y_(n-1) in RR$.

  Samlet kaldes disse to betingelser et *begyndelsesværdiproblem*.
]

#note-box[
  *Strategi til at løse begyndelsesværdiproblemer:*
  1. Bestem den fuldstændige løsning (med parameter $c$)
  2. Brug begyndelsesværdibetingelsen til at bestemme $c$
  3. Den resulterende funktion er løsningen
]

#example(
  title: "13.1.3 - Løsning af begyndelsesværdiproblemer",
)[
  *(a)* ODE: $f'(t) = f(t)$, begyndelsesværdi: $f(0) = 7$

  *Svar:* Fuldstændig løsning: $f(t) = c e^t$.

  Begyndelsesværdi: $f(0) = c = 7$.

  Løsning: $f(t) = 7e^t$

  *(b)* ODE: $f'(t) + sin(t) f(t) = sin(t)$, begyndelsesværdi: $f(pi) = 2$

  *Svar:* Fuldstændig løsning: $f(t) = 1 + c e^(cos(t))$.

  Begyndelsesværdi: $2 = f(pi) = 1 + c e^(cos(pi)) = 1 + c e^(-1)$

  Derfor: $c e^(-1) = 1 arrow.double c = e$

  Løsning: $f(t) = 1 + e dot e^(cos(t)) = 1 + e^(1 + cos(t))$
]

= Den komplekse eksponentialfunktion

#lemma(
  name: "13.1.3 - Afledte af kompleks eksponential",
)[
  Lad $lambda in CC$, og betragt den komplekse funktion med reelt input $f: RR -> CC$ defineret som $f(t) = e^(lambda t)$.

  Da gælder:
  - $op("Re")(f) = e^(op("Re")(lambda) t) cos(op("Im")(lambda) t)$
  - $op("Im")(f) = e^(op("Re")(lambda) t) sin(op("Im")(lambda) t)$
  - $f'(t) = lambda e^(lambda t)$
]

#proof()[
  Skriv $lambda = lambda_1 + i lambda_2$ på rektangulær form. For ethvert $t in RR$:
  $
    e^(lambda t) &= e^(lambda_1 t + i lambda_2 t) = e^(lambda_1 t) dot e^(i lambda_2 t) \
    &= e^(lambda_1 t) dot (cos(lambda_2 t) + i sin(lambda_2 t)) \
    &= e^(lambda_1 t) cos(lambda_2 t) + i dot e^(lambda_1 t) sin(lambda_2 t)
  $

  Ved produkt- og kædereglen:
  $
    f'(t) &= (e^(lambda_1 t) cos(lambda_2 t))' + i dot (e^(lambda_1 t) sin(lambda_2 t))' \
    &= (lambda_1 e^(lambda_1 t) cos(lambda_2 t) - lambda_2 e^(lambda_1 t) sin(lambda_2 t)) \
    &#h(1em) + i dot (lambda_1 e^(lambda_1 t) sin(lambda_2 t) + lambda_2 e^(lambda_1 t) cos(lambda_2 t)) \
    &= (lambda_1 + i lambda_2) e^(lambda_1 t) (cos(lambda_2 t) + i sin(lambda_2 t)) \
    &= lambda e^(lambda t)
  $
]

#important[
  Denne sætning er særdeles nyttig når vi skal finde løsninger til ODE'er med komplekse egenværdier!
]

= Systemer af lineære førsteordens ODE'er

== Definition af systemer

#definition(
  title: "13.2.1 - System af lineære førsteordens ODE'er",
)[
  Lad $n > 0$ være et heltal, $q_1(t), ..., q_n(t)$ reelle differentiable funktioner, og $bold(A) in RR^(n times n)$ en matrix.

  Et *system af lineære førsteordens ODE'er* er en ligning på formen:
  $ vec(f'_1(t), f'_2(t), dots.v, f'_n(t)) = bold(A) dot vec(f_1(t), f_2(t), dots.v, f_n(t)) + vec(q_1(t), q_2(t), dots.v, q_n(t)) $ <eq:system_ode>

  - Matricen $bold(A)$ kaldes *koefficientmatricen*
  - Funktionerne $q_1(t), ..., q_n(t)$ kaldes systemets *forcing functions*
  - Hvis alle $q_i(t) = 0$: systemet er *homogent*
  - Ellers: systemet er *inhomogent*
  - En løsning til et inhomogent system kaldes en *partikulær løsning*
]

#example(
  title: "13.2.1 - System af ODE'er",
)[
  Givet systemet:
  $ vec(f'_1(t), f'_2(t)) = mat(2, 1; 0, 2) dot vec(f_1(t), f_2(t)) + vec(e^t, 0) $

  *(a)* Er systemet homogent eller inhomogent?

  *Svar:* Inhomogent, da $q_1(t) = e^t eq.not 0$.

  *(b)* Er $(f_1(t), f_2(t)) = (e^(2t), 0)$ en løsning?

  *Svar:*
  $ vec(f'_1(t), f'_2(t)) = vec(2e^(2t), 0) $
  $ mat(2, 1; 0, 2) vec(e^(2t), 0) + vec(e^t, 0) = vec(2e^(2t) + e^t, 0) eq.not vec(2e^(2t), 0) $
  Nej, det er *ikke* en løsning.

  *(c)* Er $(f_1(t), f_2(t)) = (-e^t, 0)$ en løsning?

  *Svar:*
  $ vec(f'_1(t), f'_2(t)) = vec(-e^t, 0) $
  $ mat(2, 1; 0, 2) vec(-e^t, 0) + vec(e^t, 0) = vec(-2e^t + e^t, 0) = vec(-e^t, 0) $
  Ja, det er en *partikulær løsning*.
]

== Struktur af løsninger

#theorem(
  title: "13.2.1 - Struktur af løsninger til inhomogene systemer",
)[
  Lad et inhomogent system af ODE'er som i @eq:system_ode være givet, og antag at $(g_1(t), ..., g_n(t))$ er en partikulær løsning.

  Da er enhver anden løsning $(tilde(g)_1(t), ..., tilde(g)_n(t))$ på formen:
  $ vec(tilde(g)_1(t), dots.v, tilde(g)_n(t)) = vec(g_1(t), dots.v, g_n(t)) + vec(f_1(t), dots.v, f_n(t)) $

  hvor $(f_1(t), ..., f_n(t))$ er en løsning til det *homogene* system:
  $ vec(f'_1(t), dots.v, f'_n(t)) = bold(A) dot vec(f_1(t), dots.v, f_n(t)) $ <eq:homogeneous_system>
]

#note-box[
  *Algoritmisk betydning:*

  For at løse et inhomogent system skal man:
  1. Finde én partikulær løsning
  2. Finde alle løsninger til det tilsvarende homogene system
  3. Addere dem sammen
]

== Fuldstændig løsning til systemer

#definition(
  title: "13.2.2 - Fuldstændig løsning til systemer",
)[
  Lad $bold(A) in RR^(n times n)$ være givet.

  Den *fuldstændige løsning* til det homogene system @eq:homogeneous_system er et udtryk på formen:
  $ c_1 dot bold(v)_1 + dots.c + c_n dot bold(v)_n, quad c_1, ..., c_n in RR $
  hvor $(bold(v)_1, ..., bold(v)_n)$ er en ordnet basis for kernen af den lineære afbildning $L_bold(A): C_infinity (RR)^n -> C_infinity (RR)^n$ defineret ved:
  $ L_bold(A) (vec(f_1(t), dots.v, f_n(t))) = vec(f'_1(t), dots.v, f'_n(t)) - bold(A) dot vec(f_1(t), dots.v, f_n(t)) $

  For et inhomogent system med partikulær løsning $bold(v)_p = (g_1(t), ..., g_n(t))$ er den fuldstændige løsning:
  $ bold(v)_p + c_1 dot bold(v)_1 + dots.c + c_n dot bold(v)_n, quad c_1, ..., c_n in RR $
]

#important[
  Løsningsmængden til et homogent system er et *vektorrum* over $RR$ med dimension $n$. For at beskrive alle løsninger er det nok at finde $n$ lineært uafhængige løsninger (en basis).
]

= Egenvektormetoden

== Hovedresultat: Egenvektorer giver løsninger

#lemma(
  name: "13.2.2 - Egenvektorer giver løsninger",
)[
  Lad $bold(A) in RR^(n times n)$ være en matrix, og antag at $bold(v) = (v_1, ..., v_n) in RR^n$ er en egenvektor for $bold(A)$ med egenværdi $lambda in RR$.

  Da opfylder vektoren af funktioner:
  $ vec(f_1(t), dots.v, f_n(t)) = vec(v_1 e^(lambda t), dots.v, v_n e^(lambda t)) $

  det homogene system:
  $ vec(f'_1(t), dots.v, f'_n(t)) = bold(A) dot vec(f_1(t), dots.v, f_n(t)) $
]

#proof()[
  På den ene side:
  $ vec(f'_1(t), dots.v, f'_n(t)) = vec(v_1 lambda e^(lambda t), dots.v, v_n lambda e^(lambda t)) = lambda vec(v_1 e^(lambda t), dots.v, v_n e^(lambda t)) = lambda vec(f_1(t), dots.v, f_n(t)) $

  På den anden side:
  $ bold(A) dot vec(f_1(t), dots.v, f_n(t)) = bold(A) dot vec(v_1, dots.v, v_n) dot e^(lambda t) = lambda vec(v_1, dots.v, v_n) dot e^(lambda t) = lambda vec(f_1(t), dots.v, f_n(t)) $
]

#example(
  title: "13.2.2 - Find løsning via egenvektorer",
)[
  Lad $bold(A) = mat(2, 1; 0, 2)$. Find en løsning til det homogene system med koefficientmatrix $bold(A)$.

  *Svar:* Karakteristisk polynomium: $p_bold(A)(Z) = det(bold(A) - Z bold(I)_2) = (2 - Z)^2$

  Eneste egenværdi: $lambda = 2$.

  Egenrum: $ker(bold(A) - 2 bold(I)_2) = ker mat(0, 1; 0, 0)$ har basis ${vec(1, 0)}$.

  Ifølge Lemma 13.2.2 er
  $ vec(f_1(t), f_2(t)) = vec(1 dot e^(2t), 0 dot e^(2t)) = vec(e^(2t), 0) $
  en løsning.
]

== Diagonalisérbare matricer

#theorem(
  title: "13.2.3 - Løsning for diagonalisérbare matricer",
)[
  Antag at $bold(A) in RR^(n times n)$ er en diagonalisérbar matrix. Lad $bold(Q)$ være en invertibel matrix, således at $bold(Q)^(-1) dot bold(A) dot bold(Q)$ er diagonalmatricen med egenværdierne $lambda_1, ..., lambda_n$ i sin diagonal.

  Det homogene system har den fuldstændige løsning:
  $ vec(f_1(t), dots.v, f_n(t)) = bold(Q) dot vec(c_1 dot e^(lambda_1 t), c_2 dot e^(lambda_2 t), dots.v, c_n dot e^(lambda_n t)), quad c_1, ..., c_n in RR $
]

#corollary(
  name: "13.2.4 - Alternativ formulering",
)[
  Antag at $bold(A) in RR^(n times n)$ er en diagonalisérbar matrix. Lad $(bold(v)_1, ..., bold(v)_n)$ være en ordnet basis for $RR^n$ bestående af egenvektorer for $bold(A)$, der svarer til egenværdierne $lambda_1, ..., lambda_n$.

  Det homogene system har den fuldstændige løsning:
  $ c_1 dot bold(v)_1 e^(lambda_1 t) + dots.c + c_n dot bold(v)_n e^(lambda_n t), quad c_1, ..., c_n in RR $
]

#note-box[
  Sætning 13.2.3 og Korollar 13.2.4 tillader at egenværdier optræder flere gange (algebraisk multiplicitet > 1), men kræver at matricen $bold(A)$ er diagonalisérbar (algebraisk = geometrisk multiplicitet for alle egenværdier).
]

#example(
  title: "13.2.3 - Fuldstændig løsning",
)[
  Lad $bold(A) = mat(2, 0, 0, 0; 0, 2, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0)$.

  Karakteristisk polynomium: $p_bold(A)(Z) = (Z - 2)^2 (Z^2 - 1) = (Z - 2)^2 (Z - 1)(Z + 1)$

  Egenværdier: $lambda = 2$ (multiplicitet 2), $lambda = 1$, $lambda = -1$.

  Baser for egenrum:
  $ E_2: {vec(1, 0, 0, 0), vec(0, 1, 0, 0)}, quad E_1: {vec(0, 0, 1, 1)}, quad E_(-1): {vec(0, 0, 1, -1)} $

  Fuldstændig løsning:
  $ vec(f_1(t), f_2(t), f_3(t), f_4(t)) = c_1 vec(1, 0, 0, 0) e^(2t) + c_2 vec(0, 1, 0, 0) e^(2t) + c_3 vec(0, 0, 1, 1) e^t + c_4 vec(0, 0, 1, -1) e^(-t) $

  $ = vec(c_1 e^(2t), c_2 e^(2t), c_3 e^t + c_4 e^(-t), c_3 e^t - c_4 e^(-t)) $
]

== Begyndelsesværdiproblemer for systemer

#definition(
  title: "13.2.3 - Begyndelsesværdibetingelser for systemer",
)[
  Givet reelle funktioner $f_1(t), ..., f_n(t)$, et reelt tal $t_0$ og reelle tal $y_1, ..., y_n$, således at $f_i(t_0) = y_i$ for $i = 1, ..., n$.

  Da siges funktionerne at opfylde *begyndelsesværdibetingelserne* $f_i(t_0) = y_i$ for $i = 1, ..., n$.
]

#note-box[
  Systemet @eq:homogeneous_system har *netop én løsning* der opfylder givne begyndelsesværdibetingelser.

  *Strategi:*
  1. Find den fuldstændige løsning med parametre $c_1, ..., c_n$
  2. Indsæt $t = t_0$ og løs for $c_1, ..., c_n$
]

#example(
  title: "13.2.4 - Begyndelsesværdiproblem",
)[
  Fra Eksempel 13.2.3 har vi den fuldstændige løsning. Find løsningen der opfylder:
  $ f_1(0) = 1, quad f_2(0) = 2, quad f_3(0) = 3, quad f_4(0) = 4 $

  *Svar:* Indsæt $t = 0$:
  $ vec(c_1, c_2, c_3 + c_4, c_3 - c_4) = vec(1, 2, 3, 4) $

  Løs systemet:
  $ c_1 = 1, quad c_2 = 2, quad c_3 = 7/2, quad c_4 = -1/2 $

  Løsning:
  $ vec(f_1(t), f_2(t), f_3(t), f_4(t)) = vec(e^(2t), 2e^(2t), (7e^t - e^(-t))/2, (7e^t + e^(-t))/2) $
]

= Fremgangsmetoder

== Verificering af løsning til ODE

*Givet:* En ODE $F(f'(t), f(t), t) = 0$ og en kandidatfunktion $f(t)$.

*Fremgangsmåde:*
1. Beregn $f'(t)$ (og evt. højere afledte hvis nødvendigt)
2. Indsæt $f(t)$ og $f'(t)$ i ODE'en
3. Forenkel udtrykket
4. Hvis resultatet er $0$ for alle $t$: Ja, det er en løsning
5. Hvis resultatet $eq.not 0$: Nej, det er ikke en løsning

== Lineær førsteordens ODE med Sætning 13.1.1

*Givet:* ODE på formen $f'(t) = a(t) f(t) + q(t)$

*Fremgangsmåde:*
1. Identificér $a(t)$ og $q(t)$ fra ODE'en
2. Find stamfunktion $P(t)$ til $a(t)$, dvs. $P'(t) = a(t)$
3. Beregn integralet $integral e^(-P(t)) q(t) dif t$ (husk integrationskonstant $c$!)
4. Den fuldstændige løsning er:
$ f(t) = e^(P(t)) integral e^(-P(t)) q(t) dif t $

*Særtilfælde:* Hvis $a(t) = a_0$ er konstant:
- $P(t) = a_0 t$
- Løsning: $f(t) = c dot e^(a_0 t) + e^(a_0 t) Q(t)$ hvor $Q(t)$ er stamfunktion til $e^(-a_0 t) q(t)$

== Begyndelsesværdiproblem (enkelt ODE)

*Givet:* ODE med begyndelsesbetingelse $f(t_0) = y_0$

*Fremgangsmåde:*
1. Find den fuldstændige løsning $f(t) = ...$ (med parameter $c$)
2. Indsæt $t = t_0$ i den fuldstændige løsning
3. Sæt $f(t_0) = y_0$ og løs for $c$
4. Indsæt værdien af $c$ i den fuldstændige løsning

== Homogent system via egenvektormetoden

*Givet:* System $bold(f)'(t) = bold(A) dot bold(f)(t)$ hvor $bold(A) in RR^(n times n)$ er diagonalisérbar.

*Fremgangsmåde:*
1. Find det karakteristiske polynomium: $p_bold(A)(Z) = det(bold(A) - Z bold(I)_n)$
2. Find egenværdierne $lambda_1, ..., lambda_r$ (rødderne i $p_bold(A)(Z) = 0$)
3. For hver egenværdi $lambda_i$: Find en basis for egenrummet $E_(lambda_i) = ker(bold(A) - lambda_i bold(I)_n)$
4. Tjek at $bold(A)$ er diagonalisérbar: $sum_i "gm"(lambda_i) = n$
5. Den fuldstændige løsning er (Korollar 13.2.4):
$ bold(f)(t) = c_1 bold(v)_1 e^(lambda_1 t) + c_2 bold(v)_2 e^(lambda_2 t) + dots.c + c_n bold(v)_n e^(lambda_n t) $
hvor $bold(v)_i$ er egenvektorer og $c_i in RR$.

== Inhomogent system

*Givet:* System $bold(f)'(t) = bold(A) dot bold(f)(t) + bold(q)(t)$

*Fremgangsmåde:*
1. Find den fuldstændige løsning $bold(f)_h (t)$ til det *homogene* system $bold(f)'(t) = bold(A) dot bold(f)(t)$ (brug egenvektormetoden)
2. Find *én* partikulær løsning $bold(f)_p (t)$ til det inhomogene system
   - Hvis $bold(q)(t)$ er konstant: Prøv ansatz $bold(f)_p = vec(a, b, dots.v)$ (konstant vektor)
   - Indsæt i ODE'en og løs for $a, b, ...$
3. Den fuldstændige løsning er:
$ bold(f)(t) = bold(f)_p (t) + bold(f)_h (t) $

*For konstant $bold(q)$:* Hvis $bold(A)$ er invertibel, så er $bold(f)_p = -bold(A)^(-1) bold(q)$.

== Begyndelsesværdiproblem for systemer

*Givet:* System med begyndelsesbetingelser $bold(f)(t_0) = bold(y)_0$

*Fremgangsmåde:*
1. Find den fuldstændige løsning med parametre $c_1, ..., c_n$
2. Indsæt $t = t_0$ i den fuldstændige løsning
3. Sæt $bold(f)(t_0) = bold(y)_0$ og løs det lineære ligningssystem for $c_1, ..., c_n$
4. Indsæt værdierne af $c_1, ..., c_n$ i den fuldstændige løsning

== Ikke-diagonalisérbar koefficientmatrix

*Situation:* $bold(A)$ har gentagne egenværdier med $"gm" < "am"$, så egenvektormetoden giver ikke nok lineært uafhængige løsninger.

*Fremgangsmåde (for Jordan-blok med egenværdi $lambda$):*

For en $2 times 2$ Jordan-blok $mat(lambda, 1; 0, lambda)$:
- Løsning 1: $vec(e^(lambda t), 0)$
- Løsning 2: $vec(t e^(lambda t), e^(lambda t))$

For en $3 times 3$ Jordan-blok $mat(lambda, 1, 0; 0, lambda, 1; 0, 0, lambda)$:
- Løsning 1: $vec(e^(lambda t), 0, 0)$
- Løsning 2: $vec(t e^(lambda t), e^(lambda t), 0)$
- Løsning 3: $vec(1/2 t^2 e^(lambda t), t e^(lambda t), e^(lambda t))$

*Mønster:* Polynomier i $t$ ganget med $e^(lambda t)$.

= Opgaver -- Store Dag

== Opgave 1: En reel, ikke lineær differentialligning

Givet den reelle differentialligning $(f'(t))^2 - 4e^(2t) dot f(t) = 0$.

=== Spørgsmål a

Er funktionen $f(t) = t$ løsning til differentialligningen?

#solution()[

]

=== Spørgsmål b

Er funktionen $f(t) = e^(2t)$ løsning til differentialligningen?

#solution()[

]

== Opgave 2: En reel, lineær differentialligning

I denne opgave undersøges den reelle differentialligning
$ f'(t) - 3f(t) = t $

=== Spørgsmål a

Det opgives at der findes reelle tal $a$ og $b$ sådan, at funktionen $a t + b$ er en løsning til differentialligningen. Find $a$ og $b$.

#math-hint[
  Indsæt funktionen $f(t) = a t + b$ i differentialligningen og undersøg hvad $a$ og $b$ skal opfylde for at funktionen er en løsning.
]

#solution()[

]

=== Spørgsmål b

Find den fuldstændige løsning til den reelle differentialligning $f'(t) - 3f(t) = 0$.

#solution()[

]

=== Spørgsmål c

Brug svarene fra de forrige spørgsmål til at finde den fuldstændige løsning for den reelle differentialligning $f'(t) - 3f(t) = t$.

#solution()[

]

== Opgave 3: Begyndelsesbetingelser

Den fuldstændige løsning til den reelle differentialligning $f'(t) = e^t dot f(t)$ er givet ved $f(t) = c dot e^((e^t))$, hvor $c in RR$.

=== Spørgsmål a

Tjek ved indsættelse i den givne differentialligning at $f(t) = 3 dot e^((e^t))$ er en løsning.

#solution()[

]

=== Spørgsmål b

Find løsningen til den givne differentialligning som opfylder begyndelsesbetingelsen $f(0) = 1$.

#math-hint[
  Fordi den fuldstændige løsning er givet ved $f(t) = c dot e^((e^t))$, skal man prøve at bestemme en værdi for $c$ således at begyndelsesbetingelsen er opfyldt.
]

#solution()[

]

== Opgave 4: Et homogent, reelt system af lineære differentialligninger

Et lineært, reelt differentialligningssystem med konstante koefficienter er givet således:
$ vec(f'_1(t), f'_2(t)) = mat(1, 8; 1, -1) dot vec(f_1(t), f_2(t)) $

=== Spørgsmål a

Find koefficientmatricens egenværdier og tilhørende egenrum, og opstil ved hjælp heraf den fuldstændige løsning til det givne differentialligningssystem.

#solution()[

]

=== Spørgsmål b

Find løsningen til det givne differentialligningssystem som opfylder $f_1(0) = 0$ og $f_2(0) = 3$.

#math-hint[
  Fra spørgsmål a vides hvordan den fuldstændige løsning ser ud. Indsættes $t = 0$ i denne fuldstændige løsning, så fås en betingelse som konstanterne $c_1$ og $c_2$ skal opfylde.
]

#solution()[

]

== Opgave 5: Et andet homogent, reelt system af lineære differentialligninger

Givet følgende reelle system af differentialligninger:
$
  cases(
    f'_1(t) = 8 f_1(t) + 5 f_2(t),
    f'_2(t) = -10 f_1(t) - 7 f_2(t)
  )
$

=== Spørgsmål a

Find en matrix $bold(A)$ og funktioner $q_1(t)$ og $q_2(t)$ således at
$ vec(f'_1(t), f'_2(t)) = bold(A) dot vec(f_1(t), f_2(t)) + vec(q_1(t), q_2(t)) $

Er systemet homogent eller inhomogent?

#solution()[

]

=== Spørgsmål b

Det oplyses at matricen
$ bold(A) = mat(8, 5; -10, -7) $
har egenværdier $-2$ og $3$ og egenrum
$ E_(-2) = op("span")(vec(-1/2, 1)) quad "og" quad E_3 = op("span")(vec(-1, 1)) $

Nogen påstår at den fuldstændige løsning til det givne reelle system af differentialligninger er
$ vec(f_1(t), f_2(t)) = c_1 dot vec(1, -2) dot e^(-2t) + c_2 dot vec(1, -1) dot e^(3t), quad "hvor" c_1, c_2 in RR $

Er den påståede fuldstændige løsning korrekt?

#math-hint[
  Bruges Korollar 13.2.4 og de givne oplysninger, så fås at den fuldstændige løsning er
  $ vec(f_1(t), f_2(t)) = c_1 dot vec(-1/2, 1) dot e^(-2t) + c_2 dot vec(-1, 1) dot e^(3t), quad "hvor" c_1, c_2 in RR $
  Udtrykker denne fuldstændige løsning andre løsninger end den påståede fuldstændige løsning når $c_1$ og $c_2$ vælges frit fra $RR$?
]

#solution()[

]

== Opgave 6: Et inhomogent, reelt system af lineære differentialligninger

Givet følgende reelle system af differentialligninger:
$
  cases(
    f'_1(t) = 8 f_1(t) + 5 f_2(t) + 3,
    f'_2(t) = -10 f_1(t) - 7 f_2(t) + 1
  )
$

=== Spørgsmål a

Tjek at det tilhørende homogene system af differentialligninger er systemet givet i Opgave 5.

#solution()[

]

=== Spørgsmål b

Det oplyses at der findes reelle tal $a$ og $b$ således at de konstante funktioner $f_1(t) = a$ og $f_2(t) = b$ danner en partikulær løsning til det givne inhomogene system. Beregn nu $a$ og $b$.

#math-hint[
  Indsæt funktionerne $f_1(t) = a$ og $f_2(t) = b$ i systemet. Hvad skal $a$ og $b$ opfylde?
]

#math-hint[
  Betegnes med $bold(A)$ matricen fra Opgave 5, så fås at $a$ og $b$ skal opfylde
  $ vec(0, 0) = bold(A) dot vec(a, b) + vec(3, 1) $
  $bold(A)^(-1)$ beregnes nemmest ved at bruge formlen fra Eksempel 8.1.3 i lærebogen.
]

#solution()[

]

=== Spørgsmål c

Find den fuldstændige løsning til det givne inhomogene, reelle system af differentialligninger.

#math-hint[
  Definition 13.2.2 og resultaterne fra de forrige spørgsmål kan bruges her.
]

#solution()[

]

== Opgave 7: Begyndelsesbetingelser i et system af lineære differentialligninger

Der betragtes det samme inhomogene, reelle system af differentialligninger som i Opgave 6. Beregn løsningen til systemet som opfylder begyndelsesbetingelserne
$ vec(f_1(0), f_2(0)) = vec(2/3, 1/3) $

#solution()[

]

== Opgave 8: Panserformlen

Givet den reelle differentialligning $f'(t) + f(t)/t = 3t$. Det antages $t > 0$.

=== Spørgsmål a

Find differentialligningens fuldstændige løsning.

#math-hint[
  Differentialligningen kan omskrives til $f'(t) = (-1)/t dot f(t) + 3t$. Derfor kan Sætning 13.1.1 fra lærebogen bruges.
]

#math-hint[
  Det forrige hint medfører at man kan bruge Sætning 13.1.1 med $a(t) = -1/t$ og $q(t) = 3t$. I Eksempel 13.1.2 fra lærebogen gennemgås et eksempel hvor $a(t) = -1/t$ ligesom her.
]

#solution()[

]

=== Spørgsmål b

Find den løsning til differentialligningen som opfylder begyndelsesbetingelsen $f(1) = 5$.

#solution()[

]

== Opgave 9: En drilsk koefficientmatrix

Lad $lambda$ være et reelt tal og betragt følgende reelle differentialligningssystem:
$ vec(f'_1(t), f'_2(t), f'_3(t)) = mat(lambda, 1, 0; 0, lambda, 1; 0, 0, lambda) dot vec(f_1(t), f_2(t), f_3(t)) $

Hvad er systemets fuldstændige løsning?

#math-hint[
  De sædvanlige metoder virker ikke, fordi koefficientmatricen har én egenværdi $lambda$, som har algebraisk multiplicitet $3$ og geometrisk multiplicitet $1$. Prøv i stedet for at hente inspiration fra Eksempel 13.2.7 i lærebogen.
]

#math-hint[
  At følgende to vektorer er løsninger kan vises på lignende måde som i Eksempel 13.2.7:
  $ vec(f_1(t), f_2(t), f_3(t)) = vec(e^(lambda t), 0, 0) quad "og" quad vec(f_1(t), f_2(t), f_3(t)) = vec(t e^(lambda t), e^(lambda t), 0) $
  Der mangler nu én løsning, lineært uafhængig af de forrige to, til at finde den fuldstændige løsning.
]

#math-hint[
  Prøv at finde en løsning på formen
  $ vec(f_1(t), f_2(t), f_3(t)) = vec(a t^2 e^(lambda t), t e^(lambda t), e^(lambda t)) $
  hvor $a in RR$.
]

#solution()[

]
