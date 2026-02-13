/ Inter-process communication
\l event.q
	
\d .ipc

conns:1!flip`name`port`handle!"sji"$\:()

conn:{[name]
      if[not null h:conns[name;`handle];:h];
      target:name;h:tryConnect[conns[name;`port]];
      if[not null h;update handle:h from`.ipc.conns where name=target;:h];h} /write in line name conns`port

tryConnect:{[port]@[hopen;port;{0Ni}]} /tryConnect:@[hopen;;0Ni] - shorter way to do it

disconnect:{[h]update handle:0Ni from`.ipc.conns where handle=h}

\d . /Feedback:potentially use a:conns for space saving

.event.addHandler[`.z.pc;`.ipc.disconnect] 