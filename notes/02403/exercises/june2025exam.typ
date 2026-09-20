#set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm), numbering: "1", header: context [
  #set text(9pt)
  Technical University of Denmark
  #h(1fr)
  Page #counter(page).display() of #counter(page).final().first() pages.
])

#set text(font: "Georgia", size: 12pt, lang: "en")

#set par(justify: true, leading: 0.65em)

// Style for exercise boxes
#let exercise-box(title) = block(
  width: 100%,
  inset: (x: 6pt, y: 5pt),
  stroke: (left: 1.5pt + black),
  fill: luma(240),
)[#text(weight: "bold")[#title]]

// Style for question headings
#let question-heading(label) = [
  #v(0.8em)
  *#label*
  #v(0.3em)
]

// Hollow circle for answer options
#let circle = $circle.stroked.small$

// Answer option macro
#let opt(n, body) = [
  #grid(
    columns: (1.4em, 1fr),
    gutter: 0pt,
    align: (right + top, left + top),
    [#n $circle$], [#body],
  )
  #v(0.35em)
]

#align(center)[
  #text(size: 14pt, weight: "bold")[Exam Question Paper]

  #v(0.5em)

  #text(size: 12pt)[Written Examination: 26 June 2025]

  #v(0.3em)

  *Course name and number:* 02403 Introduction to Mathematical Statistics

  #v(0.3em)

  *Duration:* 4 hours

  #v(0.3em)

  *Aids allowed:* All printed aids plus pocket calculator model TI30XS or TI30XB
]

#v(1em)

The final answers should be handed in by filling out a separate *"Answer Sheet"*.

This exam consists of *30 questions* of the "multiple choice" type, which are divided between *14 exercises*.

Only hand in the *"Answer Sheet"* and not the entire question paper.

*Multiple choice questions:* Note that in each question, one and only one of the answer options is correct. Furthermore, not all the suggested answers are necessarily meaningful. Always remember to round off your own result to the number of decimals given in the answer options before you choose your answer.

#pagebreak()

// ============================================================
// EXERCISE I
// ============================================================

#exercise-box[Exercise I]

#v(0.5em)

An engineer wants to test whether a new alloy has a tensile strength with a mean value of 500 MPa. A random sample of 30 specimens is tested, which gives a sample mean of 510 MPa and a sample standard deviation of 20 MPa. It is assumed that the observations are iid and normally distributed.

#question-heading[Question I.1 (1)]

What is the corresponding p-value for the relevant hypothesis test with the following hypotheses: $H_0 : mu = 500$, $H_A : mu eq.not 500$?

To solve this exercise you may need the following quantiles from the $t$-distribution with $nu = 29$ degrees of freedom:

$ t_(0.99)(29) = 2.462, quad t_(0.995)(29) = 2.756, quad t_(0.9975)(29) = 3.038 $

#opt[1][$p = 0.010$]
#opt[2][$p = 0.621$]
#opt[3][$p = 0.310$]
#opt[4][$p = 0.006$]
#opt[5][$p = 0.005$]

We have $"std" = 20$, $mu = 510$, $overline(x) = 500$, and $n=30$.



#v(0.5em)

The engineer is now planning a new experiment where he wants to achieve a "margin of error" of at most 2 MPa. He uses the observed standard deviation as a scenario and a significance level of $alpha = 0.05$.

#question-heading[Question I.2 (2)]

What sample size should be taken to achieve a "margin of error" of at most 2 MPa?

To solve this exercise you may need the following quantile from the standard normal distribution: $z_(0.975) = 1.96$.

#opt[1][approx. 20 observations]
#opt[2][approx. 40 observations]
#opt[3][approx. 1538 observations]
#opt[4][approx. 16 observations]
#opt[5][approx. 385 observations]


#pagebreak()

// ============================================================
// EXERCISE II
// ============================================================

#exercise-box[Exercise II]

#v(0.5em)

A coach wants to investigate whether there is a difference between different types of targeted training in terms of improving the time it takes to run up stairs. The coach collects data from 15 participants, who are (randomly) divided into three equally sized groups: Group A, Group B, and Group C. The coach has the participants perform targeted exercises over the next 4 weeks. Participants in the same group do the same exercises, but the coach assigns different exercises to the three groups. For each participant, data is collected on the improvement in the time it takes them to run up a staircase at the gym (the time improvement is measured in seconds).

The observed time improvements are:

#v(0.5em)

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (left, center),
    stroke: 0.5pt,
    inset: 8pt,
    table.header([*Group*], [*Time improvement (seconds)*]),
    [A], [2.1, 2.5, 2.3, 2.4, 2.2],
    [B], [2.8, 2.9, 2.7, 3.0, 2.6],
    [C], [2.3, 2.4, 2.5, 2.2, 2.1],
  )
]

#v(0.5em)

The average time improvement for all 15 participants is $hat(mu) = 2.467$, and the average time improvements within each group are given by: $hat(mu)_A = 2.30$, $hat(mu)_B = 2.80$, $hat(mu)_C = 2.30$. It can be assumed that all observations are independent and normally distributed.

#question-heading[Question II.1 (3)]

What is the most appropriate statistical model and analysis when one wishes to examine whether there is a difference in the effect of the different types of training?

