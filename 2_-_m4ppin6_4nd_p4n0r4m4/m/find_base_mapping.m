function [projection_matrix] = find_base_mapping(vertices)
%find_base_mapping Finds projection matrix from a base quadrangle to arbitrary.
%   Function takes 3x4 matrix where each row represents vertex coordinates.
%   Returns 3x3 projection matrix from a base quadrangle to to the given.

% first we take matrix with coordinates of A, B and C vertices in columns
matrix = vertices(1:3, 1:3).';
% we extract coordinates for D vertex in a separate variable
D = vertices(4, 1:3).';

% we search for non-zero alpha, beta, and gamma
% such that D = alpha*A + beta*B + gamma*C
X = linsolve(matrix, D);

% the projection matrix is the matrix that
% has alpha*A, beta*B, gamma*C in columns
projection_matrix = transpose(vertices(1:3, 1:3).*X);
end