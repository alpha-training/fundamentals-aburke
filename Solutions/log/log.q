\d .log

print:{[msgTyp;msg] -1 " "sv(string .z.p;msgTyp;string .z.w;msg);}
info:{[msg] print["INFO";msg]}
error:{[msg] print["ERROR";msg]}

\d .

/ process 1
\p 1234
