% Copyright Sep, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
% For:
%   - AE 315 - Systems and Control Course.
%   - Fall 2023

clear all; clc;

num = [1];
den = [1 2 5];

G = tf(num, den);

figure;
step(G, 10)