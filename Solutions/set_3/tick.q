\p 5010

\d .u

COLS_DICT:()!()
COLS_DICT[`trade]:`time`sym`size`price
COLS_DICT[`quote]:`time`sym`bid`ask`bidSize`askSize

upd:{[t;x]
 if[type x in 0h;'"this must be a list of lists"];
 a: flip COLS_DICT[t]!x;
 {[t;d;h] (neg h)(`upd;t;d)}
 }

w:(0#`)!()

sub:{[t] $[11=type t;.z.s each t;w[t]:distinct w[t],.z.w]}

.z.pc:{w::w except'x}

\d .


/ use this to tutn lists to col dict LIST_OF_SYMS!COLUMN_LISTS
/ use this in the terminal: q tick.q -e 1

//1. Open a connection to the tickerplant on 5010

//2. Generate up to 1000 records for the trade and quote tables 10 times 
//per second. The number of records it generates on each tick of the 
//timer should be random for each table e.g. on the first tick it might 
//generate 209 records for quote, and 538 for trade, then 100ms later, 
//it sends different numbers

//3. The columns should correspond to the COLS_DICT in the tickerplant. 
//The types will be time(stamp), sym(bol), any columns containing the 
//word size should be longs, and the price/bid/ask columns should be 
//floats

//4. Publish the data it generates to the tickplerplant for each table 
//name. It should do this with an asynchronous call (negative handle) 
//of the .u.upd function on the tickplerplant, remembering that .u.upd 
//expects a table name (e.g. `trade) and the data.