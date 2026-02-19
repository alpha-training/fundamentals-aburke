\l cron.q 
\p 5010

\d .u

COLS_DICT:()!()
COLS_DICT[`trade]:`time`sym`size`price
COLS_DICT[`quote]:`time`sym`bid`ask`bidSize`askSize
 
upd:{[t;x] $[type x;"this must be a list of lists";neg[w t]@\:(`upd;t;flip COLS_DICT[t]!x)];}

w:(key COLS_DICT)!count[key COLS_DICT]#()

sub:{[t] if[t~`;t:key COLS_DICT];$[11=type t;.z.s each t;[w[t]:distinct (),w[t],.z.w;(t;COLS_DICT t);]]}

endofday:{eod:.z.d-1;-1"Triggering EOD for date ", string eod;u_h:distinct (),raze value .u.w;u_h:u_h where u_h > 0;if[count u_h;neg[u_h] @\: (`.u.end; eod);-1"Signal sent";];}
.z.pc:{w::w except'x}

\d .
.u.endofdayPub:{.u.endofday[.z.d-1]}
.cron.add[`.u.endofdayPub; .z.p+00:00:10; 0D00:01:00]
