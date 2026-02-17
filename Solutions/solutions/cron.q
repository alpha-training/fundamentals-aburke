\l event.q

\d .cron

jobs:1!flip`func`start`period`lastRun`nextRun`error!"spnpp*"$\:()
add:{[func;start;period]jobs::jobs upsert (func;start;period;0Np;start;"")}
run1:{[job;now]
      err:@[{value[x]`;""};job;{x}];
      nextRun:"p"$now+jobs[job;`period];
      jobs[job;`lastRun`nextRun`error]:(now;nextRun;err)}

run:{run1[;x]each exec func from jobs where nextRun<x}

\d .
 
.event.addHandler[`.z.ts;`.cron.run] 

\t 1000


/ 
test commands
.tst.joiner:{.tst.times,:x}
.cron.add[`.tst.joiner;.z.p+00:00:03;0D00:00:05]
