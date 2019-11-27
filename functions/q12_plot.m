%% Call this script at the end of q12 to set zeta to zero and plot all results


zeta = 0;

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
n1 = KT * [KD1  KP1];
n2 = KT * [KD2  KP2];
n3 = KT * [KD3  KP3];
n4 = KT * [KD4  KP4];

d1 = [(JM + (1/n^2)*sup_q(1))  (f_eff + KT*KD1)  KT*KP1];
d2 = [(JM + (1/n^2)*sup_q(2))  (f_eff + KT*KD2)  KT*KP2];
d3 = [(JM + (1/n^2)*sup_q(3))  (f_eff + KT*KD3)  KT*KP3];
d4 = [(JM + (1/n^2)*sup_q(4))  (f_eff + KT*KD4)  KT*KP4];

so_z2 = sim('simulink_problem12');

plot(so_z1.tout, so_z1.simout, 'linewidth', 3);
hold on;
plot(so_z2.tout, so_z2.simout, 'linewidth', 1);
