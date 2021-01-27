clear all
clc

r = gradient_descent(@finite_difference_gradient,[3,5,7],0.01,1000,0)