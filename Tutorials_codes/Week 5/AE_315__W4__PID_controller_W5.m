% Copyright Sep, 2023, All Rights Reserved.
% Code by Mohammed R. Elbalshy.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

% PID controller
clc; clear all; close all;

% system parameters
m = 1;      % Mass (kg)
k = 5;     % Spring constant (N/m)
c = 2;    % Damping coefficient (Ns/m)
t = 0:0.01:20;
case_string = 'pid';

% system transfer function
s = tf('s');
G_s = 1/(m*s^2 + c*s + k);

% PID TF 
% C_S = kp + ki/s + kd*s

switch case_string
    case 'step_response'
        [y, t] = step(G_s, t);
        fig = figure(1);
        set(fig, 'color', 'w');
        plot(t, y, 'LineWidth', 2);
        grid on;
        hold on;
        xlabel('Time', 'Interpreter', 'latex', 'FontSize', 14);
        ylabel('System Response', 'Interpreter', 'latex', 'FontSize', 14);
        title('Step Response', 'Interpreter', 'latex', 'FontSize', 16);


    case 'p'
        % P controller
        kp = [1, 10, 30, 60];
        ki = 0;
        kd = 0;
        C_s = kp + ki/s + kd*s;
        fig = figure(1);
        set(fig, 'color', 'w');
        
        for i = 1:length(kp)
            T_s(i) = series(G_s, C_s(i));
            Sys_s(i) = feedback(T_s(i), 1);
            [y, t] = step(Sys_s(i), t);
            error(:,i) = ones(size(y)) - y;
            plot(t, y, 'LineWidth', 2, 'DisplayName', strcat('$k_p=$', num2str(kp(i))));
            grid on;
            hold on;
        end
        
        legend('show');
        legend('Interpreter', 'latex', 'FontSize', 12);
        xlabel('Time', 'Interpreter', 'latex', 'FontSize', 14);
        ylabel('System Response', 'Interpreter', 'latex', 'FontSize', 14);
        title('P Controller', 'Interpreter', 'latex', 'FontSize', 16);
        

    case 'pd'
        % PD controller
        kp = 30;
        kd = [0, 2, 5, 10, 20];
        ki = 0;
        C_s = kp + ki/s + kd*s;
        fig = figure(2);
        set(fig, 'color', 'w');
        
        for i = 1:length(kd)
           T_s(i) = series(G_s, C_s(i));
           Sys_s(i) = feedback(T_s(i), 1);
           [y, t] = step(Sys_s(i), t);
           plot(t, y, 'LineWidth', 2, 'DisplayName', strcat('k_d=', num2str(kd(i))))
           grid on;
           hold on;

        end
        
        legend('show');
        legend('Interpreter', 'latex', 'FontSize', 12);
        xlabel('Time', 'Interpreter', 'latex', 'FontSize', 14);
        ylabel('System Response', 'Interpreter', 'latex', 'FontSize', 14);
        title('PD Controller', 'Interpreter', 'latex', 'FontSize', 16);
        

    case 'pi'
        % PI controller
        kp = 30;
        kd = 0;
        ki = [0, 1, 5, 10, 50];
        C_s = kp + ki/s + kd*s;
        fig = figure(3);
        set(fig, 'color', 'w');
        
        for i = 1:length(ki)
            T_s(i) = series(G_s, C_s(i));
            Sys_s(i) = feedback(T_s(i), 1);
           [y, t] = step(Sys_s(i), t);
           plot(t, y, 'LineWidth', 2, 'DisplayName', strcat('k_i=', num2str(ki(i))));
            grid on;
            hold on;
        end
        
        legend('show');
        legend('Interpreter', 'latex', 'FontSize', 12);
        xlabel('Time', 'Interpreter', 'latex', 'FontSize', 14);
        ylabel('System Response', 'Interpreter', 'latex', 'FontSize', 14);
        title('PI Controller', 'Interpreter', 'latex', 'FontSize', 16);
        

    case 'pid'
        % PID controller
        kp = 50;
        kd = 10;
        ki = 70;
        C_s = kp + ki/s + kd*s;
        fig = figure(4);
        set(fig, 'color', 'w');

        T_s = series(G_s, C_s);
        Sys_s = feedback(C_s * G_s, 1);
        [y, t] = step(Sys_s, t);
        plot(t, y, 'LineWidth', 2);
        grid on;
        xlabel('Time', 'Interpreter', 'latex', 'FontSize', 14);
        ylabel('System Response', 'Interpreter', 'latex', 'FontSize', 14);
        title('PID Controller', 'Interpreter', 'latex', 'FontSize', 16);
end