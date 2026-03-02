allcols:{[tabledir] get hsym`$(string tabledir),"/.d"};

addCol:{[tabledir;colname;defaultvalue] 
    tabledir:hsym`$string tabledir; 
    colsInDir:allcols tabledir;
    if[not colname in colsInDir; 
        -1 "Adding column '", (string colname), "' with default '", (string defaultvalue), "' to ", string tabledir; 
        n:count get ` sv tabledir, first colsInDir;
        (` sv tabledir, colname) set n#defaultvalue; 
        @[tabledir; `.d; ,; colname]; 
        -1 "Column added successfully."; 
    ];
 };

delCol:{[tabledir;col]
    tabledir:hsym`$string tabledir; 
    colsInDir:allcols tabledir; 

    if[col in colsInDir;
        -1 "Deleting column '", (string col), "' from ", string tabledir;
        hdel` sv tabledir,col;
        @[tabledir;`.d;{x where not x=y};col];
        -1 "Column deleted successfully."; 
    ];
 };

