% Part 2 Task
clc 
clear
close all 

x = linspace(0,1,15);
y = linspace(0,1,15);

x2 = linspace(0,1,100);
y2 = linspace(0,1,100);

[x, y] = meshgrid(x,y);
% [x2, y2] = meshgrid(x2,y2);

z = exp((x.*cos(3*pi*x)));

z = z .* (exp((y.*cos(3*pi*y))));

% z2 = exp((x2.*cos(3*pi*x2)));
% 
% z2 = z2 .* (exp((x2.*cos(3*pi*x2))));

k = 1;

for i = 1:length(x)
    for j = 1:length(y)
        
        c_p(k,:) = [x(i),y(j)];
        
        q(k,:) = z(i,j);
        
        k = k + 1;
    end
end

figure;
mesh(x,y,z)

sigma = ones(length(x)*length(y),1)*0.1;

lambda = 1;

K = RBFSpline.kernel_gaussian(c_p, sigma);

alpha = RBFSpline.fit(q, lambda, sigma);

z0 = zeros((length(x2)*length(y2)),1);
Z0 = zeros(length(x2),length(y2));
k = 1;

for i = 1:length(x2)
    
    for j = 1:length(y2)
        
        q_p(k,:) = [x2(i),y2(j)];
        
        for m = 1:length(alpha)
            D = norm(q_p(k,:) - c_p(m,:));
            z0(k) = z0(k)+alpha(m,1)*exp(-D/(2.*sigma(m,1)));
        end
        Z0(i,j) = z0(k);
        k = k + 1;
        
    end
    
end

figure;
mesh(x2,y2,Z0)