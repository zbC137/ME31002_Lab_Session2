clc; clear;
close all;

%uncomment the next line if using Octave
%pkg load control;

s = tf('s');
sys = 2/(s^3*(s^2+2*s+10))

num = [2];
den = [1, 2, 10, 0, 0, 0];
[r, p, k] = residue(num, den)
