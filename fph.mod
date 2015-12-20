set TIME;
set INITIAL_TIME;
set TOTAL_TIME;

var q{i in TIME} integer >= 0;
var z{i in TIME} binary;

/* Manufacturing capacity*/
param CAP{i in TIME};
/* Demand */
param D{i in TIME};
/* Inventory at the end of time period */
var I{i in TOTAL_TIME} integer >= 0;
/* Setup cost*/
param setup;
/* Holding cost for one time period*/
param h;
param M;
param initial_inventory;

minimize total_cost: sum{t in TIME} setup*z[t] + sum{t in TIME} h*I[t];
s.t. initial{t in INITIAL_TIME}: I[t] = initial_inventory;
s.t. conservation{t in TIME}: q[t] - D[t] + I[t-1] - I[t] = 0;
s.t. logic{t in TIME}: M*z[t] - q[t] >= 0;
s.t. max_capacity{t in TIME}: q[t] <= CAP[t];

solve;

printf '\n Results #############\n';

printf 'End Inventory : \n';
printf{t in TIME} ' Time period %d = %d \n', t, I[t-1] + q[t] - D[t];
printf '\n';

printf 'Setup Cost : \n';
printf{t in TIME} ' Time period %d = %d \n', t, z[t]*setup;
printf '\n';

printf 'Holding Cost : \n';
printf{t in TIME} ' Time period %d = %d \n', t, (I[t])*h;
printf '\n';

printf 'Total Setup Cost : \n';
printf '%.2f', sum{t in TIME} z[t]*setup;
printf '\n';

printf 'Total Holding Cost : \n';
printf '%.2f', sum{t in TIME}h*I[t];
printf '\n';







