/ Inter-process communication
\l ../set_2/event.q
	
\d .ipc

conns:1!flip`name`port`handle!"sji"$\:()

conn:{[name]
      if[not null h:conns[name;`handle];:h];
      if[not null h:tryConnect conns[name;`port];
      update handle:h from `.ipc.conns where name=name;
      :h];h}

tryConnect:{[port]@[hopen;port;{0Ni}]}

disconnect:{[h]update handle:0Ni from `.ipc.conns where handle=h}

\d .

.event.addHandler[`.z.pc;`.ipc.disconnect]