function dx = dynamics_q4(t, x, f)

dx(1,:) = x(2);
dx(2,:) = -2*x(2)-x(1)+f;

end

