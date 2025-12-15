#import "@local/dtu-template:0.4.1":*

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - September 04, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Key Concepts

== Proposition
  A proposition (Udsagn) is a declarative sentence, a sentence that declares a fact, that is either true or false, but not both.

  #example[
    The following sentences are propositions.

    + Washington D.C., is the capital of the USA
    + Toronto is the capital of canada
    + $1 + 1 = 2$
    + $2 + 2 = 3$

    Where propositions 1 and 3 are true, whereas 2 and 4 are false.
  ]

    Another example would be

    #example[
      + What time is it?
      + Read this carefully.
      + $x + 1 = 2$
      + $x + y = z$
    ]

    Where sentence 1 and 2 are not propositions are not declarative sentences. Neither is sentence 3 and 4 but they can be turned into a proposition if we assign values to the variables.

  Letters are used to denote propositional variables (sentential variables), the conventional letters used are, $p, q, r, s, dots$ . The truth value of a propositon is denoted by T, if the truth value of a proposition is false, it is denoted by F. Propositions that cannot be expressed in terms of simpler propositions are called atomic propositions.


  #definition(
    "Negation"
  )[
    Let $p$ be a proposition. The _negation_ of $p$ is denoted by $not p$ (also denoted by $overline(p)$), is the statement

    "It is not the case that $p$"

    The proposition $not p$ is read "not p." The truth value of the negation of $p$, $not p$, is the opposite of the truth value of $p$.

    Other notations for negation might be $~p, -p, "N"p, "and" !p$

    In broader terms $not p$ is the same as "opposite of $p$"
  ]

  The negation of a propositon can also be considered the result of the operation of the *negation operator* on a proposition. The negation operator constructs a new proposition from a single existing proposition. The logical operators that are used to form new propositions from two or more existing propositions. They are called *connectives*

  #definition("Conjunction")[
    Let $p$ and $q$ be propositions. The _conjunction_ of $p$ and $q$, denoted by $p and q$, is the proposition "$p$ and $q$." The conjunction $p and q$ is true when both $p$ and $q$ are true and is false otherwise.
  ]


Another connective is the _disjunction_ of $p$ and $q$

#definition("Disjunction")[
  Let $p$ and $q$ be propositions. The _disjunction_ of $p$ and $q$, denoted by $p or q$, is the proposition "$p$ or $q$." The disjunction $p or q$ is false when both $p$ and $q$ are false and is true otherwise.
]

A disjunction is true when at least one of the two propositions is true. This is an *or* connective. On the opposite spectrum of the *inclusive or* exists *exclusive or*, where unlike the disjunction of two propositions $p$ and $q$, the exlcusive or of these two propositions is true when exactly one of $p "and" q$ is true; and false when both $p "and" q$ are true. (and when both are false)

#definition("Exclusive or")[
  Let $p$ and $q$ be propositions. The _exclusive or_ of $p "and" q$, is denoted by $p xor q$, is the proposition that is true when exactly one of $p$ and $q$ is true and is false otherwise.
]


== Conditional Statements


#definition("Conditional statement")[
  Let $p$ and $q$ be propositions. The _conditional statement_ $p -> q$ (or $p => q$) is the proposition "if $p$, then $q$." The conditional statement $p -> q$ is false when $p$ is true and $q$ is false, and true otherwise. In the conditional statement $p -> q$, $p$ is called the _hypothesis_ (or _atecedent_ or _premise_) and $q$ is called the _conclusion_ (or _consequence_)
]

The statement $p -> q$ is called a conditional statement because $p -> q$ asserts, that $q$ is true on the condition that p holds. A conditional statement is also called an *implication*. The statement $p -> q$ is true when both $p$ and $q$ are true and when $p$ is false (no matter what truth value $q$ has)


=== Converse, Contrapositive and Inverse

Given the conditional statement $p -> q$, the proposition $ q -> p$ is called the *converse* of $p -> q$. The *contrapositive* of $p -> q$ is the proposition $not q -> not p$ whereas the proposition $not p -> not q$ is called the *inverse* of $p -> q$. Of the three conditional statements formed from $p -> q$, only the contrapositive always has the same truth value as $p -> q$. When two compound propositions always have the same truth values, regardless of the truth values of its propositional values. we call them *equivalent*.

==== Converse

The converse switches the hypothesis and conclusion.

Take the proposition
$
  p -> q
$

It's converse would be

$
  q -> p
$

#important[
  The converse is NOT logically equivalent to the original statement. Just because $p$ implies $q$ doesn't mean $q$ implies $p$.
]

#example[
  Proposition: "If it is raining, then the ground is wet"

  Converse: "If the ground is wet, then it's raining"

  But the ground could be wet from say a sprinkler.
]

==== Contrapositive
The *contrapositive* negates both parts and switches their order

Take the proposition

$
  p -> q
$

The contrapositive of which would be

$
  not q -> not p
$

#important[
  The contrapositive is logically equivalent to the original proposition. They always have the same truth value.
]

#example[
  Proposition: "If it is raining, then the ground is wet"

  Contrapositive: "If the ground is not wet, then it's not raining"

]

==== Inverse

The *inverse* negates both the hypothesis and the conclusion but keeps the same order.

Take the proposition

$
  p -> q
$

The inverse of which would be

$
  not p -> not q
$

#important[
  The inverse is NOT logically equivalent to the original statement. Just because $p$ implies $q$ doesn't mean $not p$ implies $not q$.
]

#example[
  Proposition: "If it is raining, then the ground is wet"

  Inverse: "If it is not raining, then the ground is not wet"

  But the ground could be wet from say a sprinkler.
]

=== Biconditionals

A biconditional statement is a way to combine propositions that expresses that two propositions have the same truth values.

#definition("Biconditional")[
  Let $p$ and $q$ be propositions. The _biconditional statement_ $p <-> q$ is the proposition "$p$ if and only if $q$." The biconditional statement $p <-> q$ is true when $p$ and $q$ have the same truth values, and is false otherwise. Biconditional statements are also called bi-implications.
]


#dtu-table(
  caption: "Biconditional truth table",
  columns: 3
)[$p$][$q$][$p <-> q$][T][T][T][T][F][F][F][T][F][F][F][T]


= Important Points



= Questions & Follow-up
