clear; close all; clc;
addpath(genpath(pwd));

n = 191;
phi = (mod(n, 5) + 1) * 2 * pi / 6;
theta = (mod(n, 8) + 1) *  pi / 17;
psi = (mod(n, 7) + 1) * 2 * pi / 8;

tm = 16;
t = 0:0.1:tm;

basis = [1, 0, 0;
         0, 1, 0;
         0, 0, 1];

transl = [1 2 3];

q1 = quaternion([0, pi/2, 0], 'euler', 'XYZ', 'point');
q2 = quaternion([psi, theta, phi], 'euler', 'XYZ', 'point');

q = SLerp(q1, q2, tm, t);

r1 = quatrotate(q, basis(1, :));
r2 = quatrotate(q, basis(2, :));
r3 = quatrotate(q, basis(3, :));

offset = [transl(1) * t/tm;
          transl(2) * t/tm;
          transl(3) * t/tm].';

figure;
H = plot3(offset(1, 1)+[0 r1(1, 1)], offset(1, 2)+[0 r1(1, 2)], offset(1, 3)+[0 r1(1, 3)], 'r-', ...
    offset(1, 1)+[0 r2(1, 1)], offset(1, 2)+[0 r2(1, 2)], offset(1, 3)+[0 r2(1, 3)], 'g-', ...
    offset(1, 1)+[0 r3(1, 1)], offset(1, 2)+[0 r3(1, 2)], offset(1, 3)+[0 r3(1, 3)], 'b-');
grid on;
hold on;
set(gca, 'XLim', [0, 2], 'YLim', [0, 3], 'ZLim', [0, 4]);
view(45, 20);

for ii = 2:length(t)
    set(H(1), 'XData', offset(ii, 1)+[0 r1(ii, 1)], 'YData', offset(ii, 2)+[0 r1(ii, 2)], 'ZData', offset(ii, 3)+[0 r1(ii, 3)]);
    set(H(2), 'XData', offset(ii, 1)+[0 r2(ii, 1)], 'YData', offset(ii, 2)+[0 r2(ii, 2)], 'ZData', offset(ii, 3)+[0 r2(ii, 3)]);
    set(H(3), 'XData', offset(ii, 1)+[0 r3(ii, 1)], 'YData', offset(ii, 2)+[0 r3(ii, 2)], 'ZData', offset(ii, 3)+[0 r3(ii, 3)]);
    drawnow;
    pause(0.01);
end