#opt[1][
  An appropriate model could be $Y_(i j) = mu + alpha_i + epsilon_(i j)$ ($epsilon_(i j) ~ N(0, sigma^2)$), where $Y_(i j)$ is the time improvement of person number $j$ in group number $i$. A relevant analysis would then be to perform a t-test that tests the null hypothesis $H_0 : mu = 0$.
]
#opt[2][
  An appropriate model could be $Y_i = beta_0 + beta_1 x_i + epsilon_i$ ($epsilon_i ~ N(0, sigma^2)$), where $x_i$ is the time improvement of person number $i$. A relevant analysis would then be to perform a t-test that tests the null hypothesis $H_0 : beta_1 = 0$.
]
#opt[3][
  An appropriate model could be $Y_(i j) = mu_i + epsilon_(i j)$ ($epsilon_(i j) ~ N(0, sigma^2)$), where $Y_(i j)$ is the time improvement of person number $j$ in group number $i$. A relevant analysis would then be to perform an analysis of variance that tests the null hypothesis $H_0 : mu_A = mu_B = mu_C = 0$.
]
#opt[4][
  An appropriate model could be $Y_(i j) = beta_0 + beta_i x_(i j) + epsilon_(i j)$ ($epsilon_(i j) ~ N(0, sigma^2)$), where $x_(i j)$ is the time improvement of person number $j$ in group number $i$. A relevant analysis would then be an analysis of variance that tests the null hypothesis $H_0 : beta_i = 0$ (a total of 3 tests are performed — one for each group).
]
#opt[5][
  An appropriate model could be $Y_(i j) = mu + alpha_i + epsilon_(i j)$ ($epsilon_(i j) ~ N(0, sigma^2)$), where $Y_(i j)$ is the time improvement of person number $j$ in group number $i$. A relevant analysis would then be an analysis of variance that tests the null hypothesis $H_0 : alpha_A = alpha_B = alpha_C = 0$.
]


#pagebreak()

// ============================================================
// EXERCISE III
// ============================================================

#exercise-box[Exercise III]

#v(0.5em)

Assume that $Y$ follows an exponential distribution with $E(Y) = 3$.

#question-heading[Question III.1 (4)]

What is $P(2 < Y < 4)$?

You may use the following values: $e^(-2\/3) approx 0.5134$ and $e^(-4\/3) approx 0.2636$.

#opt[1][$0.49$]
#opt[2][$0.25$]
#opt[3][$0.61$]
#opt[4][$0.75$]
#opt[5][$0.0024$]


#pagebreak()

// ============================================================
// EXERCISE IV
// ============================================================

#exercise-box[Exercise IV]

#v(0.5em)

A pet store wants to investigate what proportion of Danish households have a dog. They conduct a survey among 1000 of their customers, asking whether they have a dog. The store assumes that these 1000 customers represent 1000 households. Of these, 320 respond that they have a dog.

#question-heading[Question IV.1 (5)]

What is the estimated proportion ($hat(p)$) of households that have a dog, and what is the uncertainty (standard error, $"se"_(hat(p))$) of this proportion?

#opt[1][$hat(p) = 0.32$ and $"se"_(hat(p)) = 0.00022$]
#opt[2][$hat(p) = 0.32$ and $"se"_(hat(p)) = 0.015$]
#opt[3][$hat(p) = 0.32$ and $"se"_(hat(p)) = 0.047$]
#opt[4][$hat(p) = 0.32$ and $"se"_(hat(p)) = 0.32$]
#opt[5][$hat(p) = 0.32$ and $"se"_(hat(p)) = 0.010$]

From the data we have:
$n=1000, x=320$

using formula 7.3 we get $hat(p)$:
$
  hat(p) = frac(x, n) = frac(320, 1000) = 0.32
$

using $hat(p)$ we get the se:
$
  "se"_(hat(p)) = sqrt(frac(hat(p)(1 - hat(p)), n)) = sqrt(frac(0.32(1 - 0.32), 1000)) = sqrt(frac(0.2176, 1000)) = sqrt(0.0002176) approx 0.01475 approx 0.015
$

therefore, the correct answer is *Option 2*.

#question-heading[Question IV.2 (6)]

Official figures indicate that about 20% of Danes have a dog. The pet store had therefore expected that their survey would result in a proportion closer to 0.20. Is it likely that their result — that as many as 32% of households have a dog — is due to random variation? And could it be true that the true proportion of Danish households with a dog is actually around 20%?

To solve this exercise you may use: $z_(0.975) = 1.96$.

#opt[1][Yes, the pet store has randomly selected a sample where more than expected have a dog. This is likely due to random variation, and the true proportion could well be around 20%.]
#opt[2][No, it is unlikely that the pet store's result is due to random variation. The p-value for the relevant test is 0.0015, so we would reject the null hypothesis that the true proportion is 0.20. Thus, we must conclude that the true proportion is probably not 20%.]
#opt[3][No, it is unlikely that the pet store's result is due to random variation. The p-value for the relevant test is 0.0015, so we would reject the null hypothesis that the true proportion is 0.20. However, it is doubtful whether the sample is representative, so the true proportion could still be 20%.]
#opt[4][No, it is unlikely that the pet store's result is due to random variation. The p-value for the relevant test is $2 dot 10^(-21)$, so we would reject the null hypothesis that the true proportion is 0.20. Since the sample is clearly representative, we must conclude that the true proportion of households with a dog is probably not 20%.]
#opt[5][No, it is unlikely that the pet store's result is due to random variation. The p-value for the relevant test is $2 dot 10^(-21)$, so we would reject the null hypothesis that the true proportion is 0.20. However, it is doubtful whether the sample is representative, so the true proportion could still be 20%.]

$
  z_"obs" = frac(hat(p) - p_0, sqrt(p_0(1-p_0)/n))
  = frac(0.32 - 0.20, sqrt(0.20 times 0.80 / 1000))
  = frac(0.12, 0.01265)
  = 9.49
$

Since $|z_"obs"| = 9.49 >> z_(0.975) = 1.96$, we reject $H_0: p = 0.20$ at
$alpha = 0.05$. The p-value is approximately $2 dot 10^(-21)$.


#pagebreak()

// ============================================================
// EXERCISE V
// ============================================================

#exercise-box[Exercise V]

#v(0.5em)

In a study, data from 4 different groups are available:

#v(0.3em)
- *Group 1:* 89, 102, 94, 90, 100
- *Group 2:* 78, 46, 65, 72, 69
- *Group 3:* 83, 89, 81, 89, 90
- *Group 4:* 82, 101, 93, 88, 104
#v(0.3em)

