clc;
close all;
clear;

% Main
file_loc = 'data/example_image.mat';
data = load(file_loc);
simple_image_write('image.sim',data);
image_out = simple_image_read('image.sim');

% Plotting at 3 different z-coordinates - [1 5 10]
figure(1)
% subplot(3,1,1)
contourf(image_out.vol(:,:,1))
title('Plot with z=1');

figure(2)
% subplot(3,1,2)
contourf(image_out.vol(:,:,5))
title('Plot with z=5');

figure(3)
% subplot(3,1,3)
contourf(image_out.vol(:,:,10))
title('Plot with z=10');



