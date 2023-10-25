clc; clear;
close all;

% comment the next line if using Matlab
% pkg load control;

% compute the transfer function
s = tf('s');

G1 = 2/((s+1)*(s+8));
H1 = 0.2;
sys1 = feedback(G1, H1, -1);

G2 = 4;
sys2 = series(G2, sys1);

G3 = 1/s;
sys3 = series(sys2, G3);

H2 = 1;
G = feedback(sys3, H2, -1)

% compute the poles
pole(G)

% poles-zeros map
figure(1)
pzmap(G);

% root locus
figure(2)
rlocus(G)
