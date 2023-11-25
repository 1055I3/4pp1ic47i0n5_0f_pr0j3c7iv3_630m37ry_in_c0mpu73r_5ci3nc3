function [phi, theta, psi] = A2Euler(A)
%A2Euler Calculates Euler angles.
%   For given orthogonal matrix A, calculates Euler angles psi, theta, phi,
%   respectively.

% check orthogonality condition
if round(det(A), 1) == 1.0
    % a31 is -sin(theta) and therefore it is a good indicator for gimbal lock
    a = A(3, 1);

    % for a31=1 it is Ox3 = Oz and the solution is not unique
    if a == 1
        phi = 0;
        theta = - pi / 2;
        psi = atan2(-A(1, 2), A(2, 2));
    % for a31=-1 it is Ox3 = -Oz and the solution is not unique
    elseif a == -1
        phi = 0;
        theta = pi / 2;
        psi = atan2(-A(1, 2), A(2, 2));
    % for a31<1 it is a31>-1 and unique solution exists
    else
        phi = atan2(A(3, 2), A(3, 3));
        theta = asin(- A(3, 1));
        psi = atan2(A(2, 1), A(1, 1));
    end
% if the matrix A is not orthogonal there is not solution
else
    phi = NaN;
    theta = NaN;
    psi = NaN;
end

end