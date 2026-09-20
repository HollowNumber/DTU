#import "@local/dtu-template:0.6.3": *
#import "@preview/unify:0.8.1": num, numrange, qty, qtyrange, unit
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

#show: dtu-note.with(
  course: "02403",
  course-name: "Introduction to mathematical statistics",
  title: "Lecture - June 22, 2026",
  date: datetime(year: 2026, month: 6, day: 22),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

= Lecture 11

== Introduction and Example

=== one-way ANOVA vs. two-way ANOVA
/ one-way: $Y_(i j) = mu + alpha_i + epsilon_(i j), quad epsilon_(i j) tilde N(0, sigma^2)$
/ two-way: $Y_(i j) = mu + alpha_i + beta_j + (alpha beta)_(i j) + epsilon_(i j), quad epsilon_(i j) tilde N(0, sigma^2)$

== The Model

== Computation: Variance Decomposition and ANOVA Table

== Hypothesis Testing (F-test)

== Model Diagnostics

== Post Hoc Comparisons

== The general linear model, generalizatons

