t = 0:0.001:5;
f = 1;

options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
[~, v] = ode45(@(t, v)dynamics(t, v, f), t, [0;0], options);
    
figure(1)
plot(t, v(:,2));
xlabel('t'); ylabel('Linear velocity');

s = tf('s');
sys = 1/(0.5*s+1);
figure(2)
step(sys, t)