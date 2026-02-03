

print:{[msg] -1 string[.z.p], " ",string[.z.w]," ",msg;} // important}
print "hey"
// result: 2026.02.03D10:55:20.489232000 0 hey

print:{[msg] -1 " "sv(string .z.p;string .z.w;msg);}
// same as above

print:{[msg] -1 sv[" ";(string .z.p;string .z.w;msg)];} // good if beed to add something to end 

//ports
// \p 2345
/ h:hopen 2345
//h(`print;"remote caller")

// result: same but 8 and message

/// amend it ^^^
//q).log.info"Testing my info function"
//2025.08.20D14:37:22.312882000 INFO 0 Testing my info function
//q)
//q).log.error"There has been a problem"
//2025.08.20D14:37:30.735518000 ERROR 0 There has been a problem

/ process 1
q log.q -p 1234		/ or whatever port you like

/ process 2
// q)h:hopen 1234
// q)neg[h](`.log.info;"Testing a remote log call")

//get[func;arg1;arg2;argn]
//0[func;arg]^^ same as above 
//"ij"$10 20 - does one of each
//"ij"$/:10 20 - does to all




\d .log

print:{[msgTyp;msg] -1 " "sv(string .z.p;msgTyp;string .z.w;msg);}
info:{[msg] print["INFO";msg]}
error:{[msg] print["ERROR";msg]}

\d .


h:hopen 2345
