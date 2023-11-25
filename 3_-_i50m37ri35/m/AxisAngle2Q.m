function [q] = AxisAngle2Q(p, phi)
%AxisAngle2Q Returns unique quaternion for the given rotation
%   Returns unique quaternion q = (x; y; z; w) such that Cq = Rp(phi)
%   Vector p is unit vector

% normalize p if it is not a unit vector
if round(sumsqr(p), 1) ~= 1.0
    p = p / norm(p);
end

% the real part is cos(phi/2)
w = cos(phi / 2);
% the imaginary part is sin(phi/2)*(px, py, pz)
v = sin(phi / 2) * p;

% q is (x, y, z, w)
q = [v, w];

end