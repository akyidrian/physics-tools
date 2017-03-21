function [linear_func, coeffs, uncertainties, chi2]=linearfit(data)
sigma=data(:,3)';
x_data=data(:,1)';y_data=data(:,2)';
N=length(x_data);

M = 2;	% Number of coefficients
basis_func = zeros(M,N);
basis_func(1,:) = 1.0;
basis_func(2,:) = x_data;
linear_func = @(a, x) a(1) + a(2).*x; 

%
%   Find alpha, beta and determine coeffs. Also find Chi Squared value.
%
[alpha, beta] = find_chi2_min_params(basis_func, y_data, sigma);
[coeffs, uncertainties] = determine_model_coeffs(alpha, beta);
chi2 = calc_chi2(coeffs, linear_func, x_data, y_data, sigma);
end

