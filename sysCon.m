pkg load control;

s = tf('s');
G = 4/(s^3+2*s^2+3*s+4);
G_c = (s-3)/(s+3);
H = 1/(0.01*s+1);

sys1 = series(G, G_c);
sys = feedback(sys1, H)
