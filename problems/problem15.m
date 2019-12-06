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
num1 = KT * [KD1  KP1  KI];
num2 = KT * [KD2  KP2  KI];
num3 = KT * [KD3  KP3  KI];
num4 = KT * [KD4  KP4  KI];

den1 = [J_eff(1)  (f_eff + KT*KD1)  KT*KP1  KT*KI];
den2 = [J_eff(2)  (f_eff + KT*KD2)  KT*KP2  KT*KI];
den3 = [J_eff(3)  (f_eff + KT*KD3)  KT*KP3  KT*KI];
den4 = [J_eff(4)  (f_eff + KT*KD4)  KT*KP4  KT*KI];

% TL Transfer Function Numerators (Ai) and Denomenators (Ci)
A1 = KT;
A2 = KT;
A3 = KT;
A4 = KT;

C1 = n^2 * den1;
C2 = n^2 * den2;
C3 = n^2 * den3;
C4 = n^2 * den4;

so_z1 = sim('simulink_problem15');

% Script to plot zeta = 1 and zeta = 0 on the same graph
% Uncomment the following two lines to do this - its hacky but its also
% 11 pm, and i am exhausted

% addpath '../functions'
% q12_plot;



