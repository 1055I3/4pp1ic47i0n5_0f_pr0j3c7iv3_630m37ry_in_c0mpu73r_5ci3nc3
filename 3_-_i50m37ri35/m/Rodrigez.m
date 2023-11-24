function [A] = Rodrigez(p, phi)
%Rodrigez Returns rotation matrix.
%   Returns rotation matrix A for rotation around unit vector p for phi
%   angle.

if round(sumsqr(p), 1) ~= 1.0
    p = p / norm(p);
end

p_x = [0, -p(3), p(2);
       p(3), 0, -p(1);
       -p(2), p(1), 0];

% p*pt
R = p * p.';
% cos(phi)*(E-p*pt)
D = cos(phi) * (eye(3) - R);
% sin(phi)*p_x
G = sin(phi) * p_x;

A = R + D + G;
end