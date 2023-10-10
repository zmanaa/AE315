% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc; close all;


% Initial condition
i0 = 0; % Initial current (in Amperes)

% Time span
tstart = 0; % Start time (in seconds)
tend = 1;   % End time (in seconds)

% Solve the differential equation
[t, i] = ode45(@rl_circuit_current, [tstart, tend], i0);

% Plotting
fig = figure(); % Initialize a figure
set(fig, 'color', 'w') % Set the background color to be white
plot(t, i, '-b','LineWidth', 1.5);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Current (A)', 'Interpreter', 'latex', 'FontSize', 18);
set(gca, 'FontSize', 16, 'TickLabelInterpreter', 'latex');

function di_dt = rl_circuit_current(t, i)
    R = 10; % Resistance (in Ohms)
    L = 1;  % Inductance (in Henrys)
    V = 2;  % Voltage (in Volt)
    di_dt = (1/L)*(V - R * i);
end