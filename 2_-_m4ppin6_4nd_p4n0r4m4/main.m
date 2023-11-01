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
disp('DLT algorithm output:');
P_dlt = dlt_algorithm(trapezoid, rectangle);
P_dlt_scaled = P_dlt / P_dlt(1, 1) * P_naive(1, 1);
disp(P_dlt_scaled);

% testing normalized dlt algorithm and scaling for comparison
disp('Normalized DLT algorithm output:');
P_dlt_normalized = normalized_dlt(trapezoid, rectangle);
P_dlt_normalized_scaled = P_dlt_normalized / P_dlt_normalized(1, 1) * P_dlt_scaled(1, 1);
disp(P_dlt_normalized_scaled);

% ... with more than 4 vertices
trapezoid = [-3, -1, 1;
             3, -1, 1;
             1, 1, 1;
             -1, 1, 1;
             1, 2, 3;
             -8, -2, 1];

rectangle = [-2, -1, 1;
             2, -1, 1;
             2, 1, 1;
             -2, 1, 1;
             2, 1, 4;
             16, -5, 4];

% testing dlt algorithm and scaling for comparison with naive algorithm
disp('With 6 points - DLT algorithm output:');
P_dlt = dlt_algorithm(trapezoid, rectangle);
disp(P_dlt);

% testing normalized dlt algorithm and scaling for comparison
disp('With 6 points - Normalized DLT algorithm output:');
P_dlt_normalized = normalized_dlt(trapezoid, rectangle);
P_dlt_normalized_scaled = P_dlt_normalized / P_dlt_normalized(1, 1) * P_dlt(1, 1);
disp(P_dlt_normalized_scaled);