It can be assumed that the data can be described by the following model: $Y_(i j) = mu + alpha_i + epsilon_(i j)$, $epsilon_(i j) ~ N(0, sigma^2)$.

The group averages are $hat(mu)_1 = 95.0$, $hat(mu)_2 = 66.0$, $hat(mu)_3 = 86.4$, $hat(mu)_4 = 93.6$, and the overall average is $bar(y) = 85.25$. The total sum of squares is $"SST" = 3805.75$.

#question-heading[Question V.1 (7)]

What is the between group variation, $"MS"("Group")$, and the within group variation, $"MSE"$?

#opt[1][$"MS"("Group") = 190.3$ and $"MSE" = 1122$]
#opt[2][$"MS"("Group") = 894.5$ and $"MSE" = 70.15$]
#opt[3][$"MS"("Group") = 2683$ and $"MSE" = 1122$]
#opt[4][$"MS"("Group") = 894.5$ and $"MSE" = 2683$]
#opt[5][$"MS"("Group") = 190.3$ and $"MSE" = 70.15$]

n=20, k=4, SST=3805.75

first we find SS(tr):
$
  "SS"("tr") & = 5 [(95 - 85.25)^2 + (66 - 85.25)^2 + (86.4 - 85.25)^2 + (93.6 - 85.25)^2] \
             & = 5 [95.0625 + 370.5625 + 1.3225 + 69.7225] \
             & = 5 [536.665] = 2683.3
$

having SS(tr) we can find SSE:
$
  "SSE" = "SST" - "SS"("tr") = 3805.75 - 2683.3 = 1122.45
$

$
  "MS"("tr") = frac("SS"("tr"), k - 1) = frac(2683.3, 4 - 1) = frac(2683.3, 3) = 894.4 \
  "MSE" = frac("SSE", n - k) = frac(1122.45, 20 - 4) = frac(1122.45, 16) = 70.15
$

#question-heading[Question V.2 (8)]

Which statement about the model above is NOT correct?

#opt[1][$Y_(i j)$ is observation number $j$ in group number $i$. $hat(alpha)_i$ is group $i$'s average deviation from the overall mean $hat(mu)$.]
#opt[2][The total variance of the data (i.e. $frac(1, N-1) "SST"$) cannot be greater than $hat(sigma)^2$.]
#opt[3][$"MSE"$ represents the variance within each group, and since we assume it is the same across all groups, we also have $"MSE" = hat(sigma)^2$.]
#opt[4][If the variance of the $alpha_i$'s is large compared to the $"MSE"$, this means that there is a difference between the groups.]
#opt[5][In the data above (for Group 1, $i = 1$), we obtain $hat(alpha)_1 = 9.75$.]

Total variance = SST/(N-1) is always at least as large as MSE = SSE/(N-k), because SST = SS(Tr) + SSE, so SST ≥ SSE always. The statement says total variance cannot be greater than $hat(sigma)^2$ that's backwards.

therefore, the correct answer is *Option 2*.


#v(0.5em)

If we denote the observations from each group $y_i$ (e.g. $y_1 = [89 quad 102 quad 94 quad 90 quad 100]^T$), and the collection of all observations by $Y$, the model can be written as

$ Y = mat(y_1; y_2; y_3; y_4) = X beta + epsilon; quad epsilon ~ N(0, sigma^2 I), $

where it is assumed that $beta$ is identifiable. The corresponding fitted values can be written as $hat(Y) = X hat(beta) = H Y$, where $H$ is calculated from $X$.

#question-heading[Question V.3 (9)]

Which of the following statements about $X$ and $H$ is correct?

#opt[1][$X in RR^(20 times 5)$, and $"Trace"(H) = 5$.]
#opt[2][$X in RR^(20 times 4)$, and $"Trace"(H) = 4$.]
#opt[3][$X in RR^(20 times 4)$, and $"Trace"(H) = 20$.]
#opt[4][$X in RR^(20 times 20)$, and $"Trace"(H) = 20$.]
#opt[5][$X in RR^(20 times 5)$, and $"Trace"(H) = 20$.]

the correct answer is *Option 2*, because we have 20 observations and 4 groups, so X is 20x4. The trace of H is equal to the rank of X, which is 4.


#pagebreak()

// ============================================================
// EXERCISE VI
// ============================================================

#exercise-box[Exercise VI]

#v(0.5em)

One wants to compare the means in two samples, A and B. Both samples contain 50 independent measurements, which are assumed to be normally distributed. It is stated that the 95% confidence interval for the mean in each group is:

#v(0.3em)
- 95% CI for $hat(mu)_A = [15.2, 17.8]$
- 95% CI for $hat(mu)_B = [13.0, 15.5]$
#v(0.3em)

#question-heading[Question VI.1 (10)]

Which of the following statements is correct?

To solve this exercise you may need the following quantiles from the $t$-distribution:
$ t_(0.975)(49) = 2.010, quad t_(0.975)(98) = 1.984, quad t_(0.995)(98) = 2.627 $

#opt[1][Since the confidence intervals overlap, the two underlying populations could have the same mean. Therefore, we can easily see that the difference between the two sample means is not significantly different from zero (at a 5% significance level).]
#opt[2][Since the confidence intervals overlap, the difference between the two sample means is not statistically significantly different from zero (at a 5% significance level). Thus, the two underlying populations have the same distribution.]
#opt[3][The sample means for sample A and B are 16.50 and 14.25, respectively, and there is a significant difference between these means at a 5% significance level (but not at a 1% significance level).]
#opt[4][The sample means for sample A and B are 16.50 and 14.25, respectively, and there is a significant difference between these means (at a 1% significance level).]
#opt[5][The sample means for sample A and B are 16.50 and 14.25, respectively, but there is no significant difference between these means (at a 5% significance level).]

