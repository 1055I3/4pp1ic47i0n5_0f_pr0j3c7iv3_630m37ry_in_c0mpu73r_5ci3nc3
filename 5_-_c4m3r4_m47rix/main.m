addpath(genpath(pwd));

M1 = [125, 35, 150, 1]; % screwdriver tip
M2 = [75, 40, 130, 1]; % tip of an upright pen
M3 = [158, 60, 6, 1]; % end of horizontal pen
M4 = [30, 62, 4, 1]; % tip of horizontal
M5 = [47, 135, 5, 1]; % usb memory
M6 = [140, 105, 13, 1]; % candy

M1p = [399, 55, 1];
M2p = [619, 49, 1];
M3p = [450, 650, 1];
M4p = [802, 449, 1];
M5p = [919, 617, 1];
M6p = [596, 729, 1];

originali = vertcat(M1, M2, M3, M4, M5, M6);
projekcije = vertcat(M1p, M2p, M3p, M4p, M5p, M6p);

T = CameraDLP(originali, projekcije);
T = T / T(1, 1);
disp('Camera matrix:');
disp(T);

[K, A, C] = ParametriKamere(T);
disp('Calibration matrix:');
disp(K);
disp('Orientation matrix:');
disp(A);
disp('Camera position - center:');
disp(C);