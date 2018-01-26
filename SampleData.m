
%% Load the data from Csv file

data= csvread('test.csv');
X = data(:,1);
y = data(:,2);

fprintf("Plotting the data");

plot(X,y,'rx','Markersize',10);
xlabel('X Data');
ylabel('Y Data');

%% Adding extra columns to X

X=[ones(length(X),1) X];

%% Initialize theta, alpha and num_iter

theta=zeros(columns(X),1);
alpha=0.01;
num_iter=200;

%% Calculate the gradient Descent
[ theta, J_history] =computeGradinetDescent(X,y,theta,alpha,num_iter);


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
end

function J = computeCostMulti(X,y,theta)

%%This is function for calcaulting the cost function of the linear regression.
%%This will take 3 inputs, X,y,theta and will calcaulte the cost of  for given set of theta.
%%Formula for cost function j(theta)=(1/2m)Sum(h(theta)-y)^2

m=length(y);
prediction = X * theta;
squaredErrorValue=(prediction.-y)^2;

J = (1/(2*m))*sum(squaredErrorValue);

end