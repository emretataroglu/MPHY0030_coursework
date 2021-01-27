% Task 2 - Plotting Bivariate Gaussian (Normal) probability density surfaces
clc;
close all;
clear; 

% Generate data
x = linspace(-2, 8);
y = x;

R = mvnrnd([1, 3], [1, 0.6;0.6, 2], 10000);

mu = mean(R);

sigma = cov(R);

c_ten = chi2inv(0.1, 2);
c_fifty = chi2inv(0.5,2);
c_ninety = chi2inv(0.9, 2); 


c = zeros(1,3);
c(1) = sqrt(c_ten);
c(2) = sqrt(c_fifty);
c(3) = sqrt(c_ninety);

for i = 1:length(x)
    for j = 1:length(y)
        
        x_vec = [x(i);y(j)];
        
        pdf(i, j) = bi_gaussian_pdf(x_vec, mu, sigma);
        
    end
end

[V,D] = eig(sigma);

x_ten = mu' + c_ten*D(1, 1).*V(:, 1);
x_fifty = mu' + c_fifty*D(1, 1).*V(:, 1);
x_ninety = mu' + c_ninety*D(1, 1).*V(:, 1);

p = zeros(1,3);
p(1) = bi_gaussian_pdf(x_ten, mu, sigma);
p(2) = bi_gaussian_pdf(x_fifty, mu,sigma);
p(3) = bi_gaussian_pdf(x_ninety, mu, sigma);

[X, Y] = meshgrid(x, y);

figure
% surf(X, Y, pdf);

plot(R(:, 1), R(:, 2), '.')

hold on
% contour(Y, X, pdf, [p(1) p(2) p(3)])

% Sigma values
A = sigma(1, 1);
B = sigma(1, 2);
C = sigma(2, 1);
d = sigma(2, 2);

% Eigenvalues
lambda1 = D(1,1);
lambda2 = D(2,2);

t = linspace(0, 2*pi);

if B == 0
    if A >= C
        theha = 0;
    else
        theta = pi/2;
    end
else
    theta = atan2(lambda1-A, B);
end

zt = zeros([1, length(t)]);

for i = 1:3
    xt = c(i)*sqrt(lambda1)*cos(theta)*cos(t) - c(i)*sqrt(lambda2)*sin(theta)*sin(t) + mu(1);
    yt = c(i)*sqrt(lambda1)*sin(theta)*cos(t) + c(i)*sqrt(lambda2)*cos(theta)*sin(t) + mu(2);
    
    surf([xt;xt],[yt;yt],[zt;zt+p(i)]);
end












