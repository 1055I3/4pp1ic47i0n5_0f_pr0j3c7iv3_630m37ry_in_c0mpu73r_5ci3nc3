function [p, phi] = Q2AxisAngle(q)
%Q2AxisAngle Calculates unit vector and angle for the given qaternion
%   Calculates unit vector p = (px; py; pz) and angle phi on [0; pi] such
%   that the quaternion represents rotation Rp(phi), ie. Cq = Rp(phi)

% normalize the quaternion if it is not normalized
if round(sumsqr(q), 1) ~= 1.0
    q = q / norm(q);
end

w = q(4);

% if cos(alpha) is negative it means that i'm rotating for an angle larger than pi
% in that case nagated quaternion will give the same rotation but for the smaller angle
if w < 0
    q = -q;
end

% rotation goes for 2*alpha angle
phi = 2 * acos(w);

% if w takes 1 or -1 values then the rotation goes for 0 or 2*pi which is identity
if abs(w) == 1
    p = [1, 0, 0];
else
    v = q(1:3);
    p = v / norm(v);

end