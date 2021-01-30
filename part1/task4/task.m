% Task
clc
clear 
close all

% Load cvs data and turn into arrays
vertices = table2array(readtable('data/example_vertices.csv'));
faces = table2array(readtable('data/example_triangles.csv'));

%% Plot of original data
figure(1)
subplot(1,2,1)
trimesh(faces,vertices(:,1),vertices(:,2),vertices(:,3))
title('Unsmoothed plot');
subplot(1,2,2)
patch('Vertices',vertices,'Faces',faces,'FaceColor', 'r')
title('Unsmoothed plot (patch)')

%% Trimesh
figure(2)
% Plots for original and 3 different iterations - [5 10 25]
subplot(2,2,1)
trimesh(faces,vertices(:,1),vertices(:,2),vertices(:,3))
title('Original plot');

subplot(2,2,2)
% 5 iterations
smoothed = lowpass_mesh_smoothing(vertices,faces,5);
trimesh(faces,smoothed(:,1),smoothed(:,2),smoothed(:,3))
title('Plot of 5 iterations');

subplot(2,2,3)
% 10 iterations - default
smoothed = lowpass_mesh_smoothing(vertices,faces,10);
trimesh(faces,smoothed(:,1),smoothed(:,2),smoothed(:,3))
title('Plot of 10 iterations');

subplot(2,2,4)
% 25 iterations
smoothed = lowpass_mesh_smoothing(vertices,faces,25);
trimesh(faces,smoothed(:,1),smoothed(:,2),smoothed(:,3))
title('Plot of 25 iterations');

%% Patch
figure(3)
% Plots for original and 3 different iterations - [5 10 25]
subplot(2,2,1)
patch('Vertices',vertices,'Faces',faces,'FaceColor', 'r')
title('Original plot (patch)');

subplot(2,2,2)
% 5 iterations
smoothed = lowpass_mesh_smoothing(vertices,faces,5);
patch('Vertices', smoothed,'Faces',faces,'FaceColor', 'r')
title('Plot of 5 iterations (patch)');

subplot(2,2,3)
% 10 iterations - default
smoothed = lowpass_mesh_smoothing(vertices,faces,10);
patch('Vertices', smoothed,'Faces',faces,'FaceColor', 'r')
title('Plot of 10 iterations (patch)');

subplot(2,2,4)
% 25 iterations
smoothed = lowpass_mesh_smoothing(vertices,faces,25);
patch('Vertices', smoothed,'Faces',faces,'FaceColor', 'r')
title('Plot of 25 iterations (patch)');

% figure(3)
% % 1000 iterations
% smoothed = lowpass_mesh_smoothing(vertices,faces,1000);
% trimesh(faces,smoothed(:,1),smoothed(:,2),smoothed(:,3))
% title('1000 iterations plot');