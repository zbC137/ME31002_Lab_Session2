clc; clear;
close all;

% comment the next line if using Matlab
% pkg load control;

% show the Laplace transformation
s = tf('s');
sys = 5/(4*s^2+2*s+10)

% compute the partial fraction decomposition
num = [5];
den = [4, 2, 10];
[r, p, k] = residue(num, den)
