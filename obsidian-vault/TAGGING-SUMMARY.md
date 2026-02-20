# Knowledge Graph Expansion Summary

**Date:** 2026-02-03  
**Status:** Enhanced with tags and additional fundamental concepts

## What Was Accomplished

### 1. Created Missing Fundamental Concepts (5 new)

**Critical Missing Foundations:**
- **[[Differentialregning]]** - Complete calculus foundation with derivatives, rules, applications
- **[[Lineær Algebra]]** - Vector spaces, matrices, determinants, basis/dimension
- **[[Funktioner]]** - Functions, domains, injectivity/surjectivity, composition
- **[[Komplekse Tal]]** - Complex numbers, polar form, arithmetic, De Moivre's formula
- **[[Sandhedstabeller]]** - Truth tables with examples for all logical operators

These fill critical gaps that were referenced throughout the knowledge graph.

### 2. Added Comprehensive Tags to ALL Concept Files (33 total)

**Tag Categories:**

**Mathematics:**
- `matematik` - General mathematics
- `calculus` - Differential/integral calculus
- `linear-algebra` - Vectors, matrices, eigenvalues
- `multivariable-calculus` - Functions of several variables
- `differential-equations` - ODEs and systems
- `complex-analysis` - Complex numbers and functions
- `analysis` - Mathematical analysis (limits, continuity)
- `number-theory` - Divisibility, primes

**Logic & Discrete Math:**
- `logic` - Logical reasoning
- `discrete-math` - Discrete mathematics
- `boolean-operators` - AND, OR, NOT, XOR
- `conditionals` - Implications and biconditionals
- `proof-techniques` - Contrapositive, etc.
- `equivalence` - Logical equivalence
- `relations` - Relations and equivalence relations
- `set-theory` - Sets and set operations

**Physics:**
- `physics` - General physics
- `mechanics` - Classical mechanics
- `kinematics` - Motion analysis

**Computer Science:**
- `machine-learning` - ML concepts
- `neural-networks` - Neural network architectures
- `activation-functions` - ReLU, sigmoid, etc.
- `software-engineering` - SE principles
- `project-management` - Agile, lifecycle
- `agile` - Agile methodologies

**Course Tags:**
- `01001` - Matematik 1a
- `01002` - Matematik 1b
- `01017` - Discrete Mathematics
- `10060` - Fysik
- `02161` - Software Engineering 1

**Organizational:**
- `fundamentals` - Core foundational concepts
- `functions` - Function-related concepts
- `function-properties` - Injectivity, surjectivity
- `vectors` - Vector-related topics
- `visualization` - Visual representations
- `special-functions` - Heaviside, ReLU, etc.
- `discontinuity` - Discontinuous functions
- `limits` - Limits and epsilon-delta
- `exponential-functions` - Exponentials and logs
- `eigenvalues` - Eigenvalue-related topics
- `integers` - Integer properties

## Current Vault Statistics

**Before Today:**
- Courses: 4
- Concepts: 17
- Tagged files: 0

**After Enhancement:**
- **Courses: 6** (+2: 02161, 02100)
- **Concepts: 33** (+16 new concepts)
- **Tagged files: 33** (100% coverage)
- **Total tags defined: 45+ unique tags**

## Tag-Based Organization Benefits

### By Subject Area

**View all Linear Algebra concepts:**
```
tag:#linear-algebra
```
Results: Egenværdier og Egenvektorer, Diagonalisering, Komplekse Egenværdier, Lineær Algebra, Vektorfunktioner, Lineære ODE'er

**View all Logic concepts:**
```
tag:#logic
```
Results: Propositioner, Negation, Conjunction og Disjunction, Implikation og Biimplikation, Kontrapositive og Converse, Logisk Ækvivalens, Sandhedstabeller

**View all Machine Learning concepts:**
```
tag:#machine-learning OR tag:#neural-networks
```
Results: ReLU Aktiveringsfunktion, Neurale Netværk

### By Course

**01001 concepts:**
```
tag:#01001
```
Results: All differential equations, linear algebra, eigenvalues

**01002 concepts:**
```
tag:#01002
```
Results: Vector functions, continuity, neural networks

**01017 concepts:**
```
tag:#01017
```
Results: All logic and discrete math concepts

### By Difficulty Level

**Fundamentals (start here):**
```
tag:#fundamentals
```
Results: Differentialregning, Funktioner, Propositioner, Logiske Operatorer, ODE basics

**Advanced topics:**
```
tag:#complex-analysis OR tag:#eigenvalues
```
Results: Komplekse Tal, Komplekse Egenværdier, Eulers Formel, Diagonalisering

