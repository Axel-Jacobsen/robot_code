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
n1 = KT * [KD1  KP1];
n2 = KT * [KD2  KP2];
n3 = KT * [KD3  KP3];
n4 = KT * [KD4  KP4];

d1 = [JM (f_eff + KT * KD1) (KT * KP1)];
d2 = [JM (f_eff + KT * KD2) (KT * KP2)];
d3 = [JM (f_eff + KT * KD3) (KT * KP3)];
d4 = [JM (f_eff + KT * KD4) (KT * KP4)];

so_z1 = sim('simulink_problem12');

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

d1 = [JM (f_eff + KT * KD1) (KT * KP1)];
d2 = [JM (f_eff + KT * KD2) (KT * KP2)];
d3 = [JM (f_eff + KT * KD3) (KT * KP3)];
d4 = [JM (f_eff + KT * KD4) (KT * KP4)];

so_z2 = sim('simulink_problem12');

plot(so_z1.tout, so_z1.simout, 'linewidth', 3);
axis([0 0.25 0 0.75]);
legend({'signal', 'zeta=1: q1','zeta=1: q2','zeta=1: q3','zeta=1: q4'});
hold on;
plot(so_z2.tout, so_z2.simout, 'linewidth', 1);
legend({'zeta=0: q1','zeta=0: q2','zeta=0: q3','zeta=0: q4'});

