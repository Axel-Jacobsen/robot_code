problem7;

n = 53;
omega = 15;
zeta = 1;
JM = 1320E-7;
J_eff_1 = (1 / n^2) * max(diag(D1)) + JM;
J_eff_2 = (1 / n^2) * max(diag(D2)) + JM;
J_eff_3 = (1 / n^2) * max(diag(D3)) + JM;
J_eff_4 = (1 / n^2) * max(diag(D4)) + JM;
f_eff = 2.4e-5;
KT = 0.17;


KP1 = omega^2 * J_eff_1 / KT;
KP2 = omega^2 * J_eff_2 / KT;
KP3 = omega^2 * J_eff_3 / KT;
KP4 = omega^2 * J_eff_4 / KT;

KD1 = 2*zeta*KP1/omega - f_eff/KT;
KD2 = 2*zeta*KP2/omega - f_eff/KT;
KD3 = 2*zeta*KP3/omega - f_eff/KT;
KD4 = 2*zeta*KP4/omega - f_eff/KT;

syms s;

F1 = KP1 + s*KD1;
F2 = KP2 + s*KD2;
F3 = KP3 + s*KD3;
F4 = KP4 + s*KD4;

N1 = s^2*(1/(KT*n^2)*(JM + max(diag(D1)))) + s*(1/(KT*n^2) * (f_eff + KD1)) + KP1;
N2 = s^2*(1/(KT*n^2)*(JM + max(diag(D2)))) + s*(1/(KT*n^2) * (f_eff + KD2)) + KP2;
N3 = s^2*(1/(KT*n^2)*(JM + max(diag(D3)))) + s*(1/(KT*n^2) * (f_eff + KD3)) + KP3;
N4 = s^2*(1/(KT*n^2)*(JM + max(diag(D4)))) + s*(1/(KT*n^2) * (f_eff + KD4)) + KP4;

T1 = F1 / N1;
T2 = F2 / N2;
T3 = F3 / N3;
T4 = F4 / N4;
