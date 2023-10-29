function [projection_matrix] = naive_algorithm(quadrangle, projection)
%naive_algorithm Simple algorithm that finds projection matrix for two
%quadrangles
%   It takes quadrangle and its projectin as an input and returns the
%   projection matrix.

% base to given quadrangle projection matrices
p1 = find_base_mapping(quadrangle);
p2 = find_base_mapping(projection);

% the projection is calculated as composition of
% the base to the original inverse projection and
% the base to the projected quadrangle
projection_matrix = dot(p2, inv(p1), 4);
end