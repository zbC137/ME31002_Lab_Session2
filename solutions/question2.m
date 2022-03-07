clc; clear;
close all;

%uncomment the next line if using Octave
%pkg load control;

s = tf('s');

G1 = 1/s^2;

G2 = 50/(s+1);
H1 = 2/s;
sys1 = feedback(G2, H1, -1);
sys2 = series(G1, sys1);

sys3 = s-2;

sys4 = series(sys2, sys3);
H2 = 1;
G = feedback(sys4, H2, -1)

pole(G)
