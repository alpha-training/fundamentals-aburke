h:hopen 5010

\d .f

SYMS:`JPM`MSFT`TSLA`AAPL

COLS_DICT:`trade`quote!(`time`sym`size`price;`time`sym`bid`ask`bidSize`askSize)

genTrade:{N:1+rand 1000;(N#.z.p;N?SYMS;N?1000j;N?100f)}
genQuote:{N:1+rand 1000;(N#.z.p;N?SYMS;N?100f;N?100f;N?1000j;N?1000j)}

pub:{[t;d]neg[.f.h](`.u.upd;t;d)}

\d .

.f.h:h

.z.ts:{.f.pub'[`trade`quote;(.f.genTrade[];.f.genQuote[])]}

\t 100