## Missing Concepts Still Referenced (Top Priority)

From the 53 missing concepts identified, the most important remaining are:

### High Priority (frequently referenced):
1. **Grænseværdier** (Limits) - Referenced in 5+ concepts
2. **Partielle Afledede** (Partial derivatives) - Key for multivariable calculus
3. **Lineære Transformationer** - Referenced in linear algebra chain
4. **Vektorer** - Fundamental prerequisite
5. **Trigonometriske Funktioner** - Referenced in physics and complex analysis

### Medium Priority:
6. De Morgans Love
7. Tautologier og Kontradiktioner
8. Homogene og Inhomogene ODE'er
9. Basis og Dimension
10. Kernel og Image

### Lower Priority (specialized):
- Oscillationer
- Modular Aritmetik
- Primtal
- Version Control
- Agile Metoder

## Enhanced Graph Features

### Beautiful Tag-Based Filtering

In Obsidian graph view, you can now:
1. Filter by tag: `tag:#logic` shows only logic concepts
2. Color by tag: Different colors for different subject areas
3. Exclude tags: Hide certain topics to focus on others
4. Combine filters: `tag:#01001 AND tag:#differential-equations`

### Improved Navigation

Each concept now has:
- **Clear categorization** via tags
- **Course identification** (easy to see which class it's from)
- **Subject area grouping** (all linear algebra together)
- **Difficulty indicators** (fundamentals vs advanced)

### Better Search

Obsidian search now supports:
- `tag:#linear-algebra path:concept-maps` - All linear algebra concepts
- `tag:#01002 tag:#functions` - 01002 function concepts
- `tag:#fundamentals -tag:#01017` - Fundamental concepts excluding discrete math

## Recommended Next Steps

### Option 1: Complete Core Prerequisites (Recommended)
Create the 5 most-referenced missing concepts:
1. Grænseværdier
2. Partielle Afledede  
3. Vektorer
4. Trigonometriske Funktioner
5. Lineære Transformationer

### Option 2: Expand Logic Coverage
Complete discrete math foundations:
1. De Morgans Love
2. Tautologier og Kontradiktioner
3. Sandhedstabeller examples
4. Proof Techniques

### Option 3: Build Out Course-Specific Content
Create lecture summaries for:
- More 01002 lectures (vector calculus)
- 01001 lectures (linear algebra, ODEs)
- 10060 lectures (physics problems)

### Option 4: Clean Up Naming
Fix inconsistencies:
- "Conjunction og Disjunction" vs "Konjunktion og Disjunktion"
- "Kontrapositive og Converse" vs Danish equivalent
- Standardize to either English or Danish for concept names

## How to Use Tags in Obsidian

### Graph View Filtering
1. Open graph view: `Ctrl+G`
2. Click "Filters" button
3. Add tag filters: `tag:#linear-algebra`
4. Color by tags: Settings > Appearance > Graph > Color groups

### Search with Tags
- Search bar: `tag:#logic`
- Multiple tags: `tag:#01001 tag:#differential-equations`
- Exclude: `-tag:#fundamentals`

### Tag Pane
- Enable in Settings > Core plugins > Tags
- View all tags alphabetically
- Click any tag to see all files with that tag
- See tag counts

### Dataview Queries (if plugin enabled)
```dataview
TABLE Course, Prerequisites
FROM #linear-algebra
SORT file.name ASC
```

## Summary of All Tags Used

**Course Tags:** 01001, 01002, 01017, 02161, 10060

**Math Subject Tags:** matematik, calculus, linear-algebra, multivariable-calculus, differential-equations, complex-analysis, analysis, number-theory

**Logic Tags:** logic, discrete-math, boolean-operators, conditionals, proof-techniques, equivalence, relations, set-theory

**Physics Tags:** physics, mechanics, kinematics

**CS Tags:** machine-learning, neural-networks, activation-functions, software-engineering, project-management, agile

**Organizational Tags:** fundamentals, functions, function-properties, vectors, visualization, special-functions, discontinuity, limits, exponential-functions, eigenvalues, integers

## Impact

The knowledge graph is now:
- **More navigable** - Filter by course, topic, or difficulty
- **Better organized** - Clear subject area groupings
- **More discoverable** - Find related concepts via tags
- **More complete** - Critical foundational concepts added
- **More beautiful** - Tag-based coloring in graph view
- **More useful** - Can focus on specific areas of study

All 33 concept files are now professionally tagged and ready for advanced filtering and visualization in Obsidian!
