function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

% extract features as 1D vectors with all data
x0=X(:,1);
x1=X(:,2);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    % hypothesis, col. vector
    h=theta(1)*x0+theta(2)*x1;

    % be careful to step all theta components simultaneously
    sum0=(h-y).*x0;
    sum1=(h-y).*x1;
    theta(1)=theta(1)-alpha/m*sum(sum0);
    theta(2)=theta(2)-alpha/m*sum(sum1);



    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