$n = 50, alpha=0.05$

the answer is *option 3*

#pagebreak()

// ============================================================
// EXERCISE VII
// ============================================================

#exercise-box[Exercise VII]

#v(0.5em)

Capture-recapture is a method in which a number of individuals (animals) are captured, tagged, and released. After a period of time, a number of individuals are captured and it is examined how many individuals are tagged. The method can be used to estimate population sizes.

A biologist has captured $n_1 = 150$ fish in a lake, tagged them, and released them again. The biologist now plans to return and capture $n_2 = 200$ fish from the same lake.

#question-heading[Question VII.1 (11)]

If we denote the total number of fish in the lake by $N$ (and assume that $N$ is the same when released and recaptured), what distribution will the number of tagged fish ($Y$) then follow at recapture (it is assumed that all tagged fish survive and that it is completely random which of the $N$ fish are captured)?

#opt[1][A binomial distribution with $p = frac(150, N)$, and $n = 200$, i.e. $Y ~ B(200, frac(150, N))$.]
#opt[2][A normal distribution with parameters $mu = frac(200 dot 150, N)$, and $sigma^2 = frac(200 dot 150, N)(1 - frac(150, N))$.]
#opt[3][A hypergeometric distribution with parameters $n = 200$, $a = 150$, and $N$, i.e. $Y ~ H(200, 150, N)$.]
#opt[4][A Poisson distribution with parameter $lambda = frac(150 dot 200, N)$, i.e. $Y ~ "Pois"(frac(150 dot 200, N))$.]
#opt[5][An exponential distribution with parameter $lambda = frac(N, 150 dot 200)$, i.e. $Y ~ "Exp"(frac(N, 150 dot 200))$.]



#v(0.5em)

The length of the caught fish is measured in order to provide an estimate of their age. Fish between 6 and 10 cm are classified as 1-year-old, while fish of more than 10 cm are classified as older. It is assumed that the length of a one-year-old fish follows a normal distribution with mean $mu = 8$ cm and standard deviation $sigma = 1$ cm.

#question-heading[Question VII.2 (12)]

What is the probability that a one-year-old fish is classified as older than one year?

To solve this exercise you may need the following quantile from the standard normal distribution: $z_(0.977) = 2.00$ (i.e. $P(Z < 2) = 0.977$, where $Z ~ N(0,1)$).

#opt[1][$0.159$]
#opt[2][$0.5$]
#opt[3][$0.841$]
#opt[4][$0.0228$]
#opt[5][$0.977$]

#pagebreak()

// ============================================================
// EXERCISE VIII
// ============================================================

#exercise-box[Exercise VIII]

#v(0.5em)

A company wants to investigate the effect of lighting and music conditions on employee productivity (measured in the number of units produced per hour).

Two factors are tested:

#v(0.3em)
+ *Lighting (Factor A)* with two levels: Low and High
+ *Music (Factor B)* with three levels: None, Calm, and Energetic
#v(0.3em)

All combinations are tested, and the employees' average productivity is measured:

#v(0.5em)

#align(center)[
  #table(
    columns: (auto, auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    inset: 8pt,
    table.header([], [*No Music*], [*Calm Music*], [*Energetic Music*]),
    [*Low Lighting*], [20], [23], [19],
    [*High Lighting*], [25], [27], [22],
  )
]

#v(0.5em)

It is now assumed that the model is

$ Y_(i j) = mu + alpha_i + beta_j + epsilon_(i j); quad epsilon_(i j) ~ N(0, sigma^2), $

where $epsilon_(i j)$ are iid., $Y_(i j)$ is productivity, and $alpha_i$ and $beta_j$ represent the effects of Lighting and Music respectively. The following ANOVA table has been obtained from fitting the model to the data:

#v(0.5em)

#block(fill: luma(245), inset: 10pt, radius: 3pt, width: 100%)[
  ```
             df     sum_sq    mean_sq          F    PR(>F)
  Light     1.0  24.000000  24.000000  48.000000  0.020204
  Music     2.0  20.333333  10.166667  20.333333  0.046875
  Residual  2.0   1.000000   0.500000        NaN       NaN
  ```
]

#question-heading[Question VIII.1 (13)]

What is the conclusion from the relevant statistical tests, using a significance level of $alpha = 0.05$?

#opt[1][There is a significant difference in productivity both with respect to different lighting and different music.]
#opt[2][There is a significant difference in productivity with respect to different lighting, but not with respect to different music.]
#opt[3][There is a significant difference in productivity with respect to different music, but not with respect to different lighting.]
#opt[4][There is no significant difference in productivity, either with respect to different music or different lighting.]
#opt[5][There is a significant difference in productivity with respect to different music, but one cannot conclude whether there is an effect of different lighting, since there are only two levels.]

#question-heading[Question VIII.2 (14)]

To perform further investigations on the effect of music, pairwise comparisons of its effects need to be made. While correcting for multiple tests, what is the Least Significant Distance (LSD) for the pairwise comparisons of the effect of music (using a significance level of $alpha = 0.05$)?

To solve this exercise you may need: $t_(0.9917)(2) = 7.649$, which is the Bonferroni-corrected quantile for 3 pairwise comparisons.

#opt[1][$2.5$]
#opt[2][$2.0$]
#opt[3][$1.5$]
#opt[4][$5.4$]
#opt[5][$6.2$]

#pagebreak()

// ============================================================
// EXERCISE IX
// ============================================================

#exercise-box[Exercise IX]

#v(0.5em)

A consumer organization wants to investigate how often a parcel delivery company delivers packages to the nearest parcel shop. They collected data from 750 parcel deliveries, distributed across 5 regions. The results are summarized in the following table:

#v(0.5em)

