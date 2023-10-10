% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc; close all;

% Define the step size and time points
stepSize = 0.05; % Step size
timePoints = 0:stepSize:1; % Time points

% Initialize the solution arrays
numericalSolution = zeros(size(timePoints)); % Initialize numerical solution array
analyticalSolution = timePoints.^2 + 1; % Analytical solution

% Solve the differential equation using RK1 (Euler's method)
numericalSolution(1) = 1; % Initial condition
for n = 1:length(timePoints)-1
    numericalSolution(n+1) = numericalSolution(n) + ...
    stepSize * (2 * timePoints(n)); % Update solution using RK1
end

% Plot the numerical and analytical solutions
fig = figure(); % Initialize a figure
set(fig, 'color', 'w') % Set the background color to be white
plot(timePoints, numericalSolution, ...
    'b-', 'LineWidth', 1.5); % Plot numerical solution
hold on;
plot(timePoints, analyticalSolution, ...
    'r--', 'LineWidth', 1.5); % Plot analytical solution
hold off;

% Set plot properties
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 18);
legend('Numerical Solution (RK1)', 'Analytical Solution', ...
    'Interpreter', 'latex', 'FontSize', 16, 'location', 'best');
set(gca, 'FontSize', 16, 'TickLabelInterpreter', 'latex');

