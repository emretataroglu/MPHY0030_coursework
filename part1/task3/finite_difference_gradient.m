function grad_x = finite_difference_gradient(x,a)
% Calculate partial derivatives using (central) finite difference method
% Define h and initialise gradient vector
h = 10^-4;
grad_x = zeros(1,3);

% disp('Hello')
% disp(x)
% disp(a)

% Create matrices of x, forward and backward
xf = zeros(3,3);
xf(1,:) = [x(1)+h, x(2), x(3)];
xf(2,:) = [x(1), x(2)+h, x(3)];
xf(3,:) = [x(1), x(2), x(3)+h];

xb = zeros(3,3);
xb(1,:) = [x(1)-h, x(2), x(3)];
xb(2,:) = [x(1), x(2)-h, x(3)];
xb(3,:) = [x(1), x(2), x(3)-h];

for i = 1:length(x)
    % Partial derivative for x(1), x(2), x(3)
    result_forward = quadratic_polynomial(xf(i,:),a);
    result_backward = quadratic_polynomial(xb(i,:),a);
%     fprintf("RF: %f \n", result_forward)
%     fprintf("XF: %f %f %f \n", xf(i,1),xf(i,2),xf(i,3))
%     fprintf("RB: %f \n", result_backward)
%     fprintf("XB: %f %f %f \n", xb(i,1),xb(i,2),xb(i,3))
    grad_x(i) = (result_forward-result_backward)/(2*h);
end

end
