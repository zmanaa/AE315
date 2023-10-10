% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc; close all;

% Initial condition
h0 = 0; % Initial current (in Amperes)

% Time span
tstart = 0; % Start time (in seconds)
tend = 10;   % End time (in seconds)

% System params
R_fs = [0.5];
A = 5;
q = 1;

% Plotting
fig = figure(); % Initialize a figure
hold on
for idx = 1:length(R_fs)
    R_f = R_fs(idx);
    
    % Solve the differential equation using ode45
    [t, h] = ode45(@(t, h) fluidic_system(t, h, R_f, A, q), [tstart, tend], h0);

    % Plotting
    plot(t, h,'LineWidth', 1.5);
end

set(fig, 'color', 'w') % Set the background color to be white
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('h (m)', 'Interpreter', 'latex', 'FontSize', 18);
set(gca, 'FontSize', 16, 'TickLabelInterpreter', 'latex');
legend('$R_f = 0.25$', '$R_f = 0.5$', ...
    '$R_f = 1$', '$R_f = 1.25$', ...
        'Interpreter', 'latex', 'FontSize', 16, ...
        'location', 'best');

function dh_dt = fluidic_system(t, h, R_f, A, q)
    % states = h
    dh_dt = (q/A) - (h/(A*R_f));
end