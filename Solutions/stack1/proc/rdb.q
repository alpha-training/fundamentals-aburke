p:5010
h:@[hopen;p;{-1"Error: Failed to connect to port ",string p}]
if[h>0;neg[h](`.u.sub;`);-1"Connected and subscriebed to all tables"]

trade:([] time:0#0p;sym:0#`;size:0#0j;price:0#0.0;exchange:0#`)   
quote:([] time:0#0p;sym:0#`;bid:0#0.0;ask:0#0.0;bidSize:0#0j;askSize:0#0j;exchange:0#`)

ex:`N`L`T
upd:{[t;x] t upsert x,'([] exchange:(count x)?ex)}

if[()~key `:db/sym;`:db/sym set `$()]
.u.end:{[d] -1".u.end called for date ",string d;savetable[d;]each tables`.;};
 
savetable:{[d;t] 
        -1"Saving ",(string t)," table for date ",(string d);
        path:`$":db/",(string d),"/",(string t),"/";
        data:.Q.en[`:db] value t;
        data:update sym:`:sym?sym, exchange:`:sym?exchange from data;
        path set data;
        @[`.;t;0#];
        -1 (string t)," table saved and cleared.";}