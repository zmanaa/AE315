clear all; clc; close all;

% Parameters
m = 0.5; % kg
l = 1.5; % m   
b = 2; % Nms/rad
g = 9.8; % m/s^2

% Transfer function
s = tf('s');
num = 1;
den = m*l^2*s^2 + b*l*s - g;
G = num/den; % Transfer function

% Controller (Lead-Lag)
kp =70;
kd = 10;
ki = 40;

C = kp + ki/s + kd*s;
GC = series(G, C);
T = feedback(GC,1);


% Simulate response  
t = 0:0.01:10; % Time vector
u = ones(size(t));

[y,t] = step(T, t);
stepinfo(T)
% Plot response
figure();
plot(t,y, t, u, 'LineWidth',2)
title('Step Response of Inverted Pendulum Model') 
xlabel('Time (sec)')
ylabel('Angle (degrees)')