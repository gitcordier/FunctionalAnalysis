# Forewords
A long time ago, I solved a (tiny…) bunch of problems from the Walter Rudin's 
*Functional Analysis*.

I am carefully rewriting my solutions, aiming at the cleanest possible result.

# Requirements
- TeX
- XeLaTeX 
- packages 
  - AMS packages: 
    - amsmath
    - physics 
    - amssymb 
    - mathrsfs 
    - amsthm 
    - mathspec
  - cite
  - geometry
  - xltxtra
  - xunicode
  - xetex
- Optional: Relevant fonts:
    - CMU Serif
    - CMU Typewriter Text Light

You may want to install the latest 
[TexLive](https://www.tug.org)
# Legal issues 
- I do not broadcast nor sell any copy of *Functional Analysis*
- I do not make available any content from this book, **excepted** problems statements 

Feel free to get copies of this great book by yourself. For the record, 
*Functional Analysis*' ISBNs are

- ISBN-10: 0070542368
- ISBN-13: 978-0070542365


## Files
- FA_DM.pdf  
  Output from [Xelatex](https://www.tug.org) compilation.
- FA_DM.html  
  Output from [Hevea](http://hevea.inria.fr) compilation
- FA_DM.tex
- FA_mainmatter.tex
- FA_chapter_1.tex
- 1_7.tex  
  I choose to start with this because it is a lovely result, since it connects 
  a topological result (*to be metrizable or not to be*) with number theory
  (basic results about dyadic expansions).
  TODO: ? Maybe I'll add an alternative proof with the (possibly) degenerate 
  expansion.
- 1_9.tex  
  Continuousness, openness of a linear mapping: First isomorphism theorem with 
  a closed space N (not necessarily the null space!).
- 1_10.tex  
  Continuousness, openess of a linear mapping onto a finite dimensional space.
  Not trivial, since the domain may be infinite-dimensional. 
- 1_14.tex  
  Alternative ways to the define topology of the test functions space D_K, 
  in the special case K=[0, 1].
- 1_16.tex   
  This is about showing that a function test topology is independent 
  from the "supremum seminorms" we consider. It is then more than an exercise, 
  it should be regarded as a very part of the textbook (sections 1.44, 1.46).
- 1_17.tex
  Given a multi-index $\alpha$, the differential operators $D^\alpha$ is 
  continuous in the test functions space topology.
- LICENSE
- HOWTO
