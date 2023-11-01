function [normalization_matrix] = normalize(vertices)
%normalize Calculates normalization matrix
%   Takes vertices on the input and returns normalization matrix

[n, ~] = size(vertices);
affine_vertices = vertices(:, 1:2)./vertices(:, 3);

% calculate center of mass C(x, y) for the given system of vertices M[i]
C = sum(affine_vertices)/n;

% calculate average vertex distance from the C center of mass
r = norm(affine_vertices - C)/n;

% scale so that distance from coordinate origin is sqrt 2
S = sqrt(2)/r;

% return normalization matrix
normalization_matrix = [S, 0, -S*C(1);
                        0, S, -S*C(2);
                        0, 0, 1];
% this is actually composition of scaling and translation
end