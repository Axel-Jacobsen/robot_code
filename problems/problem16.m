problem9;

% 'etc' configurations
omega = 15;
zeta = 1;
f_eff = 2.4e-5;
KT = 0.17;

% PID Constants

KI = omega^2 / KT;

KP1 = KI * (2 * zeta / omega + J_eff(1));
KP2 = KI * (2 * zeta / omega + J_eff(2));
KP3 = KI * (2 * zeta / omega + J_eff(3));
KP4 = KI * (2 * zeta / omega + J_eff(4));

KD1 = (1 + 2 * zeta * omega * J_eff(1) -  J_eff(1)) / KT;
KD2 = (1 + 2 * zeta * omega * J_eff(2) -  J_eff(2)) / KT;
KD3 = (1 + 2 * zeta * omega * J_eff(3) -  J_eff(3)) / KT;
KD4 = (1 + 2 * zeta * omega * J_eff(4) -  J_eff(4)) / KT;

% Transfer Function Numerators (ni) and Denomenators (di)
n1 = KT * [KD1  KP1  KI];
n2 = KT * [KD2  KP2  KI];
n3 = KT * [KD3  KP3  KI];
n4 = KT * [KD4  KP4  KI];

d1 = [J_eff(1)  (f_eff + KT*KD1)  KT*KP1  KT*KI];
d2 = [J_eff(2)  (f_eff + KT*KD2)  KT*KP2  KT*KI];
d3 = [J_eff(3)  (f_eff + KT*KD3)  KT*KP3  KT*KI];
d4 = [J_eff(4)  (f_eff + KT*KD4)  KT*KP4  KT*KI];

% TL Transfer Function Numerators (Ai) and Denomenators (Ci)
A1 = KT;
A2 = KT;
A3 = KT;
A4 = KT;

C1 = n^2 * d1;
C2 = n^2 * d2;
C3 = n^2 * d3;
C4 = n^2 * d4;

% Pre Filter Transfer Function Denomenators (PFi)
PF1 = [KD1/KI  KP1/KI  1];
PF2 = [KD2/KI  KP2/KI  1];
PF3 = [KD3/KI  KP3/KI  1];
PF4 = [KD4/KI  KP4/KI  1];

so_z1 = sim('simulink_problem16');

% Script to plot zeta = 1 and zeta = 0 on the same graph
% Uncomment the following two lines to do this - its hacky but its also
% 11 pm, and i am exhausted

% addpath '../functions'
% q12_plot;



