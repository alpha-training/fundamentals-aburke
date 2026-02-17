/\p 9010

//Q1
.z.po:{-1"Connection opened on a handle ",string x;}
.z.pc:{-1"Connection dropped: ",string x}

//Q2
\d .event

handlers:(0#`)!()

addHandler:{[event;handler]
    $[not handler in key handlers;
    event set fire[event;];
    handlers[event];0#`;];
    handlers[event]:distinct handlers[event],handler;}

fire:{[event;arg]
    handlers[event] @\: arg;
    }

\d .
