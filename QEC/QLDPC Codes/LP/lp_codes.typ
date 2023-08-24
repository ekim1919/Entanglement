#import "tufte-handout.typ": template, margin-note
#import "personal_thm_envs.typ": *

#let topic = "Lifted Product Codes"

#show: doc => template(title: "Notes on " + topic, doc)
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")

= Quasi-Cyclic Codes

Let $AA_L$ be the ring of circulants defined to be $L times L$ matrices of the form: $ a_0 lambda_L^0 + a_1 lambda_L^1 + a_2 lambda_L^2 + dots + a_(L-1) lambda_L^(L-1) $ where $lambda_L$ is defined to be the permutation matrix where we cyclically permute the columns according to $(0 1 dots L-1)$. In this case, we index the columns of our matrix starting at zero. The $a_i in {0,1}$ are defined as binary coefficients, and we interpret $lambda_L^0$ to be the identity element $I_L$.

Define $AA_L^(m' times n')$ as a _protograph_ where
