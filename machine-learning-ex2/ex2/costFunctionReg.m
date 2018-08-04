function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


% m x 1 
h=sigmoid(X*theta);

% here is an elegant solution to use the same expressions for
% all elements, including theta_0. Create a vector of lambdas,
% where element 1 is zero
Lambda=ones(size(theta))*lambda;
Lambda(1)=0;

% takes care to remove first element from theta, to avoid
% unnecessary penalizing
%thetaminus0=theta(2:end,1);
J=1/m*( -y'*log(h)-(1-y)'*log(1-h) ) + 1/(2*m)*Lambda'*theta.^2;

%grad=1/m*X'*(sigmoid(X*theta)-y) + 1/m*Lambda'.*theta; % for some reason this does not work!
grad=1/m*X'*(sigmoid(X*theta)-y) + lambda/m*theta;
grad(1)=grad(1)-lambda/m*theta(1);




% =============================================================

end
