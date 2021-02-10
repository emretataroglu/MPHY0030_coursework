close all;
clear;
clc;

% Random x vector
x = [1,3,5];

% Generate coefficients
a = [1,2,3,4,5,6,7,8,9,10];

% Initialise variables for gradient descent function
tolerance = 10^-3;
step_size = 10^-6;
max_iteration = 10^6;

new_val = gradient_descent(@quadratic_polynomial,x,step_size,max_iteration,tolerance,@finite_difference_gradient,a);
disp(new_val)

% f
% f = quadratic_polynomial(x,a);
