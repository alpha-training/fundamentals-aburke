/ Inter-process communication
\l ../set_2/event.q
	
\d .ipc

conns:1!flip`name`port`handle!"sji"$\:()

conn:{[name]
      if[not null h:conns[name;`handle];:h];
      target:name;h:tryConnect[conns[name;`port]];
      if[not null h;update handle:h from `.ipc.conns where name=target;
      :h];h}

tryConnect:{[port]@[hopen;port;{0Ni}]}

disconnect:{[h]update handle:0Ni from `.ipc.conns where handle=h}

\d .

.event.addHandler[`.z.pc;`.ipc.disconnect]