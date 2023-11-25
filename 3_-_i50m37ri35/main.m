addpath(genpath(pwd))

n = 191;
phi = (mod(n, 5) + 1) * 2 * pi / 6;
theta = (mod(n, 8) + 1) *  pi / 17;
psi = (mod(n, 7) + 1) * 2 * pi / 8;

% phi = - atan2(1, 4);
% theta = - asin(8/9);
% psi = atan2(4, 1);

fprintf('phi: %f\ntheta: %f\npsi: %f\n\n', phi, theta, psi);

A = Euler2A(phi, theta, psi);
disp('Euler2A:');
disp(A);

[p, tau] = AxisAngle(A);
disp('AxisAngle:');
disp(tau);
disp(p);

A = Rodrigez(p, tau);
disp('Rodrigez:');
disp(A);

[phi, theta, psi] = A2Euler(A);
disp('A2Euler:');
disp(phi);
disp(theta);
disp(psi);

q = AxisAngle2Q(p, tau);
disp('AxisAngle2Q:');
disp(q);

[p, tau] = Q2AxisAngle(q);
disp('Q2AxisAngle:');
disp(tau);
disp(p);