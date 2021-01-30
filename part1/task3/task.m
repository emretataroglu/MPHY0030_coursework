close all;
clear;
clc;

format SHORTG

% Random x vector
x = [5, 3, 1];

% Generate coefficients
a = randn(1,10);

% Initialise variables for gradient descent function
tolerance = 10^5;
step_size = 10^-2;
max_iteration = 10^3;

% Acquire function
f = quadratic_polynomial(x,a);

new_val = gradient_descent(f,x,step_size,max_iteration,tolerance);

gradient = finite_difference_gradient(new_val,a);


