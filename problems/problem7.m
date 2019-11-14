% Definitions
L1 = 0.67;
r1 = 0.04;
m1 = 4.9;

L2 = 1.7;
b2 = 0.22;
m2 = 8.1;

L3 = 1.65;
b3 = 0.18;
m3 = 4.9;

a4 = 0.98;
m4 = 2.2;

% Compute
D1 = cylinder(m1, r1, L1, 2)
D2 = cuboid(m2, b2, L2, 3)
D3 = cuboid(m3, b3, L3, 2)
D4 = thinrod(m4, a4, 1)


% Functions
% Find matrix of inertia for body with given parameters
% Axis is the index of the principal axis of the body
% 1 for x, 2 for y, 3 for z
function [I] = cylinder(m, r, L, axis)
    I = eye(3) * (1/12*m*(3*r^2 + L^2));
    I(axis,axis) = m*r^2 / 2;
end

function [I] = cuboid(m, b, L, axis)
    I = eye(3) * (1/12 * m * (b^2 + L^2));
    I(axis,axis) = 1/12 * m * 2 * b^2;

end

function [I] = thinrod(m, a, axis)
    I = eye(3) * (1/12 * m * a^2);
    I(axis,axis) = 0;
end