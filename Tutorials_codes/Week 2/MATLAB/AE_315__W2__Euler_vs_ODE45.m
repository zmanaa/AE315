% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc; close all;

% Define the analytical solution
analyticalSolution = @(t) t.^2 + 1;

% Define the step sizes to be compared
stepSizes = [0.1, 0.05, 0.01];

% Initialize the figure
fig = figure('Position', [100, 100, 800, 600]);
set(fig, 'color', 'w')

% Loop over the step sizes
for i = 1:length(stepSizes)
    stepSize = stepSizes(i);
    
    % Solve the differential equation using Euler's method
    tEuler = 0:stepSize:1;
    yEuler = zeros(size(tEuler));
    yEuler(1) = 1;
    for n = 1:length(tEuler)-1
        yEuler(n+1) = yEuler(n) + stepSize * (2 * tEuler(n));
    end
    
    % Solve the differential equation using ode45
    [tODE45, yODE45] = ode45(@myODE, [0:stepSize:1], 1);
    
    % Plot the numerical solutions
    subplot(length(stepSizes), 1, i);
    plot(tEuler, yEuler, 'b-', 'LineWidth', 1.5);
    hold on;
    plot(tODE45, yODE45, 'r-+', 'LineWidth', 1.5);
    hold on;
    % Plot the analytical solution
    tAnalytical = 0:stepSize:1;
    yAnalytical = analyticalSolution(tAnalytical);
    plot(tAnalytical, yAnalytical, 'k--', 'LineWidth', 1.5);
    hold off;
    
    % Set plot properties
    xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 18);
    ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 18);
    title(sprintf('Step Size = %.2f', stepSize), ...
        'Interpreter', 'latex', 'FontSize', 18);
    legend('Euler Method', 'ode45', 'Analytical', ...
        'Interpreter', 'latex', 'FontSize', 16, ...
        'location', 'west');
    set(gca, 'FontSize', 16, 'TickLabelInterpreter', 'latex');
end


% Define the differential equation as a separate function
function dydt = myODE(t, y)
    dydt = 2 * t; % Define the derivative of y with respect to t
end
