set P;
set R;

param supply{i in P};

param demand{j in R};

param fixed_c{i in P};

param c{i in P, j in R};

var x{i in P, j in R} >= 0;


minimize cost: sum{i in P, j in R} (c[i,j] * x[i,j] + x[i,j]*fixed_c[i]);
s.t. supply_constraint{i in P} : sum{j in R} x[i,j] <= supply[i];
s.t. demand_constraint{j in R} : sum{i in P} x[i,j] >= demand[j];


solve;

data;

set P := S1 S2 S3 S4;

set R := F1 F2 F3;

param fixed_c :=
	S1 0.12
S2 0.15
S3 0.1
S4 0.13;
	
param supply :=
        S1 10000
S2 14000
S3 5000
S4 10000;


param demand :=
	F1 4000
F2 11000
F3 19000;


param c :
     F1      F2    F3:=
S1   400     700   850
S2   120     340   760
S3   500     500   680
S4   790     360   400;
			     
end;


