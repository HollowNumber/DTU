#import "@local/dtu-template:0.6.3":*
#import "@preview/unify:0.8.1": qty, unit, num, numrange, qtyrange
#import "@preview/callisto:0.2.5"
#import "@preview/mitex:0.2.7": mitex
#import "@preview/cmarker:0.1.8"
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4"
#import "@preview/physica:0.9.8": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#codly(languages: codly-languages)
#show: codly-init.with()
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)
#show raw: set text(font: "Liga SFMono Nerd Font", ligatures: true)

#show: dtu-note.with(
  course: "02403",
  course-name: "Introduction to mathematical statistics",
  title: "Lecture - June 16, 2026",
  date: datetime(year: 2026, month: 6, day: 16),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

= Lecture 7
== Assumptions and how to check them

Using the t-test we assume that $Y_i tilde N(mu, sigma^2)$ and iid., i.e. we in general need check:

- The distribution assumption
- The independence assumption
- The indentical distribution assumption

ie.
+ check the distribution of the data against the assumed distribution (the normal)
+ should be checked if there is an ordering in data
+ will be discussed later in the course

=== The distribution assumption
The distribution assumption can be checked by:

- Compare the histogram with the relevant density
- Compare den empirical distribution and the expected distribution
- Compare expected and empirical quantiles (QQ-plot)

/ The normal qq-plot:
The ordered observations $y_((1)),dots,y_((n))$ are plotted against a set of normal quantiles $z_(p 1),dots,z_(p n)$ where different choices of $p_i$ are possible, the simplest being:

$
  p_i = (i-0.5)/n, quad i = 1,...,n
$
points should be on a straight line.

#example()[
  $
    Y = X beta + xi, quad xi tilde N(0, sigma^2 I)
  $

  $
    n   &= 15 \
    p_1 &= v_2/5 &&= 1/10 \
    p_2 &=       &&= 3/10 \
    p_3 &=       &&= 5/10 \
  $

  // TODO: make it make sense and finish

]

=== The independence assumption
In general difficult to check, but if data are taken as a time series then serial correlation should be checked by:

- Plot $y_(t+1)$ against $y_(t)$ (should appear random)
- Check the observed correlation between $y_(t+1)$ and $y_(t)$ (should be close to zero) (check lag-1-autocorr)

the way this is done is by finding the lag-1-autocorrelation, and multipliplying by the sqaure root of the sample size, and check if this is close to zero (should be less than 2 in absolute value).

- If there is a high temporal correlation, it should be included in the model (not covered in this course)

#example(
  )[
  $hat(p)(1) = "Cor"(y_t,y_(t+1))$;

  $
    Y_1 = [y_1,dots,y_(n-1)] \
    Y_2 = [y_2,dots,y_n]
    r_(1,2) = "Cor"(Y_1,Y_2)
  $

  where $r_(1,2)$ is the correlation between $Y_1$ and $Y_2$, and should be close to zero if the independence assumption holds.

  let's say $r_(1,2)$ in this case is $0.25$

  // TODO: finish example

]

== Two sample t-test
=== Pooled variance set up
Let $Y_(1,1),dots,Y_(1,n_1), quad Y_(1,i) tilde N(mu_1, sigma^2)$ and $Y_(2,1),dots,Y_(2,n_2), quad Y_(2,i) tilde N(mu_2, sigma^2)$ with test hypothesis $mu_1 - mu_2 = delta_0$ We will consider the test statistics:
$
  T = (overline(Y)_1 - overline(Y)_2 - delta_0) / (S_(overline(Y)_1 - overline(Y)_2))
$

In an informal way we can write this as:
$
  T = ("observation" - "hypothesis")/("standard deviation under assumptions")
$

We need to establish the distribution of T.

// holy shit he skipped a lot, check page 13, and 14 and add.

// also add CI from page 15

#example()[
  $
    overline(y)_1 &= 1250, quad overline(y)_2                                        &&= 1300 \
    s_1           &= 54.24, quad s_2                                                 &&= 28.54 \
    S^2_p         &= ((n_1 - 1) dot 54.24^2 + (n_2 - 1) dot 28.54^2)/(n_1 + n_2 - 2) &&= 46.3^2
  $

  ......

  $"CI" = [-50.93, -49.06]$

  ...

  $
    t_"obs" = (-50-(-50))/(S_p sqrt(1/n_1 + 1/n_2)) = 0
  $

  therefore we accept $H_0$

  Assumption $sigma_1^2 = sigma_2^2$

  something something:

  $
    F_"obs" &= (S_2^)2/(S_1^2) tilde F(m_2 -1,n_1 - 1) \
      &= 54.24^2/28.54^2 = 3.6
  $
]

=== Welch set up
==== Pools vs. Welch, Variance version
The Welch t-test have fewer assumption and is therefore usually preferred.

- if $s^2_1 = s^2_2$, the Welch and the Pooled test statistics are the same.
- Only when the two variances become really different the two test-statistics may differ in any important way, and if this is the case, we would not tend to favour the pooled version, since the assumption of equal variances appears questionable then.
- Only for cases with a small sample sizes in at least one of the two groups the pooled approach may provide slightly higher power if you believe in the equal variance assumption. And for these cases the Welch approach is then a somewhat cautious approach.

==== Overlapping confidence intervals
We are given two 95% confidence intervals:
$
  "CI"_1 = [0,4] \
  "CI"_2 = [3,7]
$
each based on $n = 100$ observations.

- using confidence level $alpha = 0.05$ is there a difference in mean between the two groups?

$
  overline(y)_1 = 2,
  overline(y)_2 = 5, \
  overline(y)_1 - overline(y)_2 = 3 \
  "CI"_1: overline(y)_1 plus.minus t_(0.975) // idk what the fuck this guy is wriging
  \
  4 = (2 dot 2)/10 5 \ // can't tell if it's an
  s_1 approx 10,
  s_2 approx 10,
$

so,ething something $s^2_p$ something something $"CI"_(y_1 dot y_2)$???

// TODO: rest of notes
== Checking assumptions

== Two sample $t$-test as an LM

== The paired $t$-test

== Planning: Sample size and power


#let _nb-json = json("notebooks/2026-06-16-02403-lecture.ipynb")
#let _nb-lang = _nb-json.metadata.language_info.name
#let _nb = callisto.config(nb: _nb-json)

#{
  let cells = (_nb.cells)()
  let in-args = (lang: _nb-lang, raw-lang: none)
  let i = 0
  while i < cells.len() {
    let cell = cells.at(i)
    if cell.cell_type == "markdown" {
      let parts = cell.source.split("\n\n**Solution:**")
      if parts.len() >= 2 {
        block(width: 100%, spacing: 1em, callisto.read-mime(parts.at(0), format: "text/markdown"))
        let sol = (callisto.read-mime(parts.slice(1).join("\n\n**Solution:**"), format: "text/markdown"),)
        i += 1
        while i < cells.len() and cells.at(i).cell_type == "code" {
          let c = cells.at(i)
          let code-part = {
            callisto.templates.notebook-input(c, input-args: in-args)
            callisto.templates.notebook-output(c, output-args: (:))
          }
          sol = sol + (code-part,)
          i += 1
        }
        solution(sol.join())
      } else {
        block(width: 100%, spacing: 1em, callisto.read-mime(cell.source, format: "text/markdown"))
        i += 1
      }
    } else if cell.cell_type == "code" {
      callisto.templates.notebook-input(cell, input-args: in-args)
      callisto.templates.notebook-output(cell, output-args: (:))
      i += 1
    } else {
      i += 1
    }
  }
}
