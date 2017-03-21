function chi2 = calc_chi2(coeffs, model_func, x_data, y_data, sigma)
%
%   Calculates the Chi Squared value using the data and model. model_func
%   is a anonymous function with inputs coeffs and x_data. For example,
%   model_func = @(a, x) a(1) + a(2)*x + a(3)*x^2 + a(4)*x^3. A model
%   function is useful in cases where this function is needed to be called
%   several times such as with fminsearch and fminunc.
%
%   Author: Aydin Arik 2015
%
    y_model = model_func(coeffs, x_data);
    y_data_model_diff = y_data - y_model;
    chi2 = sum((y_data_model_diff./(sigma)).^2);
end