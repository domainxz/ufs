% CORRESPONDENCE INFORMATION
%    This code is written by Shiming Xiang
% 
%    Address:    FIT Building 3-120 Room
%                     Tsinghua Univeristy, Beijing, China, 100084
%    Email:        smxiang@gmail.com

%    COPYRIGHT NOTICE
%    LSE code -- (c) 2005-2007 Shiming Xiang, Feiping Nie, Changshui Zhang  and Chunxia Zhang
%
%    This software can be used freely for research purposes.
%    Published reports of research  using this code (or a modified version) should cite the 
%    article that describes the algorithm: 
%
%    Shiming Xiang, Feiping Nie, Changshui Zhang and Chunxia Zhang. 
%    Nonlinear Dimensionality Reduction with Local Spline Embedding. 
%    IEEE Transactions on Knowledge and Data Engineering(TKDE), Volume 21, Issue 9, Pages 1285-1298, 2009. 

%    Comments and bug reports are welcome.  Email to smxiang@gmail.com. 
%    I would also appreciate hearing about how you used this code, 
%    and the improvements that you have made to it, or translations into other languages.    

%   WORK SETTING:
%    This code has been compiled and tested using matlab 6.5  and matlab    7.0

%==========================================================================



function LL = calcu_coeff_matrix_spline(X)
% X: all the points in a nieghborhood, here thay are expressed in low-dimensional space
%    In X, each column is a data point, 

% LL:    return the inverse matrix
[d, num] = size(X);

dd = num + 1 + d;               % for each components there have dd parameters to be estimated


X2 = sum(X.^2, 1);
distance = repmat(X2, num, 1) + repmat(X2', 1, num) - 2 * X'* X;

distance   = distance .* log(distance + 0.00001) + 0.0001 * eye(num);

%construct the coefficient matrix

P = ones(num, 1);
P = [P, X'];                 % add the column

C = zeros(d + 1, d + 1);

L = [distance, P; P', C];

% calculate the inverse of "L"
% note that we can use nystorm method to do it,
% here we use the normal method since L is non-sigular

LL = inv(L);

return





