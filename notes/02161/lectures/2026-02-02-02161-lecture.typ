#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "02161",
  course-name: "Software Engineering 1",
  title: "Lecture - February 02, 2026",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

= Learning Objectives

- Tools and methods to help you create software 
- We use agile software development
- Do a _smaller_ project from an _informal_ and open description of the problem

== Project challenges

Challenges: deadline, budgeting problems, bugs, and customer specification

A list of projects that nearly failed, or failed are:

- Amanda
- Rejsekortet
- Obamacare Website
- German road toll system
- $dots$

On average about 32% of all projects succeed, 20% fail. And 48% experience scope creep.

== Scaling software

Suppose you need to make housing, you could just make a hut, this would house 1-2 people, maybe a family. But what if you want to scale the building? What if you want to house 100 people? Suddenly the scope of the project changes, and the code you wrote for the hut wont be able to scale to fit 100 people, at least not without proper planning.

== Differences between small and large software


=== Small project

- Find the bug
- Fix the bug
- Adjust documentation

=== Large project

- Report defect
- collect defect reports
- Analyse problem 
- Identify bug 
- Define a bug fixing strategy 
- Fix the bug 
- Testing: bug fixed; no new bugs
- Accept the fixed version
- Integrate parallel changes 
- Update release documentation 
- Release the new system



