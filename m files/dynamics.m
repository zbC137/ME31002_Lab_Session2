function dv = dynamics(t, v, f)

    m = 1;
    c = 2;
    k = 1;

    dv(1,:) = v(1);
    dv(2,:) = -c/m*v(2)-k*v(1) + f;

end