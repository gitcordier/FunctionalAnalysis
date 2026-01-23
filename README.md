# Forewords

A long time ago, I solved a (tiny…) bunch of problems from the Walter Rudin's
*Functional Analysis*.

I am carefully rewriting my solutions, aiming at the cleanest possible result.

# Requirements

UPDATE: I am switching to LuaLaTeX, FA_DM_XeLaTeX the XeLaTeX version of FA_DM.tex is now "legacy".
You should use FA_DM.tex.

- TeX
- LuaLaTeX or XeLaTeX
- Packages
  - AMS packages:
    - amsmath
    - physics
    - amssymb
    - mathrsfs
    - amsthm
    - mathspec
  - cite
  - geometry
  - xltxtra (for XeLaTeX)
  - xunicode (for XeLaTeX)
  - xetex (for XeLaTeX)
- Optional: Relevant fonts:
  - Computer Modern 10
  - CMU Serif
  - CMU Typewriter Text Light

You may want to install the latest
[TeXLive](https://www.tug.org)

# Legal issues

- I do not broadcast nor sell any copy of *Functional Analysis*
- I do not make available any content from this book,
  **except** problems statements

Feel free to get copies of this great book by yourself.
*Functional Analysis*' ISBNs are

- ISBN-10: 0070542368
- ISBN-13: 978-0070542365

## Files

- FA_DM.pdf Output from compilation.You can also get an html output from
  [Hevea](http://hevea.inria.fr) compilation, see HOWTO.
- FA_DM.tex, the master document.
- FA_mainmatter.tex
- FA_chapter_1.tex
- chapter_1/
  - 1_1.tex
    Basic results that straightforwardly follow from the axioms
    as given in section 1.4.
  - 1_2.tex
    The convex hull of a set A is convex and that is the intersection of
    all convex set(s) that contain A.
  - 1_3.tex
  - 1_4.tex
  - 1_5.tex
  - 1_6.tex
  - 1_7.texI choose to start with this because it is a lovely result,
    since it connects a topological result
    (*to be metrizable or not to be*) with number theory.
  - 1_9.tex Continuity, openness of a linear mapping.
  - 1_10.tex Continuity, openness of a linear mapping onto a finite dimensional
    space. Not trivial, since the domain may be infinite-dimensional.
  - 1_14.tex Alternative ways to define the topology of the test functions space D_K,
    in the special case K=[0, 1].
  - 1_16.tex This is about showing that a function test topology is independent
    from the "supremum seminorms" we consider.
    It is then more than an exercise, it should be regarded as a part of
    the textbook (sections 1.44, 1.46).
  - 1_17.tex
    Given a multi-index $\alpha$, the differential operators $D^\alpha$ is
    continuous in the test functions topology.
- chapter_2/
  - 2_3/
    - 2_3.tex In $D_K$, some Lebesgue integrable functions converge to $\delta'$,
      which is not a Radon measure.
      Their weak derivatives converge to $\delta''$.
  - 2_9.tex Given normed spaces (X, Y, Z), any continuous bilinear mapping
    $B: (x, y) \in X\times Y \mapsto B(x, y) \in Z$ is bounded.
    Thoses spaces need not be complete. An easy example is given by
    $B(f, g)= fg$ where $f$ and $g$ keep in $C_c(R)$.
  - 2_10.tex A bilinear mapping that is continuous at the origin is continuous.
    Actually, 2.09 contains all the relevant material.
    In the more general topological vector space context proof,
    the norm is replaced by Minkowski functionals on balanced open sets.
  - 2_12.tex A bilinear mapping that is separately continuous, but not continuous.
  - 2_15.tex In a F-space X, the complement C of a subgroup Y is not
    of the first category, unless X=Y.
    To sum it up: If Y is a proper subspace,
    then Y is of the first category BUT its complement C
    is of the second category, as X is.
  - 2_16.tex
    A simpler version of the closed graph theorem.
    Roughly speaking, compactness replaces completeness. Compactness cannot
    be dropped: A counterexample is given.
- chapter 3/
  - 3_4.tex
  - 3_11.tex
    Meagerness of the polar (in the infinite-dimensional case)
    of the neighborhoods of the origin:
    Hahn-Banach theorem and polar. We only involve the weak-star
    -closedness of the polar, not its weak-star-compactness!
- chapter 4/
  - 4_1.tex
  - 4_13.tex
  - 4_15.tex
- chapter 6/
  - 6_1.tex
  - 6_9.tex
- LICENSE
- HOWTO
