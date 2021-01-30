function pdf = bi_gaussian_pdf(x,mu,sigma)
% Inputs
% x is (n,3) 3D matrix
% pdf = probability density function
% mu = mean vector of x 
% sigma = covariance matrix of x

% Initiliase matrix based on size
size_x = size(x);
pdf = zeros(size_x(1),1);

x_mu = [x(1,:)-mu(1); x(2,:)-mu(2); x(3,:)-mu(3)];

const = 1/((2*pi)*sqrt(det(sigma)));

pdf = const * exp((-1/2)*diag((x_mu.'*inv(sigma))*x_mu));

end

