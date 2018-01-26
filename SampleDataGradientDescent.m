function [theta, J_history]= computeGradinetDescent(X,y,theta,alpha,num_iter)

%% This is used to calculate the gradient descent.
%% Here based on the number of iterations, we will use the values of alpha, X and theta to calculate new values of theta.
%% Each time we calculate the nre values, we will send those values to cost finction and calculate the cost.

m=length(y);
J_history=zeros(num_iter,1);
for i=1,num_iter
	prediction = X*theta;
	errorValue= prediction.-y;
	disp(size(errorValue));
	sumErroredValue=sum(X' * errorValue);

	theta = theta - (alpha/m).* sumErroredValue;

	J_history(i)=computeCostMulti(X,y,theta);
end;
end;