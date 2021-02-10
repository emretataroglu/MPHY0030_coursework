% Part 2 Task
clc 
clear
close all 

x = linspace(0,1,5);
y = linspace(0,1,5);

x2 = linspace(0,1,100);
y2 = linspace(0,1,100);

[X, Y] = meshgrid(x,y);
[X2, Y2] = meshgrid(x2,y2);

z = exp((X.*cos(3*pi*X))).*(exp((Y.*cos(3*pi*Y))));

k = 1;

for i2 = 1:length(x)
    for j2 = 1:length(y)
        
        c_p(k,:) = [x(i2),y(j2)];
        
        q(k,:) = z(i2,j2);
        
        k = k + 1;
    end
end

sigma = ones(length(x)*length(y),1)*0.1;

lambda = 0;

K = RBFSpline.kernel_gaussian(c_p, sigma);

alpha = RBFSpline.fit(q, lambda, sigma, K);

z0 = zeros(length(x2),length(y2));
k = 1;

for i = 1:length(x2)
    
    for j = 1:length(y2)
        
        q_p(k,:) = [x2(i),y2(j)];
        
        for m = 1:length(alpha)
            D = norm(q_p(k,:) - c_p(m,:));
            z0(i,j) = z0(i,j)+(alpha(m,1)*exp(-D^2/(2.*sigma(m,1)^2)));
        end
        
        k = k + 1;
        
    end
    
end

z_true = exp((X2.*cos(3*pi*X2))).*(exp((Y2.*cos(3*pi*Y2))));

% tq = RBFSpline.evaluate(q_p,c_p,alpha,sigma);


figure;
mesh(x2,y2,z0)
hold on
plot3(X,Y,z,'.r','MarkerSize',10)

figure;
mesh(X2,Y2,z_true)