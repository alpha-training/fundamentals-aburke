\d .log

print:{[msgTyp;msg] -1 " "sv(string .z.p;msgTyp;string .z.w;msg);}
info:{[msg] print["INFO";msg]}
error:{[msg] print["ERROR";msg]}

\d .

/ process 1
\p 1234
q .\log.q -p 1234 /run in PowerShell

/
Peter's Comments:

This is really good! The only thing I would do differently - this is into the last 1% here - is omit the lambda (curly) and square brackets when defining info and error:

info:print"INFO"
error:print"ERROR"

This is largely just aesthetic preference - q programmers like using as few characters as possible!