function [error_test] = ...
    testError(X, y, Xtest, ytest, lambda_vec, error_val)
% Given an array of lambda values and CV errors, finds the value of 
% lambda which minimizes error_val and the correspond test error. 
% Returns an array with test errors for each value of lambda.




%%%%%% finds value of lambda which minimizes CV error
[temp, imin] = min(error_val);

fprintf('Best value of lambda = %f)\n', lambda_vec(imin));



%%%%%% computes test set error at each value of lambda
error_test = zeros(length(lambda_vec), 1);

for i = 1:length(lambda_vec),
	% learn theta 
	[theta] = trainLinearReg(X, y, lambda_vec(i));

	% get test error 
	error_test(i) = linearRegCostFunction(Xtest, ytest, theta, 0);
end;


%%%%%% min value of test error
error_test_min = min(error_test);
fprintf('min(test error) = %f)\n', error_test_min);

fprintf('test error for best lambda = %f)\n', error_test(imin));



% =========================================================================

end
