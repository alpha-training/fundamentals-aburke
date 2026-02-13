myAbs:{
    $[0>type x;
    $[x<0;-1*x;x];
    .z.s each x]
    }

\
Peter's comments:

This is good, but convoluted. Remember that q is vectorised, so using .z.s or each isn't always necessary. You could get away with just the middle section:

myAbs2:{?[x<0;-1*x;x]}

Or even this:

myAbs3:{x|neg x}


Note the difference in time:

q)L:(1000000?100)*1000000?(1;-1)
q)L
62 94 27 -50 40 -32 88 -22 98 -53 28 -48 -7 40 69 -43 4 -65...

q)\t:50 myAbs L
11092
q)\t:50 myAbs2 L
143
q)\t:50 myAbs3 L
56