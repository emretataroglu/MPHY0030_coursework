function pdf = bi_gaussian_pdf(x,mu,sigma)
% pdf = probability density function
% mu = mean vector
% sigma = covariance matrix

x_mu = [x(1,:)-mu(1); x(2,:)-mu(2)];

const = 1/((2*pi)*sqrt(det(sigma)));

pdf = const * exp((-1/2)*diag((x_mu.'*inv(sigma))*x_mu));

end

