a = [ 10 -5; -5 10];

% polynomial method
p = poly(a);
omega_poly = roots(p)

% power method
omega_power = powereig(a,5,50)

% matlab function
omega_matlab = eig(a)
