function pid_test(kp, ki, kd)
%PID_TEST Simulate a PID controller in response to a unit step input
%
% Simulate the response of a PID controller to a unit step input. Plots the
% closed-loop step response for the spring mass system.
%
% Inputs:
%   kp - Proportional gain 
%   ki - Integral gain
%   kd - Derivative gain
%
% Outputs: None
% Plots the closed-loop step response
%
% Example:
%   pid_test(1, 1, 1);
%
% Author: Zeyad M. Manaa
% Date: September 2023
% Course: AE 513



% system parameters
m = 1;      % Mass (kg)
k = 5;     % Spring constant (N/m)
c = 2;    % Damping coefficient (Ns/m)
t = 0:0.01:20;

s = tf('s');

C_s = kp + ki/s + kd*s;
fig = figure();
set(fig, 'color', 'w');

G_s = 1/(m*s^2 + c*s + k);
T_s = series(G_s, C_s);
Sys_s = feedback(T_s, 1);
[y, t] = step(Sys_s, t);

% Calculate error
error = 1 - y;

    
% Plots
plot(t, y, 'LineWidth', 2);
hold on
plot(t, error, 'LineWidth', 2);
legend('response', 'error', 'FontSize', 16);
grid on
end