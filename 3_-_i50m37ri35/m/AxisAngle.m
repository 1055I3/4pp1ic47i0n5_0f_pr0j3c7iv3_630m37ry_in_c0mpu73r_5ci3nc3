function [p, phi] = AxisAngle(A)
%AxisAngle Calculates unit vector p = (px; py; pz) and angle phi in [0; pi] so that A = Rp(phi)
%   It takes rotation matrix and calculates vector and rotation angle.

% check if A is motion matrix
if all(round(A*A.', 1) == eye(3), 'all') && (round(det(A), 1) == 1.0)
    % find unit eigenvector p
    X = A - eye(3);

    r = X(1, :);
    q = X(2, :);

    p = cross(r, q);

    % if r and q are linearly dependant
    if all(p == [0, 0, 0], 'all')
        q = X(3);
        p = cross(r, q);
    end

    % take vector p normal on vector u
    p = p / norm(p);
    u = r / norm(r);

    % find u' image of vector u
    u_prim = A * u.';

    % find angle phi between vectors u and u'
    phi = acos(dot(u, u_prim));

    % check orientation to see if the rotation is in positive direction
    if dot(u, cross(u_prim, p)) < 0
        p = -p;
    end
else
    % if the matrix is not motion return nothing
    p = NaN(1, 3);
    phi = NaN;
end

end