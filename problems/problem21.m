problem9;
problem7;
problem5;

% Define global variables needed by prof blocks
global GM m1 m2 m3 m4 L1 L2 dd2 L3 a4 I2 I3 I4 I1yy I2zz I3yy g n kT feff d1;

m1 = 4.9;
m2 = 8.1;
m3 = 4.9;
m4 = 2.2;

L1 = 0.67;
L2 = 1.7;

dd2 = 0.34;

a4 = 0.98;
d1 = 1.5;

I2 = I2_mat(1,1);
I3 = I3_mat(1,1);
I4 = I4_mat(2,2);
I1yy = I1_mat(2,2);
I2zz = I2_mat(3,3);
I3yy = I3_mat(2,2);

% 'etc' configurations
omega = 15;
zeta = 1;
feff = 2.4e-5;
kT = 0.17;

% PID Constants

KI1 = 0;
KI2 = 0;
KI3 = 0;
KI4 = 0;

Kp1 = omega^2 * J_eff(1) / kT;
Kp2 = omega^2 * J_eff(2) / kT;
Kp3 = omega^2 * J_eff(3) / kT;
Kp4 = omega^2 * J_eff(4) / kT;

KD1 = 2 * zeta * Kp1 / omega -feff/kT;
KD2 = 2 * zeta * Kp2 / omega -feff/kT;
KD3 = 2 * zeta * Kp3 / omega -feff/kT;
KD4 = 2 * zeta * Kp4 / omega -feff/kT;

sim('trc_dyn');

plot(pr(:,1), pr(:,2))
hold on
plot(p(:,1), p(:,2))
legend('Planned Path', 'True Path')
