function [K, A, C] = ParametriKamere(T)
%ParametriKamere Calculates camera parameters
%   For a given 3x4 camera matrix T calculates K, A, C camera parameters

T0 = T(:, 1:end-1);

% if it doesn't match up to the sign
if det(T0) < 0
    T = -T;
end

% finding nul space using minors (c1 : c2 : c3 : c4) = (+M1 : -M2 : +M3 : -M4)
c1 = det(T(:, 2:end));
c2 = -det([T(:, 1), T(:, 3), T(:, 4)].');
c3 = det([T(:, 1), T(:, 2), T(:, 4)].');
c4 = -det(T(:, 1:end-1));

c1 = c1/c4;
c2 = c2/c4;
c3 = c3/c4;

C = [c1, c2, c3];

% find qr decomposition of inverse of T0 matrix
[Q, R] = qr(inv(T0));

% if it doesn't match up to the sign
if R(1, 1) < 0
	R(1, :) = -R(1, :);
	Q(:, 1) = -Q(:, 1);
end
if R(2, 2) < 0
	R(2, :) = -R(2, :);
	Q(:, 2) = -Q(:, 2);
end
if R(3, 3) < 0
	R(3, :) = -R(3, :);
	Q(:, 3) = -Q(:, 3);
end

% matrix A is inverse of Q which is orthogonal and therefore its inverse is transposition
A = Q.';

% matrix K is inverse of R which is calculated by multiplying T0 with inverse of inverse of Q
K = T0 * Q;

if K(3, 3) ~= 1
    K = K / K(3, 3);
end

end