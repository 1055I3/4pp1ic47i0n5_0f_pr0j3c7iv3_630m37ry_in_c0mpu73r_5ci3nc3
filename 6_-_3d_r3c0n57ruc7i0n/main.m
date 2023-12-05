clear; close all; clc;

% left image
L1 = [765, 1395, 1];
L2 = [760, 1080, 1];
L3 = [467, 1249, 1];
L4 = [655, 1100, 1];
L5 = [1262, 1184, 1];
L6 = [1437, 686, 1];
L7 = [0, 0, 1]; % invisible point placeholder
L8 = [441, 920, 1];
L9 = [1308, 842, 1];
L10 = [1504, 296, 1];
L11 = [636, 59, 1];
L12 = [378, 562, 1];
L13 = [994, 609, 1];
L14 = [1222, 552, 1];
L15 = [0, 0, 1]; % invisible point placeholder
L16 = [921, 427, 1];
L17 = [1002, 465, 1];
L18 = [1238, 407, 1];
L19 = [1152, 224, 1];
L20 = [922, 281, 1];

% invisible points on the left image
L7 = cross(cross(mean([cross(cross(L5, L8), cross(L9, L12));
                       cross(cross(L5, L8), cross(L10, L11));
                       cross(cross(L9, L12), cross(L10, L11))], 2), L6), ...
           cross(mean([cross(cross(L5, L6), cross(L9, L10));
				       cross(cross(L5, L6), cross(L12, L11));
				       cross(cross(L9, L10), cross(L12, L11))], 2), L8));
L7 = L7 / L7(3);
L7 = round(L7); % because pixel coordinates have to be integers

L15 = cross(cross(mean([cross(cross(L13, L14), cross(L17, L18));
				        cross(cross(L13, L14), cross(L20, L19));
                        cross(cross(L17, L18), cross(L20, L19))], 2), L16), ...
	        cross(mean([cross(cross(L13, L16), cross(L17, L20));
				        cross(cross(L13, L16), cross(L18, L19));
				        cross(cross(L17, L20), cross(L18, L19))], 2), L14));
L15 = L15 / L15(3);
L15 = round(L15); % because pixel coordinates have to be integers

disp('invisible points on the left image:');
disp(L7);
disp(L15);

% right image
R1 = [361, 1110, 1];
R2 = [594, 923, 1];
R3 = [280, 869, 1];
R4 = [416, 791, 1];
R5 = [865, 1270, 1];
R6 = [1412, 1061, 1];
R7 = [0, 0, 1]; % invisible point placeholder
R8 = [507, 670, 1];
R9 = [899, 841, 1];
R10 = [1506, 625, 1];
R11 = [1052, 76, 1];
R12 = [498, 233, 1];
R13 = [860, 543, 1];
R14 = [1071, 623, 1];
R15 = [1163, 482, 1];
R16 = [0, 0, 1]; % invisible point placeholder
R17 = [876, 374, 1];
R18 = [1094, 457, 1];
R19 = [1184, 313, 1];
R20 = [973, 235, 1];

% invisible points on the right image
R7 = cross(cross(mean([cross(cross(R5, R8), cross(R9, R12));
				       cross(cross(R5, R8), cross(R10, R11));
				       cross(cross(R9, R12), cross(R10, R11))], 2), R6), ...
           cross(mean([cross(cross(R5, R6), cross(R9, R10));
                       cross(cross(R5, R6), cross(R12, R11));
				       cross(cross(R9, R10), cross(R12, R11))], 2), R8));
R7 = R7 / R7(3);
R7 = round(R7); % because pixel coordinates have to be integers

R16 = cross(cross(mean([cross(cross(R13, R14), cross(R17, R18));
				        cross(cross(R13, R14), cross(R20, R19));
                        cross(cross(R17, R18), cross(R20, R19))], 2), R15), ...
	        cross(mean([cross(cross(R14, R15), cross(R17, R20));
                        cross(cross(R14, R15), cross(R18, R19));
                        cross(cross(R17, R20), cross(R18, R19))], 2), R13));
R16 = R16 / R16(3);
R16 = round(R16); % because pixel coordinates have to be integers

disp('invisible points on the right image:');
disp(R7);
disp(R16);

% all points togeather in matrices
L = [L1; L2; L3; L4; L5; L6; L7; L8; L9; L10; L11; L12; L13; L14; L15; L16; L17; L18; L19; L20];
R = [R1; R2; R3; R4; R5; R6; R7; R8; R9; R10; R11; R12; R13; R14; R15; R16; R17; R18; R19; R20];

% based on these 8 points fundamental matrix F = FF is calculated
LL = [L5; L6; L7; L8; L17; L18; L19; L20];
RR = [R5; R6; R7; R8; R17; R18; R19; R20];


% equation yT F x = 0 is calculated from respective points l = (x1, x2, x3) and r = (x1, x2, x3) where coefficients (f11, f12, f13, f21, f22, f23, f31, f32, f33) of matrix F are variables
equations = zeros(8, 9);

for ii = 1:8
    x1 = LL(ii, 1);
    y1 = LL(ii, 2);
    z1 = LL(ii, 3);
    
    x2 = RR(ii, 1);
    y2 = RR(ii, 2);
    z2 = RR(ii, 3);

    % matrix with 8x9 format for 8 equations calculated from correspondences
    equations(ii, :) = [x1*x2, y1*x2, z1*x2, x1*y2, y1*y2, z1*y2, x1*z2, y1*z2, z1*z2];
end

% disp(equations8);

% SVD decomposition of the matrix with equations
[~, ~, V] = svd(equations);

% calculating fundamental matrix FF
FF = zeros(3, 3);
V = V(:, end);

for ii = 0:2
    for jj = 0:2
        FF(ii+1, jj+1) = V(3*ii+jj+1);
    end
end

% disp('fundamental matrix:');
% disp(FF);

% check if R.T * FF * L = 0
% C = ones(8, 1);
% for ii = 1:8
%     C(ii, 1) = round(RR(ii, :) * FF * LL(ii, :).', 5);
% end
% 
% disp(C.');
% disp(round(det(FF), 5));

% calculating epipoles
[U, S, V] = svd(FF);

e1 = V(:, end);
e1 = e1 / e1(end);

e2 = U.';
e2 = e2(:, end);
e2 = e2 / e2(end);

disp('epipoles:')
disp(e1);
disp(e2);

% necessary for det(FF) = 0 condition
S = [S(1), 0, 0;
     0, S(2), 0;
     0, 0, 0];

FF1 = U * S * V;

% disp('fundamental matrix')
% disp(FF1);

if abs(det(FF1)) < abs(det(FF))
    FF = FF1;
end

disp('fundamental matrix:');
disp(FF);

% triangulation