#align(center)[
  #table(
    columns: (auto, auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    inset: 7pt,
    table.header([*Region*], [*Nearest parcel shop*], [*Delivered elsewhere*], [*Total*]),
    [Capital region], [40], [110], [150],
    [Central Jutland], [95], [55], [150],
    [Southern Denmark], [80], [70], [150],
    [North Jutland], [85], [65], [150],
    [Zealand], [70], [80], [150],
    [*Total*], [*370*], [*380*], [*750*],
  )
]

#v(0.5em)

A $chi^2$-test is now performed to investigate whether the proportion of packages delivered to the nearest parcel shop is the same across all 5 regions.

#question-heading[Question IX.1 (15)]

What are the expected values in each cell of the table under the null hypothesis?

*Option 1:*

#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    inset: 6pt,
    table.header([*Region*], [*Nearest*], [*Elsewhere*]),
    [Capital region], [75], [75],
    [Central Jutland], [75], [75],
    [Southern Denmark], [75], [75],
    [North Jutland], [75], [75],
    [Zealand], [75], [75],
  )
]

*Option 2:*

#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    inset: 6pt,
    table.header([*Region*], [*Nearest*], [*Elsewhere*]),
    [Capital region], [80], [70],
    [Central Jutland], [70], [80],
    [Southern Denmark], [60], [90],
    [North Jutland], [50], [100],
    [Zealand], [40], [110],
  )
]

*Option 3:*

#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    inset: 6pt,
    table.header([*Region*], [*Nearest*], [*Elsewhere*]),
    [Capital region], [100], [0],
    [Central Jutland], [100], [0],
    [Southern Denmark], [100], [0],
    [North Jutland], [100], [0],
    [Zealand], [100], [0],
  )
]

*Option 4:*

#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    inset: 6pt,
    table.header([*Region*], [*Nearest*], [*Elsewhere*]),
    [Capital region], [74], [76],
    [Central Jutland], [74], [76],
    [Southern Denmark], [74], [76],
    [North Jutland], [74], [76],
    [Zealand], [74], [76],
  )
]

*Option 5:*

#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    inset: 6pt,
    table.header([*Region*], [*Nearest*], [*Elsewhere*]),
    [Capital region], [40], [110],
    [Central Jutland], [95], [55],
    [Southern Denmark], [80], [70],
    [North Jutland], [85], [65],
    [Zealand], [70], [80],
  )
]

#question-heading[Question IX.2 (16)]

A $chi^2$-test is performed to investigate whether the proportion of packages delivered to the nearest parcel shop is the same across all 5 regions. The relevant test statistic has been calculated as 47.21. What is the p-value for the relevant test, and what is the corresponding conclusion (use a significance level of $alpha = 0.05$)?

To solve this exercise you may need the following quantiles from the $chi^2$-distribution:
$ chi^2_(0.95)(4) = 9.49, quad chi^2_(0.99)(4) = 13.28, quad chi^2_(0.999)(4) = 18.47 $

#opt[1][The p-value is 0.10, and the conclusion is that there is a difference in the proportion of packages delivered to the nearest parcel shop in the different regions.]
#opt[2][The p-value is 0.10, and the conclusion is that there is no difference in the proportion of packages delivered to the nearest parcel shop in the different regions.]
#opt[3][The p-value is 0.05, and the conclusion is that there is no difference in the proportion of packages delivered to the nearest parcel shop in the different regions.]
#opt[4][The p-value is $1.4 dot 10^(-9)$, and the conclusion is that there is no difference in the proportion of packages delivered to the nearest parcel shop in the different regions.]
#opt[5][The p-value is $1.4 dot 10^(-9)$, and the conclusion is that there is a difference in the proportion of packages delivered to the nearest parcel shop in the different regions.]

#pagebreak()

// ============================================================
// EXERCISE X
// ============================================================

#exercise-box[Exercise X]

#v(0.5em)

A sensor measures the temperature of a machine that should not exceed 80°C. A sample of 40 temperature measurements gives a sample mean of 75.2°C and a sample standard deviation of 2.5°C. Assume that the temperature measurements are independent of each other and follow a normal distribution.

#question-heading[Question X.1 (17)]

What is a 95% confidence interval for the true mean temperature?

To solve this exercise you may need: $t_(0.975)(39) = 2.023$.

#opt[1][$[72.7, 77.7]$ °C]
#opt[2][$[70.1, 80.3]$ °C]
#opt[3][$[74.4, 76.0]$ °C]
#opt[4][$[75.1, 75.3]$ °C]
#opt[5][$[71.0, 79.4]$ °C]

#pagebreak()

// ============================================================
// EXERCISE XI
// ============================================================

#exercise-box[Exercise XI]

#v(0.5em)

A car owner wants to buy a new (used) car. To investigate what the price should be, she has collected prices for the car (make and model) she wants. The histogram below shows the distribution of prices for the car she wants.

#v(0.5em)
#block(
  fill: luma(245),
  inset: 10pt,
  radius: 3pt,
  width: 100%,
)[
  *[Figure: Histogram of car prices]* A right-skewed histogram of price (in 1000 kr) on the $x$-axis (ranging roughly 25–350) versus frequency on the $y$-axis (0–50). The mode is around 50–75 (1000 kr) with a frequency near 48; the distribution falls off toward higher prices with a long right tail extending to about 350.
]
#v(0.5em)

In addition to the histogram, the average and empirical variance for the observed prices (`price`) [1000 kr.] have been calculated:

$ overline(x) = 118.946, quad s^2 = 3633.11 $

#question-heading[Question XI.1 (18)]

Based on the above, which of the following assumptions about the distribution of the price ($Y$) is the most reasonable?

