function [qs_t] = SLerp(q1, q2, tm, t)
%SLerp Summary of this function goes here
%   Detailed explanation goes here

cos0 = dot(parts(q1), parts(q2));

if cos0 < 0
    cos0 = -cos0;
    q1 = -q1;
end

if cos0 > 0.95
    qs_t = q1;
else
    phi0 = acos(cos0);
    qs_t = sin(phi0*(1 - t/tm))/sin(phi0)*q1 + sin(phi0*t/tm)/sin(phi0);
end

end