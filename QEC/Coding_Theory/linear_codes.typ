#import "theorems.typ": *

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8")
)
#let lemma = thmbox(
  "theorem",            // Lemmas use the same counter as Theorems
  "Lemma",
  fill: rgb("#efe6ff")
)
#let corollary = thmbox(
  "corollary",
  "Corollary",
  base: "theorem",      // Corollaries are 'attached' to Theorems
  fill: rgb("#f8e8e8")
)

#let definition = thmbox(
  "definition",         // Definitions use their own counter
  "Definition",
  fill: rgb("#e8f8e8")
)


#show heading: it => [
  #rect(outset: 2.5pt)[#it]
  #v(5pt)
]

= Basics

We will first introduce linear codes over binary vector spaces. We identify a binary vector space of dimension $n$ as $FF_2^n$. For a linear map $H$, we denote $[H]$ as a matrix representation of $H$ under the standard bases for $FF_2^k -> FF_2^(ell)$.

#definition[
A _linear code_ is defined by a linear map $H: FF_2^n -> FF_2^m$. The _code space_ is defined as $cal(C) = "Ker"(H)$. We can identify a embedding $C: FF_2^k -> FF_2^n$ understood as the encoding transformation from $k$ bits to codewords of length $n$ bits. Hence,

$ [H][C] = bold(0) $
]

+ The columns of $[C]$ will be _linearly independent_ codewords of the code $cal(C)$, which we make no distinction between the codespace $cal(C)$ and the code itself.

+ The rows of $[H]$ will span $C^perp$. Hence, it becomes evident that $[H][C] = bold(0)$. By taking transpose of the composed linear map $[H compose C] = bold(0)$, we arrive at the identity $[C]^T [H]^T = bold(0)$. This is essentially taking all rows spanning the orthogonal complement and flipping them into column vectors in $[H]^T$. Hence, by naturally assigning $cal(C)^perp = "Img"([H]^T)$ and the columns of $[C]$ to be linearly independent row vectors of $[H^perp]$.
