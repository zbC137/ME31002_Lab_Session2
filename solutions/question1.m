clc; clear;
close all;

% comment the next line if using Matlab
pkg load control;

% show the Laplace transformation
s = tf('s');
sys = 3/(2*s^2+4*s+8)

% compute the partial fraction decomposition
num = [3];
den = [2, 4, 8];
[r, p, k] = residue(num, den)
