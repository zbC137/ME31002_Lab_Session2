function dx = dynamics_q4(t, x, f)

m = 1;
b1 = 2;
b2 = 3;
k = 1;

dx(1,:) = x(2);
dx(2,:) = -(b1+b2)/m*x(2)-k/m*x(1)+f/m;

end

