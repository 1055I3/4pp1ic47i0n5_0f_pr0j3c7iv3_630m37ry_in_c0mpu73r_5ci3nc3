function [T] = CameraDLP(originali, projekcije)
%CameraDLP Calculates 3x4 camera matrix
%   For given n (n>=6) points in space and corresponding n projections in
%   pixel coordinates calculates 3x4 projection matrix

% for each correspondacne find 2*12 matrix for form 2n*12 matrix
A = [];

for ii = 1:length(originali)
    x = originali(ii, 1);
    y = originali(ii, 2);
    z = originali(ii, 3);
    t = originali(ii, 4);
    
    u = projekcije(ii, 1);
    v = projekcije(ii, 2);
    w = projekcije(ii, 3);
    
    a = [0, 0, 0, 0, -w*x, -w*y, -w*z, -w*t, v*x, v*y, v*z, v*t;
         w*x, w*y, w*z, w*t, 0, 0, 0, 0, -u*x, -u*y, -u*z, -u*t];
    
    A = vertcat(A, a);
end

% find SVD decomposition
[~, ~, V] = svd(A);

% projection matrix is the last colum of V matrix
T = reshape(V(:, end), 3, 4);

end