#opt[1][A log-normal distribution with parameters $alpha = 4.66$ and $beta^2 = 0.478$, i.e. $Y ~ "LN"(4.66, 0.478^2)$.]
#opt[2][A normal distribution with parameters $mu = 118.94$ and $sigma^2 = 3633.1^2$, i.e. $Y ~ N(118.9, 3633.1^2)$.]
#opt[3][An exponential distribution with parameter $lambda = 118.9$, i.e. $Y ~ "Exp"(118.9)$.]
#opt[4][A log-normal distribution with parameters $alpha = 118.9$ and $beta^2 = 60.28^2$, i.e. $Y ~ "LN"(118.9, 60.28^2)$.]
#opt[5][A normal distribution with parameters $mu = 118.94$ and $sigma^2 = 60.28^2$, i.e. $Y ~ N(118.9, 60.28^2)$.]

#v(0.5em)

The car owner has also collected data on the age and mileage of the cars. To investigate the relationship between price, age and mileage of the car, the car owner fits a multiple linear regression model corresponding to

$ Y_i = beta_0 + beta_1 "age"_i + beta_2 "dist"_i + epsilon_i, quad epsilon_i ~ N(0, sigma^2), $

where `price` [1000 kr.] is the price, `age` [years] is the age of the car, and `dist` [1000 km.] is the mileage.

#question-heading[Question XI.2 (19)]

Which of the following statements about the model or model assumptions is correct?

#opt[1][The $epsilon_i$'s are normally distributed and iid. (independent and identically distributed).]
#opt[2][It is assumed that the observed correlation between `age` and `dist` is equal to zero.]
#opt[3][The $Y_i$'s are normally distributed and iid. (independent and identically distributed).]
#opt[4][The $mu_i$'s follow a normal distribution and are iid.]
#opt[5][$mu_i = beta_1 "age"_i + beta_2 "dist"_i$.]

#v(0.5em)

The results of the estimation are given below (some numbers have been replaced by symbols):

#v(0.5em)

#block(fill: luma(245), inset: 10pt, radius: 3pt, width: 100%)[
  ```
                          OLS Regression Results
  ==============================================================================
  Dep. Variable:                  price   R-squared:                       0.793
  Model:                            OLS   Adj. R-squared:                  0.791
  No. Observations:                 177   F-statistic:                     334.0
  Covariance Type:            nonrobust   Prob (F-statistic):           2.65e-60
  ==============================================================================
               coef    std err          t      P>|t|      [0.025      0.975]
  ------------------------------------------------------------------------------
  Intercept  255.8098    5.707         T1         P1       Ql_1        Qu_1
  age         -9.6077    0.963         T2         P2       Ql_2        Qu_2
  dist        -0.4756    0.055         T3         P3       Ql_3        Qu_3
  ==============================================================================
  ```
]

#question-heading[Question XI.3 (20)]

Which of the following statements is correct when using a significance level of $alpha = 0.05$?

#opt[1][Both effects (age and mileage) are significantly different from zero and the expected price decreases with age and mileage.]
#opt[2][None of the effects (age and mileage) are significantly different from zero.]
#opt[3][The age of the car has a significant effect on the price, while an effect of the mileage cannot be demonstrated. The price increases as the age increases.]
#opt[4][Mileage has a significant effect on price, while an effect of age cannot be demonstrated. The price decreases as mileage increases.]
#opt[5][The age of the car has a significant effect on the price, while an effect of the mileage cannot be demonstrated. The price decreases as the age increases.]

#v(0.5em)

To assess the validity of the model, the car owner has created a series of residual plots, as seen below.

#v(0.5em)
#block(
  fill: luma(245),
  inset: 10pt,
  radius: 3pt,
  width: 100%,
)[
  *[Figure: Four residual diagnostic plots]*

  *a) QQ plot — Residuals:* Sample quantiles vs theoretical quantiles. Points follow the red reference line in the middle but deviate at both tails (especially the upper right), indicating heavy tails / non-normality.

  *b) Residuals vs Fitted values:* Residuals (−50 to ≈120) vs fitted values (0–200, 1000 kr). The cloud shows a curved pattern with increasing spread at the extremes — systematic structure and non-constant variance.

  *c) Residuals vs Age:* Residuals vs age (5–20 years). A clear quadratic (U-shaped) pattern: residuals are higher at low and high ages and lower in the middle.

  *d) Residuals vs Dist:* Residuals vs mileage (0–300, 1000 km). Also shows a mild U-shaped pattern with increasing spread.
]
#v(0.5em)

#question-heading[Question XI.4 (21)]

Which of the following statements is NOT correct (both statement and figure reference must be correct)?

#opt[1][The independence assumption is clearly not met (plot a).]
#opt[2][The variance homogeneity assumption does not appear to be met (plot b).]
#opt[3][A term of the form $"age"^2$ will probably improve the model (plot c).]
#opt[4][There are clear systematic effects in residuals vs. fitted (plot b).]
#opt[5][The normal distribution assumption is clearly not met (plot a).]

#v(0.5em)

Regardless of the conclusion above, the car owner decides to continue analyzing the model. The model can be written in matrix-vector notation as

$ Y = X beta + epsilon; quad epsilon ~ N(0, sigma^2 I), $

where $X$ is the design matrix with $n = 177$ observations and 3 parameters ($beta_0, beta_1, beta_2$). The matrix $C = X^T X$ is given by:

$ C = mat(177, 1413, 22393; 1413, 13099, 202256; 22393, 202256, 3384553) $

#question-heading[Question XI.5 (22)]

If $hat(sigma)$ denotes the usual standard deviation, what is then the 95% confidence interval for the price [1000 kr.] of a 10-year-old car that has been driven 100,000 km?

To solve this exercise you may use: $sqrt(x^T (X^T X)^(-1) x) approx 0.1382$ (where $x = [1, 10, 100]^T$) and $t_(0.975)(174) approx 1.974$.

