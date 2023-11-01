addpath(genpath(pwd))

% figure vertices
trapezoid = [-3, -1, 1;
             3, -1, 1;
             1, 1, 1;
             -1, 1, 1];

% projection vertices
rectangle = [-2, -1, 1;
             2, -1, 1;
             2, 1, 1;
             -2, 1, 1];

% testing naive algorithm
disp('Naive algorithm output:');
P_naive = naive_algorithm(trapezoid, rectangle);
disp(P_naive);

% testing dlt algorithm and scaling for comparison with naive algorithm
disp('DLT algorithm output:')
P_dlt = dlt_algorithm(trapezoid, rectangle);
P_dlt_scaled = (P_dlt / P_dlt(1, 1) * P_naive(1, 1));
disp(P_dlt_scaled);
