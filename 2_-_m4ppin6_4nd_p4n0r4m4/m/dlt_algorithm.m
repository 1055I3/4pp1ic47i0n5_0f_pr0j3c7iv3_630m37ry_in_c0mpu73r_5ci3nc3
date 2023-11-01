function [projection_matrix] = dlt_algorithm(figure, projection)
%dlt_algorithm Calculates projection matrix for given input
%   It takes figure and its projection and returns projection matrix.

[n, ~] = size(figure);
A = zeros(2*n, 9);

% for each correspondance M[i] <-> M'[i]
% find 2x9 matrix and write in matrix A
for k = 1:n
    x = figure(k, 1); y = figure(k, 2); z = figure(k, 3);
    u = projection(k, 1); v = projection(k, 2); w = projection(k, 3);
    
    A(2*k-1, :) = [0, 0, 0, -w*x, -w*y, -w*z, v*x, v*y, v*z];
    A(2*k, :) = [w*x, w*y, w*z, 0, 0, 0, -u*x, -u*y, -u*z];
end

% perform SVD decomposition
[~, ~, V] = svd(A);

% the P matrix is the last column of V matrix
projection_matrix = reshape(V(:, end), 3, 3);
end