q ipc.q

`.ipc.conns insert(`server1`server2;5001 5002;0N 0Ni);  / put whatever you like here
.ipc.conn`server1   / first try when no process is up
/ should return a null int (0Ni)
.ipc.conns
/ the table should have nulls in the handle column
/ now start up server1
.ipc.conn`server1
/ should return a non null int
.ipc.conns
/ the handle for this process should be populated
.ipc.conn`server1
/ should return the same handle as before, should not connect again!
/ now kill the server1 process
.ipc.conn`server1
/ the handle columns should be all nulls again if your .z.pc event fired

.ipc.conn`server2
.ipc.conns