function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
%C = 1;
%sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% INITIALIZES RELEVANT ARRAYS
% ============================

% grid of C and sigma
nmodels=3; %10	% number of models to be evaluated
Cgrid=logspace(-2,1.5,nmodels);
sigmaGrid=Cgrid;

% total model fits
n=numel(Cgrid)*numel(sigmaGrid);

% array of CV errors
errorVal=zeros();


% LOOP OVER C AND SIGMA
% =======================
counter=0;
for i=1:numel(Cgrid),
	for j=1:numel(sigmaGrid),
		w=waitbar(counter/n, "Model fitting, C=");

		C=Cgrid(i);
		sigma=sigmaGrid(j);

		% fit model to training data
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 

		% compute error from CV set:
		% 1. returns the predictions on the cross validation set
		predictions = svmPredict(model, Xval);

		% 2. computes the prediction error using 
		errorVal=mean(double(predictions ~= yval));


		%find C,sigma for which min(error_val)

		counter=counter+1;
		% erases progress bar
		delete(w);
end;












% =========================================================================

end