#opt[1][$112.2 plus.minus 0.272 dot hat(sigma)$]
#opt[2][$112.2 plus.minus 0.0112 dot hat(sigma)$]
#opt[3][$112.2 plus.minus 0.148 dot hat(sigma)$]
#opt[4][$112.2 plus.minus 0.0375 dot hat(sigma)$]
#opt[5][$112.2 plus.minus 1.97 dot hat(sigma)$]

#v(0.5em)

The car owner now wants to test whether there is an effect of including age and dist in the model, corresponding to the null hypothesis $Y = bold(1)mu + epsilon$ against the alternative $Y = X beta + epsilon$. The projection matrices corresponding to the null and alternative hypotheses are denoted $H_0$ and $H$, and the test statistic is

$
  Q = frac(frac(1, d f_0) S S_0, frac(1, d f_("SSE")) S S E), quad "where" quad S S_0 = y^T (H_0 - H) y, quad S S E = y^T (I - H) y.
$

#question-heading[Question XI.6 (23)]

What is $Q$ in the example above and which distribution should $Q$ be compared to?

#opt[1][$Q = 0.793$ which should be compared to an $F$-distribution with 1 and 3 degrees of freedom.]
#opt[2][$Q = 0.793$ which should be compared to an $F$-distribution with 1 and 2 degrees of freedom.]
#opt[3][$Q = 2.65 dot 10^(-60)$ which should be compared to an $F$-distribution with 3 and 177 degrees of freedom.]
#opt[4][$Q = 334.0$ which should be compared to an $F$-distribution with 2 and 174 degrees of freedom.]
#opt[5][$Q = T_1^2 + T_2^2 + T_3^2$ which is to be compared to an $F$-distribution with 3 and 177 degrees of freedom.]

#pagebreak()

// ============================================================
// EXERCISE XII
// ============================================================

#exercise-box[Exercise XII]

#v(0.5em)

A consultant has received data on arrival and departure times for 35 employees at a given workplace. Arrival and departure times are recorded for the same 35 employees on two different days — one day in the summer and one day in the winter. The consultant now wishes to assess whether the average working hours are the same on both days.

#question-heading[Question XII.1 (24)]

Which analysis is relevant to perform?

#opt[1][For each arrival and departure time, the working hours are calculated. Now, you have two independent samples (one for the summer day and one for the winter day) with 35 measurements in each. The means of these samples are compared using a t-test with the null hypothesis $H_0 : mu_1 = mu_2$.]
#opt[2][For each of the two days, the average arrival time and the average departure time are calculated. Then, two t-tests are performed: one t-test tests for a significant difference in arrival times, and the other tests for a significant difference in departure times.]
#opt[3][For each arrival and departure time, the working hours are calculated. Now, you have two paired samples (one for the summer day and one for the winter day) with 35 measurements in each. A paired t-test is used to examine whether the average difference in working hours is significantly different from zero.]
#opt[4][For each of the two days, a 95% confidence interval is calculated for the average arrival time $C I_(overline(x)_("arrive"))$ and for the average departure time $C I_(overline(x)_("leave"))$. If the two confidence intervals do not overlap, there is a significant difference in the average working hours between the two days.]
#opt[5][For each arrival and departure time, a total working time is calculated. Now, you have two samples with 35 measurements. A one-way ANOVA model is used to test whether there is a difference in the average working hours between the two days.]

#pagebreak()

// ============================================================
// EXERCISE XIII
// ============================================================

#exercise-box[Exercise XIII]

#v(0.5em)

In an experiment, it has been assumed that the relationship between an input ($x$) and an output ($y$) is given by

$ Y_i = f(x_i) + epsilon_i; quad epsilon_i ~ N(0, sigma^2), $

and that $epsilon_i$ is iid. Since the function $f$ is unknown, it has been decided to fit the model

$ Y_i = beta_1 + beta_2 x_i + beta_3 x_i^2 + epsilon_i; quad epsilon_i ~ N(0, sigma^2). $

The parameters of the model are estimated, giving parameter estimates $hat(beta) = [hat(beta)_1, hat(beta)_2, hat(beta)_3]^T$ and a corresponding covariance matrix $Sigma_beta$ (with $(Sigma_beta)_(k l) = sigma_(k l)$ equal to the covariance between $hat(beta)_k$ and $hat(beta)_l$). We now want to investigate where the extremum of the second-degree polynomial lies, corresponding to solving

$ f'(x) = beta_2 + 2 beta_3 x = 0 $

for $x$. The solution is called $x^*(beta)$, and it is assumed that $beta ~ N(hat(beta), Sigma_beta)$.

#question-heading[Question XIII.1 (25)]

Using error propagation, what will the approximation of the variance of $x^*$ be?

#opt[1][$V[x^*] approx frac(hat(beta)_1^2, hat(beta)_3^2) sigma_(11) + frac(1, 4 hat(beta)_3^2) sigma_(22) + frac(hat(beta)_2^2, 4 hat(beta)_3^4) sigma_(33)$]
#opt[2][$V[x^*] approx frac(1, 2 hat(beta)_3^2) (frac(1, 2) sigma_(22) + frac(hat(beta)_2^2, 2 hat(beta)_3^2) sigma_(33))$]
#opt[3][$V[x^*] approx frac(hat(beta)_1^2, hat(beta)_3^2) sigma_(11) + frac(1, 4 hat(beta)_3^2) sigma_(22) + frac(hat(beta)_2^2, 4 hat(beta)_3^4) sigma_(33) - frac(hat(beta)_1 hat(beta)_2, hat(beta)_3^3) sigma_(12) + frac(hat(beta)_1, hat(beta)_3^2) sigma_(13) - frac(hat(beta)_2, hat(beta)_3^3) sigma_(23)$]
#opt[4][$V[x^*] approx frac(1, 2 hat(beta)_3^2) (frac(1, 2) sigma_(22) + frac(hat(beta)_2^2, 2 hat(beta)_3^2) sigma_(33) - frac(hat(beta)_2, hat(beta)_3) sigma_(23))$]
#opt[5][$V[x^*] approx frac(hat(beta)_1^2, hat(beta)_3^2) sigma_(11) + frac(1, 4 hat(beta)_3^2) sigma_(22) + frac(hat(beta)_2^2, 4 beta_3^4) sigma_(33) + frac(hat(beta)_1 hat(beta)_2, hat(beta)_3^3) sigma_(12) + frac(hat(beta)_2, hat(beta)_3^3) sigma_(23)$]

