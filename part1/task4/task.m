% Task
clc
clear 
close all

vertices = table2array(readtable('data/example_vertices.csv'));
faces = table2array(readtable('data/example_triangles.csv'));

new_vertices = lowpass_mesh_smoothing(vertices,faces);

figure(1)
patch('Vertices', vertices, 'Faces', faces, 'FaceColor', 'r' );

figure(2)
patch('Vertices', new_vertices, 'Faces', faces, 'FaceColor', 'r' );