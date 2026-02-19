upd:upsert
p:5010
h:@[hopen;p;{-1"Error: Failed to connect to port ",string p}]
if[h>0;neg[h](`.u.sub;`);-1"Connected and subscriebed to all tables"]

.u.end:{[d] -1 ".u.end called for date ",string d;savetable[d;]each tables`.;};
 
savetable:{[d;t] -1"Saving ",(string t)," table for date ",(string d);
                 -1"Count of ",(string t)," is ", string count value t;
                 path:`$":data/",(string d),"/",string t;
                 path set value t;
                 @[`.;t;0#];
                 -1 (string t)," table saved and cleared.";};