function [alpha, beta] = find_chi2_min_params(basis_func, y_data, sigma)
%
%   Calculates and returns Chi Squared minimisation parameters alpha (MxM)
%   and beta (Mx1). basis_func is required to be MxN with a particular
%   row-column being a particular term in the basis function evaluated at
%   a given x_data (1xN) point.
% 
%   For example, with a set of polynomial basis functions (M=4) and x_data
%   (1xN), basis_func should look like:
%       basis_func = zeros(M,N);
%       basis_func(1,:) = 1;
%       basis_func(2,:) = x_data;
%       basis_func(3,:) = x_data.^2;
%       basis_func(4,:) = x_data.^3;
%
%   Author: Aydin Arik 2015
%
    [M, N] = size(basis_func);
    
    alpha = zeros(M,M);
    beta = zeros(M,1);
    for k = 1:M,
        for j = 1:M,
            alpha(k,j) = sum(basis_func(j,:).*basis_func(k,:)./sigma.^2);  
        end
        beta(k) = sum(y_data.*basis_func(k,:)./sigma.^2);
    end
end