#v(0.5em)

Now assume that in a specific study it is observed that

$ hat(beta) = mat(1; 2; -1), quad Sigma_beta = mat(0.2, 0, -0.01; 0, 0.01, 0; -0.01, 0, 0.001) $

#question-heading[Question XIII.2 (26)]

Using the error propagation formula derived in Question XIII.1, compute an approximation of the standard deviation of $x^*$ using the given values of $hat(beta)$ and $Sigma_beta$. In which interval does this approximated standard deviation lie?

#opt[1][$[0.09; 0.14]$]
#opt[2][$[0.04; 0.08]$]
#opt[3][$[0.01; 0.03]$]
#opt[4][$[0.001; 0.005]$]
#opt[5][$[0.25; 1.25]$]

#v(0.5em)

The parameterization of the second degree polynomial above is not unique and can be formulated as

$ Y_i = beta_1 p_0(x_i) + beta_2 p_1(x_i) + beta_3 p_2(x_i) + epsilon_i; quad epsilon_i ~ N(0, sigma^2), $

where $p_j(x)$ is a polynomial of degree $j$.

#question-heading[Question XIII.3 (27)]

If the number of observations is $n = 11$ and $[x_1, x_2, ..., x_(11)] = [-5, -4, ..., 4, 5]$, what set of polynomials then gives an orthogonal design (i.e. $(X^T X)_(j i) = 0$ for $i eq.not j$)?

You may use: $sum_(i=1)^(11) x_i = 0$ and $sum_(i=1)^(11) x_i^2 = 110$.

#opt[1][$p_0(x_i) = frac(1, 11)$, $p_1(x_i) = x_i - 5$, $p_2(x_i) = x_i^2 - x_i - 25$.]
#opt[2][$p_0(x_i) = 1$, $p_1(x_i) = x_i - 2.5$, $p_2(x_i) = x_i^2 - 10$.]
#opt[3][$p_0(x_i) = 1$, $p_1(x_i) = x_i$, $p_2(x_i) = x_i^2 - 10$.]
#opt[4][$p_0(x_i) = 1$, $p_1(x_i) = x_i$, $p_2(x_i) = x_i^2$.]
#opt[5][$p_0(x_i) = frac(1, 11)$, $p_1(x_i) = x_i + 5$, $p_2(x_i) = x_i^2 - 25$.]

#pagebreak()

// ============================================================
// EXERCISE XIV
// ============================================================

#exercise-box[Exercise XIV]

#v(0.5em)

In order to determine the weight of a particular object, two people weigh the object a number of times on a scale. It is assumed that the measurement error on the scale is normally distributed with mean 0 and variance $sigma^2$, and that all weighings are independent. The two people weigh the object 2 and 3 times, respectively, and report the average ($overline(Y)_1$ and $overline(Y)_2$).

#question-heading[Question XIV.1 (28)]

If the weight of the object is equal to $mu$, what are the mean and variance of $overline(Y) = frac(1, 2) overline(Y)_1 + frac(1, 2) overline(Y)_2$ then?

#opt[1][$E(overline(Y)) = mu$, $V(overline(Y)) = sigma^2$]
#opt[2][$E(overline(Y)) = mu$, $V(overline(Y)) = frac(sigma^2, 2)$]
#opt[3][$E(overline(Y)) = mu$, $V(overline(Y)) = frac(5 sigma^2, 6)$]
#opt[4][$E(overline(Y)) = mu$, $V(overline(Y)) = frac(5 sigma^2, 24)$]
#opt[5][$E(overline(Y)) = mu$, $V(overline(Y)) = frac(sigma^2, 5)$]

#v(0.5em)

In order to construct a test statistic, a weighted average ($w in (0, 1)$) is calculated

$ tilde(Y) = w overline(Y)_1 + (1 - w) overline(Y)_2, $

such that $tilde(Y)$ and $overline(Y)_i - tilde(Y)$ are independent.

#question-heading[Question XIV.2 (29)]

For which $w$ is it true that $"Cov"(overline(Y)_1 - tilde(Y), tilde(Y)) = 0$?

#opt[1][$w = frac(1, 2)$]
#opt[2][$w = frac(1, 3)$]
#opt[3][$w = frac(2, 5)$]
#opt[4][$w = frac(5, 12)$]
#opt[5][$w = frac(5, 24)$]

#v(0.5em)

Using the results above, two independent computational quantities, $Q_1$ and $Q_2$, have been constructed, such that $frac(k_1, sigma^2) Q_1 ~ chi^2(1)$ and $frac(k_2, sigma^2) Q_2 ~ chi^2(1)$, where $k_1$ and $k_2$ are constants.

#question-heading[Question XIV.3 (30)]

Which of the following statements is correct?

#opt[1][$frac(1, 2 sigma^2) frac(k_1 Q_1, k_2 Q_2) ~ F(2, 1)$]
#opt[2][$frac(k_1 Q_1, k_2 Q_2) ~ F(1, 1)$]
#opt[3][$frac(1, 2) frac(Q_1 \/ k_1, Q_2 \/ k_2) ~ F(1, 2)$]
#opt[4][$frac(Q_1, Q_2) ~ F(1, 1)$]
#opt[5][$frac(Q_1 \/ k_1, Q_2 \/ k_2) ~ F(1, 1)$]

#v(2em)

#align(center)[
  #text(size: 12pt, weight: "bold")[The exam is finished. Enjoy the summer!]
]
