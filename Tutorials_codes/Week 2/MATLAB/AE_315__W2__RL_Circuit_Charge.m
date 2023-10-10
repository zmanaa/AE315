% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc; close all;

% Define the parameters
resistance = 10;  % R
inductance = 1;  % L
appliedVoltage = 2;  % V

% Define the initial conditions
initialConditions = [0; 0];  % q(0) = 0, dq(0)/dt = 0

% Define the time span
timeSpan = [0 1];  % Simulation time from 0 to 10 seconds

% Solve the integro-differential equation using ode45
[time, state] = ode45(@(t, y) rlEquation(t, y, ...
    resistance, inductance, appliedVoltage), timeSpan, initialConditions);

% Plot the charge on the capacitor as a function of time
fig = figure;
set(fig, 'Color', 'w');  % Set figure background to white
plot(time, state(:, 1), 'b-', 'LineWidth', 1.5);
hold on
plot(time, state(:, 2), 'r-', 'LineWidth', 1.5);
xlabel('Time $s$', 'Interpreter', ...
    'latex', 'FontSize', 18);  % Use LaTeX for x-axis label
legend('$q$', '$i$', ...
    'Interpreter', 'latex', 'FontSize', 16, ...
    'location', 'best');
set(gca, 'TickLabelInterpreter', ...
    'latex', 'FontSize', 16);  % Use LaTeX for axis ticks and increase font size

function dstates = rlEquation(t, x, R, L, V)
    % RL circuit 
    
    q = x(1);  % Charge on capacitor
    dqdt = x(2);  % Derivative of charge

    % Compute derivatives
    ddqdt = (1 / (L )) * (V - (R * dqdt));

    % Return derivatives
    dstates = [dqdt; ddqdt];
end



