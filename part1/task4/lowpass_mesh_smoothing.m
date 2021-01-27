clc
close all
clear


function smooth = lowpass_mesh_smoothing(points, triangles, iteration, lambda, mu)
    % Set default values
    
    if nargin < 2 || isempty(iteration)
        iteration = 10;
    end
    
    if nargin < 3 || isempty(lambda)
        lambda = 0.9;
    end
    
    if nargin < 4 || isempty(mu)
        mu = lambda*(-1.02);
    end