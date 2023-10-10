% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc; close all;

% Init. timeSpan
timeSpan = [0, 5];

% Init. initial conditions
ICs = [0, 0];

% Solve the system of ODEs using the ode45 solver
[t, y] = ode45('func', timeSpan, ICs);

% Plot the numerical solution
fig = figure(); % Initialize a figure
set(fig, 'color', 'w') % Set the background color to be white
plot(t, y(:, 1), 'b-', 'LineWidth', 1.5);
hold on
plot(t, y(:, 2), 'r-', 'LineWidth', 1.5);
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 18);  % Label for the x-axis
ylabel('$y(t)$', 'Interpreter', 'latex', 'FontSize', 18);  % Label for the y-axis
legend('$y$', '$v$', ...
        'Interpreter', 'latex', 'FontSize', 16, ...
        'location', 'best')
set(gca, 'FontSize', 16, 'TickLabelInterpreter', 'latex');


% function dxdt = myODE(t, x)
%     % Function representing the system of first-order ODEs
%     % Inputs:
%     %   t: time
%     %   y: vector containing the variables y(t) and v(t)
%     % Output:
%     %   dydt: vector of derivatives of y(t) and v(t)
% 
%     dxdt = zeros(2, 1);
%     dxdt(1) = x(2);  % Derivative of y(t) is v(t)
%     dxdt(2) = cos(t) - 4 * x(2) - 3 * x(1);  % Derivative of v(t) is given by the second-order ODE
% end