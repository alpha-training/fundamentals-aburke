/ pubsub1.q

\p 5010	

\d .u
.z.po:{-1"Handle connected on ",string x}

SYMS:`JPM`MSFT`TSLA`AAPL
	
w:(0#`)!()

sub:{[t] $[11=type t;.z.s each t;w[t]:distinct w[t],.z.w]}

pub1:{[t;d;h] neg[h](`upd;t;d)}
pub:{[t;d] pub1[t;d] each w t}
  
.z.pc:{w::w except'x;-1"Handle disconnected on ",string x}

trade:([]time:0#0Np;sym:0#`;size:0#0;price:0#0f)
quote:([]time:0#0Np;sym:0#`;bid:0#0f;bidSize:0#0;ask:0#0f;askSize:0#0)

genTrade:{
    N:1+rand 10;	
    ([]time:N#.z.p;sym:N?SYMS;size:N?10;price:N?10f)
    }

genQuote:{
    N:1+rand 10;	
    ([]time:N#.z.p;sym:N?SYMS;bid:N?10f;bidSize:N?10;ask:N?10f;askSize:N?10)
    }

\d .

.z.ts:{
  .u.pub[`trade;.u.genTrade`];
  .u.pub[`quote;.u.genQuote`];
 }
		
t\ 1000







