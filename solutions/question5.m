close all;
clear;

% System function
G = tf(5,[1, 5, 0]);
% PID controller
G_c = tf([0, 0.5, 0.0], [1, 0]);

sys1 = series(G, G_c);
% Closed-loop system
sys2 = feedback(sys1, 1)

t = 0:0.01:30;
r = ones(size(t))*(-2);
[y, t] = lsim(sys2, r, t);

plot(t, r, 'Color', 'r', 'LineWidth', 1)
hold on;
plot(t, y, 'Color', 'k', 'LineWidth', 1)
xlabel('time (s)')
legend('Reference', 'Control result', 'Location', 'southeast')
