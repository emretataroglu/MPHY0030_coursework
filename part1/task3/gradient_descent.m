function [val] = gradient_descent(multi_func,initial_val,step_size,max_iter,tol)

norm_grad = inf; % Norm of gradient
iter = 0;
info_iter = true;

%%

val = initial_val;

while (iter <= max_iter)
    
    if iter == max_iter
        fprintf('Max iteration reached.\n')
    end
    
    % Step forward - update
    
    val = val - step_size*finite_difference_gradient(val);

    % Update iteration and metrics
    iter = iter + 1;
    
    syms x1 x2 x3
    
    a1=3;
    a2=3;
    a3=3;
    a4=3;
    a5=3;
    a6=3;
    a7=3;
    a8=3;
    a9=3;
    a0=3;
    
    f = a1*x1^2 + a2*x2^2 + a3*x3^2 + a4*x1*x2 + a5*x1*x3 + a6*x2*x3 + a7*x1 + a8*x2 + a9*x3 + a0;
    
    disp(iter);
    disp(val);
    disp(subs(f,[x1,x2,x3],val));
    
    
end

end

