upd:upsert
p:5010
h:@[hopen;p;{-1"Error: Failed to connect to port ",string p}]
if[h>0;h(`.u.sub;`);-1"Connected and subscriebed to all tables"]


/sub:h(`.u.sub;`;`)
/sub:{[t] h(`.u.sub;t);}
