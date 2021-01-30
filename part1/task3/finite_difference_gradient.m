function grad_x = finite_difference_gradient(x,a)
% Calculate partial derivatives using (central) finite difference method
format SHORTG
% Define h and initialise gradient vector
h = 10^-4;
grad_x = zeros(1,3);

syms x
% Create matrices of x, forward and backward
xf = zeros(1,3);
xf(1) = [x(1)+h, x(2), x(3)];
xf(2) = [x(1), x(2)+h, x(3)];
xf(3) = [x(1), x(2), x(3)+h];

xb = zeros(1,3);
xb(1) = [x(1)-h, x(2), x(3)];
xb(2) = [x(1), x(2)-h, x(3)];
xb(3) = [x(1), x(2), x(3)-h];

% Partial derivative for x(1)
grad_x(1) = (quadratic_polynomial(xf(1),a)-quadratic_polynomial(xb(1),a))/(2*h);
% Partial derivative for x(2)
grad_x(2) = (quadratic_polynomial(xf(2),a)-quadratic_polynomial(xb(2),a))/(2*h);
% Partial derivative for x(3)
grad_x(3) = (quadratic_polynomial(xf(3),a)-quadratic_polynomial(xb(3),a))/(2*h);

end
