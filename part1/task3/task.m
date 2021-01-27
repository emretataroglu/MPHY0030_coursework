close all;
clc;

function [theta] = gradient_descent(multi_func,initial_val,step_size,max_iter,tol,grad_func)


%% Main objective of this function is to minimise error function
% Error function - (((1/2)*N)*((grad_func-multi_func)*theta)^2)
% Given that N is the number of data points

%% Inputs
% step_size = alpha/learning rate
% max_iter = maximum number of iterations allowed

%% Initialising variables
norm_grad = inf; % Norm of gradient
iter = 0;
info_iter = true;

%%
while (tol <= norm_grad && iter <= max_iter)
    
    if iter == max_iter
        fprintf('Max iteration reached.')
    end
    
    % Step forward - update
    theta = initial_val - step_size*grad_func;
    
    % Display iteration - if not infinite
    if ~isinf(iter) == true && info_iter
        error('Error. Value is infinite!')
    else
        display(['Iterations: ' num2str(iter), 'Theta: ' theta])
    end
    
    % Update iteration and metrics
    iter = iter + 1;
    
    initial_val = theta;
    
    grad_func = gradient(multi_func);
    
    norm_grad = norm(grad_func);
    
end

end


% WORK IN PROGRESS
function [partial_der] = finite_difference_gradient(multi_func, vect)
    
    num_vect = numel(vect); % Total number of derivates
    
    for i = 1:num_vect
        
        partial_der(i) = diff(@(xi) multi_func(swap_vect(vect,i,xi),vect(i)));
        grad_func = vect(2) - vect(1);
    end
    
end


function vect = swap_vector(vect,i,val)

% Into the vector 'vect' - swap val with element i
vect(i) = val;

end

function theta = quadratic_polynomial()

% Function
syms x1 x2 x3
syms a1 a2 a3 a4 a5 a6 a7 a8 a9 a0

f = a1*x1^2 + a2*x2^2 + a3*x3^2 + a4*x1*x2 + a5*x1*x3 + a6*x2*x3 + a7*x1 + a8*x2 + a9*x3 + a0;

% Gradient
dfdx1 = diff(f,x1);
dfdx2 = diff(f,x2);
dfdx3 = diff(f,x3);

% Construct Jacobian
J = [subs(dfdx1,[x1,x2,x3], [x1(1),x2(1),x3(1)]) subs(dfdx2, [x1,x2,x3], [x1(1),x2(1),x3(1) subs(dfdx3, [x1,x2,x3], [x1(1),x2(1),x3(1)])]];


end
