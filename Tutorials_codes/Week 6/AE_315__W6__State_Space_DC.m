% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa
%
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc; close all;

% Motor parameters
J = 0.7; % Moment of inertia of the rotor
b = 0.1; % Viscous friction coefficient
K = 0.01; % Electromotive force constant
R = 1; % Electric resistance
L = 0.5; % Electric inductance

% State space matrices
A = [-b/J K/J; -K/L -R/L]; % State matrix
B = [0; 1/L]; % Input matrix
C = [1 0]; % Output matrix
D = 0; % Feedthrough matrix
t = 0:0.01:20; % Time vector

% Motor transfer function
motor_ss = ss(A, B, C, D);

% Plot step response of the system
[y, t] = step(motor_ss, t); 
fig = figure(1); 
set(fig, 'color', 'w'); 
plot(t, y, 'LineWidth', 2); 
grid on;
xlabel('Time', 'Interpreter', 'latex', 'FontSize', 14); 
ylabel('System Response', 'Interpreter', 'latex', 'FontSize', 14); 
title('Step Response', 'Interpreter', 'latex', 'FontSize', 16); 

% Convert state-space model to transfer function form and design a 
% controller for the system
[b,a] = ss2tf(A, B, C, D);
G_s = tf(b, a); 

kp = 150; kd = 0; ki = 10; 
s = tf('s'); 
C_s = kp + ki/s + kd*s; 

T_s = series(G_s, C_s);
Sys_s = feedback(T_s, 1);

[y, t] = step(Sys_s, t); 
error = ones(size(y)) - y;

fig = figure(2); 
set(fig, 'color', 'w'); 
plot(t, y, 'LineWidth', 2); 
grid on; 
