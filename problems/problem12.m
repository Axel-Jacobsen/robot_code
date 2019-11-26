problem9;

n = 53;
omega = 15;
zeta = 1;
JM = 1320E-7;
f_eff = 2.4e-5;
KT = 0.17;

KP1 = omega^2 * J_eff(1) / KT;
KP2 = omega^2 * J_eff(2) / KT;
KP3 = omega^2 * J_eff(3) / KT;
KP4 = omega^2 * J_eff(4) / KT;

KD1 = 2*zeta*KP1/omega - f_eff/KT;
KD2 = 2*zeta*KP2/omega - f_eff/KT;
KD3 = 2*zeta*KP3/omega - f_eff/KT;
KD4 = 2*zeta*KP4/omega - f_eff/KT;

n1 = [KD1  KP1];
n2 = [KD2  KP2];
n3 = [KD3  KP3];
n4 = [KD4  KP4];

d1 = [(1/(KT*n^2)*(JM + sup_q(1)))  (1/(KT*n^2) * (f_eff + KD1))  KP1];
d2 = [(1/(KT*n^2)*(JM + sup_q(2)))  (1/(KT*n^2) * (f_eff + KD2))  KP2];
d3 = [(1/(KT*n^2)*(JM + sup_q(3)))  (1/(KT*n^2) * (f_eff + KD3))  KP3];
d4 = [(1/(KT*n^2)*(JM + sup_q(4)))  (1/(KT*n^2) * (f_eff + KD4))  KP4];

sim('simulink_problem12');
