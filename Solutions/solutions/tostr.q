tostr:{
    $[0=type x;
    .z.s each x;
    $[10=type x;
    x;
    string x]]
    }

/
you don't need two if-else statements

$[if;if-true;else-if...] and so on, you can keep chaining these
when calling a function on an argument multiple types, try to do it once, and re-use the variables

also worth handling the tostr "f" single character case
and finally, just mind indentation, to make it easier to read

/ here, the if checks are at one indent in
/ and the if-true statements are at two indentations in
tostr:{
    $[0=t:type x;
        .z.s each x;
    10=abs t;
        x;
    string x]
    }

or since it's such a short function, you could just do it all on one line

tostr:{$[0=t:type x;.z.s each x;10=abs t;x;string x]}
