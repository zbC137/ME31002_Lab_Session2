clc; clear;
close all;

% comment the next line if you are using Matlab
% pkg load signal;

t = 0:0.001:20;
%% transfer function
s = tf('s');
G = 5*(s+20)/(s*(s+4.5883)*(s^2+3.4118*s+16.346));
H = 6;
sys = feedback(G, H, -1)

%% step response
[y1, t] = step(sys, t);

figure(1);
plot(t, y1);
xlabel('t(s)'); ylabel('y');
title('Step Response');

%% impulse response
[y2, t] = impulse(sys, t);

figure(2)
plot(t, y2);
xlabel('t(s)'); ylabel('y');
title('Impulse Response');

%% square wave response
f = square(2*pi*t/5);
[y3, t] = lsim(sys, f, t);

figure(3)
plot(t, f);
xlabel('t(s)'); ylabel('f');
title('Square Wave');

figure(4)
plot(t, y3);
xlabel('t(s)'); ylabel('y');
title('Square Wave Response');
