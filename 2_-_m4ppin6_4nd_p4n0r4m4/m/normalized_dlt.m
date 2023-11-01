function [projection_matrix] = normalized_dlt(figure, projection)
%normalized_dlt Normalized version od DLT algorithm
%   Takes figure and its projection on input and returns projection matrix

% normalize original points M[i] = T*M[i]] using transformation T
T_fig = normalize(figure);
M_fig = transpose(T_fig * figure.');

% normalize projections of points M[i]' = T'*M[i]' using T'
T_pro = normalize(projection);
M_pro = transpose(T_pro * projection.');

% using DLT algorithm calculate transformation matrix P using M_[i] <-> M_[i]'
P = dlt_algorithm(M_fig, M_pro);

% the projection matrix we were looking for is inv(T') * P_ * T
projection_matrix = T_pro\(P*T_fig);
end