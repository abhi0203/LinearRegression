function J = computeCostMulti(X,y,theta)

%%This is function for calcaulting the cost function of the linear regression.
%%This will take 3 inputs, X,y,theta and will calcaulte the cost of  for given set of theta.
%%Formula for cost function j(theta)=(1/2m)Sum(h(theta)-y)^2

m=length(y);
prediction = X * theta;
squaredErrorValue=(prediction.-y)^2;

J = (1/(2*m))*sum(squaredErrorValue);

end;