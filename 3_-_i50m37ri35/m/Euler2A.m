function [A] = Euler2A(phi, theta, psi)
%Euler2A Calculates rotation matrix given the Euler angles
%   Receives on the input phi, theta, psi Euler angles and calculates
%   rotation matrix

sin_phi = sin(phi);
sin_theta = sin(theta);
sin_psi = sin(psi);

cos_phi = cos(phi);
cos_theta = cos(theta);
cos_psi = cos(psi);

R_x = [1, 0, 0;
       0, cos_phi, -sin_phi;
       0, sin_phi, cos_phi];

R_y = [cos_theta, 0, sin_theta;
       0, 1, 0;
       -sin_theta, 0, cos_theta];

R_z = [cos_psi, -sin_psi, 0;
       sin_psi, cos_psi, 0;
       0, 0, 1];

A = R_z * R_y * R_x;
end