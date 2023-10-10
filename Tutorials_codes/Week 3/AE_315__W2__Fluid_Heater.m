% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc; close all;

% Initial condition
T0 = 25; % Initial current (in Amperes)

% Time span
tstart = 0; % Start time (in seconds)
tend = 10;   % End time (in seconds)

% System params
Vs  = [1 5 10 15 20]; % Volt
k   = 25; 
T_a = 25;             % Degree c
c   = 1; 
R_t = 0.5;


% Plotting
fig = figure(); % Initialize a figure
hold on
for idx = 1:length(Vs)
    V = Vs(idx);
    
    % Solve the differential equation using ode45
    [t, T] = ode45(@(t, T) fluid_heater(t, T, V, R_t, T_a, k, c), ...
        [tstart, tend], T0);

    % Plotting
    plot(t, T,'LineWidth', 2);
    legend_info{idx} = sprintf('$V = %.2f$', V);
end
legend(legend_info, 'Interpreter', 'latex', ...
    'FontSize', 16);

set(fig, 'color', 'w') % Set the background color to be white
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('T degree c', 'Interpreter', 'latex', 'FontSize', 18);
set(gca, 'FontSize', 16, 'TickLabelInterpreter', 'latex');


function dT_dt = fluid_heater(t, T, V, R_t, T_a, k, c)
    % states = T
    dT_dt = 1/c*((k*V) - (T - T_a)/R_t);
end