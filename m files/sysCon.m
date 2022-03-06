% pkg load control;

s = tf('s');
G = 4/(s^3+2*s^2+3*s+4);
G_c = (s-3)/(s+3);
H = 1/(0.01*s+1);

sys1 = series(G, G_c);
sys = feedback(sys1, H);
 
step(sys);

t = 0:0.001:30;
sys2 = 1/(s^2+0.6*s+1);
% sys2 =50/(s+50);
[y, t] = step(sys2, t);
plot(t, y);

stepinfo(sys2)

[y, t] =lsim(sys2, sin(t), t);
plot(t, y)

den = [1, 0.6, 1];
roots(den);

pole(sys2)
pzmap(sys2)
axis([-0.4, 0, -1, 1]);

h = hurwitz(den)
