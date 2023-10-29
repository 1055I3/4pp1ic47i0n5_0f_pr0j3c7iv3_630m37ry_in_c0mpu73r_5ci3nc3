addpath(genpath(pwd))

trapezoid = [-3, -1, 1;
             3, -1, 1;
             1, 1, 1;
             -1, 1, 1];

rectangle = [-2, -1, 1;
             2, -1, 1;
             2, 1, 1;
             -2, 1, 1];

disp(naive_algorithm(trapezoid, rectangle))