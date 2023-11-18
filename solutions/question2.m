clc; clear;
close all;

% comment the next line if using Matlab
% pkg load control;

% compute the transfer function
s = tf('s');

sys1 = 2/s;
sys2 = 2/(s+4);
sys4 = series(sys1, sys2);
H1 = 1;
sys5 = feedback(sys4, H1, -1);

G1 = 0.75;
sys3 = 1/s;
G2 = series(G1, sys5);
sys6 = series(G2, sys3);

H2 = 1;
G = feedback(sys6, H2, -1)

% compute the poles
pole(G)

% poles-zeros map
figure(1)
pzmap(G);

% root locus
figure(2)
rlocus(G)
