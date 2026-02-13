/ client1.q
h:hopen 5010
	
upd:{[t;x]
 1"Received update for ",string[t]," of ",string[count x]," records";
 t upsert x;
 }
	  
sub:{[t] h(`.u.sub;t);}

/after subscribing:
count trade
count quote


