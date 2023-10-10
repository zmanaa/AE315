% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc; close all;

% Define the parameters
resistance = 10;  % R 
inductance = 1e-3;  % L
capacitance = 1e-6; % C
appliedVoltage = 10;  % V

% Define the initial conditions
initialConditions = [0; 1];  % q(0) = 1, i(0) = 1

% Define the time span
timeSpan = [0 1e-3];  % Simulation time from 0 to 1 ms

% Solve the integro-differential equation using ode45
[time, state] = ode45(@(t, y) rlcEquation(t, y, ...
    resistance, inductance, capacitance, appliedVoltage), ...
    timeSpan, initialConditions);

% Plot the charge on the capacitor as a function of time
fig = figure;
set(fig, 'Color', 'w');  % Set figure background to white
subplot(211);
plot(time, state(:, 1), 'b-', 'LineWidth', 1.5);
xlabel('Time $s$', 'Interpreter', ...
    'latex', 'FontSize', 18);  
ylabel('Charge $c$', 'Interpreter', ...
    'latex', 'FontSize', 18); 
subplot(212);
plot(time, state(:, 2), 'r-', 'LineWidth', 1.5);
xlabel('Time $s$', 'Interpreter', ...
    'latex', 'FontSize', 18);  
ylabel('Current $A$', 'Interpreter', ...
    'latex', 'FontSize', 18); 

set(gca, 'TickLabelInterpreter', ...
    'latex', 'FontSize', 16);  


function dstates = rlcEquation(t, x, R, L, C, V)
    % RLC circuit integro-differential equation
    % x = [x1 = q 
    %      x2 = dqdt]

    dqdt = x(2);  % Charge on capacitor

    % Compute derivatives
    ddqdt = (1 / (L)) * (V - (R * x(2)) - (x(1)/C));

    % Return derivatives
    dstates = [dqdt; ddqdt]; % (q, i) after integration
end



