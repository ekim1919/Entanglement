#import "tufte-handout.typ": template, margin-note
#import "personal_thm_envs.typ": *

#let paper_title = "Degenerate Quantum LDPC Codes with Good Finite Length Performance"

#show: doc => template(title: "Notes on " + paper_title, doc)
#set heading(numbering: "1.")

= Notes on BP-OSD Decoding for qLDPC Codes.

#notation[Suppose $M$ is an $m times n$ matrix over $FF_2$. We denote $M_i$ as the $i^("th")$ column of $M$. Setting $ell in FF_2^n$ to be a row vector, $e_i$ naturally denotes the $i^("th")$ element of $e$.

Given an index set $I = {1 lt.eq i_0 < i_1 < dots < i_(k-1) < i_k lt.eq n}$, we denote $M_I ={M_i bar.v i in I}$ to be the submatrix resulting from picking the columns indexed by $I$. The same goes for $e_I$.]


== Classical BP-OSD

Classical BP-OSD decoding algorithms attempt to augment ordinary Belief Propagation (BP) algorithms by adding a Ordered Statistics Decoding (OSD) step either mid or post processing. The correctness hinges the idea of _information sets_ which are indices of a codeword such that the information presented in those indices is sufficient to identify the the total codeword. In more formal terms,

#definition[Let $cal(C)$ be a [n,k] classical code. The index set $I subset.eq [n]$ is deemed as an _information set_ if for any $c,c'$ where $c,c' in cal(C)$,
    $ c_I = c'_I arrow.l.r.double c = c' $]

Let $H,G$ be the parity check and generator matices for $cal(C)$. Through Gaussian elmination, $G$ can be shown to be of the form $[G'  I_k]$. The column space will be dimension $k$. Hence, any codeword can be determined from its values at $I$, so $|I| = k$.

Consequently, $I$ is an information set for $cal(C)$ iff $"rank"(G_I) = "rank"(G)$ iff $"rank"(H_J) = "rank"(H)$ where $J = overline(I)$ iff $cal(C)_I = {c_i bar.v c in cal(C)} = FF_2^k$.


For $I subset.eq [n]$, let $overline(I)$ denote its complement $[n] backslash I$. It is not to difficult to show that $overline(I)$ is an information set for the dual code $cal(C)^perp$. Furthermore, there is duality between information sets and their complements as evinced by the following equality:

$ op("arg max", limits: #true)_(I in cal(I)_G) sum_(i in I) w_i = op("arg min", limits: #true)_(J in cal(I)_H) sum_(i in J) w_i $

where $w_i$ are positive reals and $cal(I)_G$ consists of all the information sets over the columns of $G$ with $cal(I)_H$ defined similarly.

+ Information sets allow us to find a bijective function $xi^s_I$ which depends on a syndrome vector $s$ and an information set $I$. This function satisifies the property: $ y_I = x, H y =  s arrow.r.double y = xi^s_I(x) $

In other words, given the values of the error vector along $I$, $e_I$ and the syndrome values, we can find the _unique_ vector $e$ such that $H e = s$.

#proof[Fix an information set $I$. Let $e,e' in FF_2^n$ such that $e_I = e_I'$ and $H e = H e' = s$. Since $H (e + e') = s + s = 0$, it must be that $e+ e' in cal(C)$. However, all components of $e + e'$ referenced by $I$ must evaluate to zero. The unique vector $e$ can be found from $e_I$ by solving the linear system $H e =s$ with the coefficients with appropriate coefficients susbstituted according to the values of the "punctured" error vector $e_I$. ]

+ The _order_ _0_ BP-OSD decoder presented finds the unique error vector $e in FF_2^n$ which satisfies the following two conditions: Given a hard decision vector $hat(e) in FF_2^n$, an index set $I subset.eq [n]$, and a syndrome vector $FF_2^m$:

    - $e_I = hat(e)_I$
    - $H e = s$

where $e_I = [ e_i bar.v i in I ]$ is the "punctured" error vector at indices contained in set $I$. The hard decision vector can come from a BP decoder who finds the MLE (Maximum-likelihood Error).

+ The _order_ _w_ BP-OSD decoder performs a similar procedure except we take the $w$ least-reliable column indices computed by a fixed reliability metric, and instead of relying on specific hard decisions, we simply test all $2^w$ bit strings. The output will be the decoded error with the least weight. A specific instance is detailed in @sec_pv_bp_osd

== Pantaleev-Kalachev BP-OSD <sec_pv_bp_osd>

+ Classical BP decoders cause issues when decoding Quantum LDPC Codes due to the existence of $4$-cycles. There are ways to prune these cycles if the code is CSS, but the highly degenerate nature of the codes can still break BP decoding.
+ The authors attempt to rectify this hit in performance by enriching the classical BP decoder with Ordered Statistics Decoding (OSD) post-processing. This is a slight difference between the decoding algorithm presented here and the standard OSD decoders found in the classical decoding literature.

+ The reliability measure associated with bit $i$ is defined as $rho_i = PP[hat(e)_i = e_i]$ or the probability of the hard decision made on bit $i$ is indeed correct. Hence, the reliability of the total hard decision vector is set to be $rho = product_(i=1)^n rho_i$. The question is how do we find an information set $I$ which maximizes $rho_I = product_(i in I) rho_i$?
    Remember

#margin-note[Note that these modifications are tailored to be a sub-procedure during the decoding process for Quantum errors.]


