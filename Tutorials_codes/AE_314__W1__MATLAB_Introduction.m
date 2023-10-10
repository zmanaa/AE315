% Copyright August, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023
    
clear all
close all
clc


%% Basic math operations
% -- Similar to many basic programming languages (C, etc.)

2+2 
4*4 
2-2/7       % Order of operations matter
(2-2)/7 
(2-2)/7;    % Semi-colon suppresses the command from being printed.


%% Variables
% -- One can assign a variable using '='

a = 2+2;
a = a*2.3;    % Variable has been overwritten.


%% Math functions
% -- MATLAB has built-in math functions to facilitate the calculations.

a_ciel  = ceil(a);  % Rounds to the nearest integers towards infinity.
a_floor = floor(a); % Rounds to the nearest integers towards -infinity.
a_sign  = sign(a);  
a_abs   = abs(-a);  
a_exp   = exp(a);   
a_log   = log(a);


%% Vectors and matrices
% -- MATLAB is a very good place to deal with vectors and matrices

% Vectors
x_row_vec = [1 2 3 4 5];        % Define a row vector using spaces b\w items
y_row_vec = [1, 4, 9, 16, 25];  % Define a row vector using commas b\w items

x_row_vec_colon = 1:1:5;        % Define a row vector using colon oeprator
x_row_vec_lin   = linspace(1,5,20); % Define a row vector using linear sapce

x_column_vec = [1; 2; 3; 4; 5];
% or 
x_column_vec = x_row_vec';  % using transpose operator (')

% Matrices
A = [1, 2, 3;...
    4, 5, 6;...
    7, 8, 9];
B = [10, 20, 30;...
    40, 50, 60;...
    70, 80, 90];
C_normal_mult = A*B;
C_element_by_elemnt_mult = A.*B;


%% Visualizations

time    = linspace(-100, 100, 500); 
F1      = (time.^2).*sin(time);  % t^2*sin(t)
F2      = (time.^2);                 % t^2

% Plotting
figure();   % Initialize a figure
plot(time,F1,'r-','Linewidth',2)  % Plots F1(t) in a red solid line

hold on % Holds everything on the current plot to add more later

plot(time,F2,'k--','Linewidth',2) % Plots F2(t) in a black dashed line
xlabel('Time')                 % Adds the label "time" to the x-axis
ylabel('Functions')            % Adds the label "functions" to the y-axis
legend('F1','F2')              % Creates a legend with entries "F1", "F2"
grid on                        % Turns on the grid lines 
title('Plots of F1 and F2')    % Gives the plot a title

