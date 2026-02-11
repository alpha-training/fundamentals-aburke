\p 5010

\d .u

COLS_DICT:()!()
COLS_DICT[`trade]:`time`sym`size`price
COLS_DICT[`quote]:`time`sym`bid`ask`bidSize`askSize

upd:{[t;x] $[type x;"this must be a list of lists";neg[w t]@\:(`upd;t;flip COLS_DICT[t]!x)];}

w:(key COLS_DICT)!count[key COLS_DICT]#()

sub:{[t] $[11=type t;.z.s each t;[w[t]:distinct w[t],.z.w;(t;COLS_DICT t)]]}

.z.pc:{w::w except'x}

\d .


/
Before review had this for upd function:
upd:{[t;x]
 if[type x;'"this must be a list of lists"];
 a: flip COLS_DICT[t]!x;  
 (neg w t)@\:(`upd;t;a);}