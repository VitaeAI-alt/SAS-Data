/* Create two datasets */
data patients;
    input id $ age group $;
    datalines;
    001 35 A
    002 42 B
    003 28 A
    004 53 C
;
run;

data treatment;
    input id $ drug $ dosage;
    datalines;
    001 Aspirin 75
    002 Tylenol 500
    003 Aspirin 75
    004 Ibuprofen 200
;
run;

/* Merge datasets on 'id' */
proc sql;
    create table merged_data as
    select a.*, b.drug, b.dosage
    from patients as a
    inner join treatment as b
    on a.id = b.id;
quit;

/* Create a subset where age is over 40 and drug is 'Aspirin' */
data analysis_set;
    set merged_data;
    where age > 40 and drug = 'Aspirin';
run;

proc print data=analysis_set;
run;
