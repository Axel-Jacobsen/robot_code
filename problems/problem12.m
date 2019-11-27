problem9;

% 'etc' configurations
n = 53;
omega = 15;
zeta = 1;
JM = 1320E-7;
f_eff = 2.4e-5;
KT = 0.17;

% PD Constants
KP1 = omega^2 * J_eff(1) / KT;
KP2 = omega^2 * J_eff(2) / KT;
KP3 = omega^2 * J_eff(3) / KT;
KP4 = omega^2 * J_eff(4) / KT;

KD1 = 2*zeta*KP1/omega - f_eff/KT;
KD2 = 2*zeta*KP2/omega - f_eff/KT;
KD3 = 2*zeta*KP3/omega - f_eff/KT;
KD4 = 2*zeta*KP4/omega - f_eff/KT;

% Transfer Function Numerators (ni) and Denomenators (di)
n1 = 2 * KT * n * [KD1  KP1];
n2 = 2 * KT * n * [KD2  KP2];
n3 = 2 * KT * n * [KD3  KP3];
n4 = 2 * KT * n * [KD4  KP4];

d1 = [(JM*n + (1/n)*sup_q(1))  (f_eff/n + KT*KD1*n)  KT*n*KP1];
d2 = [(JM*n + (1/n)*sup_q(2))  (f_eff/n + KT*KD2*n)  KT*n*KP2];
d3 = [(JM*n + (1/n)*sup_q(3))  (f_eff/n + KT*KD3*n)  KT*n*KP3];
d4 = [(JM*n + (1/n)*sup_q(4))  (f_eff/n + KT*KD4*n)  KT*n*KP4];

sim('simulink_problem12');
