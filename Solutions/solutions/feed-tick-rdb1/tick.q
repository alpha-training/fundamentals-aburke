\p 5010

\d .u

COLS_DICT:()!()
COLS_DICT[`trade]:`time`sym`size`price
COLS_DICT[`quote]:`time`sym`bid`ask`bidSize`askSize

upd:{[t;x] $[type x;"this must be a list of lists";neg[w t]@\:(`upd;t;flip COLS_DICT[t]!x)];}

w:(key COLS_DICT)!count[key COLS_DICT]#()

sub:{[t] if[t~`;t:key COLS_DICT];$[11=type t;.z.s each t;[w[t]:distinct (),w[t],.z.w;(t;COLS_DICT t)]]}
type each .u.w
.z.pc:{w::w except'x}

\d .



select func, lastRun, nextRun, error from .cron.jobs