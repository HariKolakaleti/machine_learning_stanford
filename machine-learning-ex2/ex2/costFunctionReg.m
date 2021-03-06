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


% theta(1) is not included in the lambda term, set to 0
theta_l = theta;
theta_l(1) = 0;

h = sigmoid(theta' * X');
J = (-1/m) * ( log(h) * y + log(1 - h) * (1 - y) ) + lambda/(2 * m) * sum( theta_l .^ 2 );

diff = (h' - y)';
grad = (1/m) * (diff * X)' + (lambda/m) * theta_l;

% =============================================================

end
