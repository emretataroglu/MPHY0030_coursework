% Define parameters.
close all
clear all
fontSize = 15;
x1 = 1;
x2 = 20;
y1 = 2;
y2 = 8;
eccentricity = 0.85;
numPoints = 300; % Less for a coarser ellipse, more for a finer resolution.
% Make equations:
a = (1/2) * sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2);
b = a * sqrt(1-eccentricity^2);
t = linspace(0, 2 * pi, numPoints); % Absolute angle parameter
X = a * cos(t);
Y = b * sin(t);
% Compute angles relative to (x1, y1).
angles = atan2(y2 - y1, x2 - x1);
x = (x1 + x2) / 2 + X * cos(angles) - Y * sin(angles);
y = (y1 + y2) / 2 + X * sin(angles) + Y * cos(angles);
% Plot the ellipse as a blue curve.
z=zeros([numPoints,1])+1;
plot3(x,y,z,'b-', 'LineWidth', 2);	% Plot ellipse
grid on;
axis equal
xlabel('x', 'FontSize', fontSize);
ylabel('y', 'FontSize', fontSize);
