%uncomment the next line if you are using Octave
% pkg load control;

s = tf('s');
sys = 1/(s^2+0.6*s+1);

t = 0:0.001:30;
[ y, t] = step(sys, t);
plot(t, y);
xlabel('t(s)'; ylabel('y');
stepinfo(y, t)

[y, t] = impulse(sys, t);
plot(t, y);
xlabel('t(s)'; ylabel('y');

[y, t] = lsim(sys, sin(t), t);
plot(t, y);
xlabel('t(s)'; ylabel('y');

den = [1, 0.6, 1];
roots(den)

G = 1/(s^2+0.6*s+1);
pole(G)
pzmap(G);
axis([-0.4, 0, -1, 1]);
