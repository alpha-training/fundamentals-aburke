h:hopen 5010

SYMS:`JPM`MSFT`TSLA`AAPL

COLS_DICT:`trade`quote!(`time`sym`size`price;`time`sym`bid`ask`bidSize`askSize)

genTrade:{(N#.z.p;N?SYMS;N?1000j;(N:1+rand 1000)?100f)}
genQuote:{(N#.z.p;N?SYMS;N?100f;N?100f;N?1000j;(N:1+rand 1000)?1000j)}

pub:{[t;d]neg[h](`.u.upd;t;d)}

.z.ts:{pub'[`trade`quote;(genTrade[];genQuote[])]}

\t 100


/
Before review had this for genTrade (and similar for genQuote) function:
{N:1+rand 1000;(N#.z.p;N?SYMS;N?1000j;N?100f)}

