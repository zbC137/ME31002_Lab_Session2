close all;
clc; clear;

%% parameters
dt = 0.1;
t = 20;

kp = 2.626;
ki = 0.1;
kd = 0;

x1 = 0; % x(-1)
x0 = 0; % x(0)
xd = 10; % target value

%% data recording
eData = [];
xData = [];
uData = [];
tData = [];

%% simulation
x_curr = x0;
x_last = x1;

e_curr = xd - x_curr;
e_last = xd - x_last;

e_sum = e_curr*dt;
e_diff = (e_curr-e_last)/dt;

xData = [xData; x_curr];
eData = [eData; e_curr];

for i = 0:dt:t

  tData = [tData; i];

  u = kp*e_curr + ki*e_sum + kd*e_diff;

  % control
  options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
  [~, v] = ode45(@(t, v)dynamics(t, v, u), [i,i+1], x_curr, options);
  x_last = x_curr;
  x_curr = v(end);

  %x_llast = x_last;
  %x_last = x_curr;
  %x_curr = -3*x_llast - 3*x_last - 1 + u;
  %x_curr = x_last + u;

  % update
  e_last = e_curr;
  e_curr = xd - x_curr;
  e_sum = e_sum + e_curr*dt;
  e_diff = (e_curr-e_last)/dt;

  % save data
  xData = [xData; x_curr];
  eData = [eData; e_curr];
  uData = [uData; u];

end

%% plotting
figure(1)
plot(tData, xData(1:201))

