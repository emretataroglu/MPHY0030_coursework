function new_val = gradient_descent(multi_func,initial_val,step_size,max_iter,tol)
% Initialise variables
iter = 0;
delta = 1;

% While loop will be executed based on max iteration and tolerance provided
while (iter <= max_iter) && (delta >= tol)
    
    if iter == max_iter
        fprintf('Max iteration reached.\n')
    end
    
    gradient = finite_difference_gradient(multi_func,initial_val);
    
    % Step forward - update
    new_val = initial_val - step_size*gradient;
    
    % Update iteration and metrics
    iter = iter + 1;
    delta = quadratic_polynomial(initial_val,a)-quadratic_polynomial(new_val,a);
    initial_val = new_val;


end
end


