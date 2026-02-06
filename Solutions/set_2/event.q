\p 9010

//Q1
.z.po:{-1"Connection opened on a handle ",string x;}
.z.pc:{-1"Connection dropped: ",string x}
//working as expected when client connection opens and drops


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

/
test area


myOpenFunc1:{-1"Handle opened on ",string x;}
myOpenFunc2:{-1"Second handler for open on handle ",string x;}
myCloseFunc:{-1"Handle closed on ",string x;}
.event.addHandler[`.z.po;`myOpenFunc1]
.event.addHandler[`.z.po;`myOpenFunc2]
.event.addHandler[`.z.pc;`myCloseFunc]