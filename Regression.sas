/* Sample data creation */
data research_data;
    input id $ x y;
    datalines;
    001 5 20
    002 3 15
    003 8 25
    004 7 30
;
run;

/* Linear regression analysis with PROC REG */
proc reg data=research_data;
    model y = x; /* Y is dependent, X is independent */
    output out=reg_results p=predicted_values r=residuals;
run;

proc print data=reg_results;
run;
