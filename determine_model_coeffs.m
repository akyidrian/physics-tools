function [coeffs, uncertainties] = determine_model_coeffs(alpha, beta)
%
%   Calculates the model's coefficients and the coefficient's uncertainties.
%
%   Author: Aydin Arik 2015
%
    covariance_matrix = inv(alpha);
    coeffs = covariance_matrix*beta;	% the fitted coefficients
    uncertainties = sqrt(diag(covariance_matrix));	% uncertainties for each coefficient
end