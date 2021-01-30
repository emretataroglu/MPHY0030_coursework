function new_val = gradient_descent(multi_func,initial_val,step_size,max_iter,tol,gradient,a)
% Initialise variables
iter = 0;
delta = 1;

val = initial_val;

val_list = [];

% While loop will be executed based on max iteration and tolerance provided
while (iter <= max_iter) && (delta >= tol)
    
    if iter == max_iter
        fprintf('Max iteration reached.\n')
    end

    % Step forward - update
    new_val = val - step_size*gradient(val,a);
    
    % Update iteration and metrics
    iter = iter + 1;
    
    result_new = multi_func(new_val,a);
    result_next_val = multi_func(val,a);
    
    val_list(iter) = result_new;
    
    delta = result_next_val-result_new;
    val = new_val;

end

plot(1:length(val_list),val_list)
title('Gradient Descent')

end


