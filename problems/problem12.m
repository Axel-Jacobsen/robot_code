problem9;

% 'etc' configurations
omega = 1;
zeta = 10;
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

d1 = [J_eff(1)  (f_eff + KT*KD1)  KT*KP1];
d2 = [J_eff(2)  (f_eff + KT*KD2)  KT*KP2];
d3 = [J_eff(3)  (f_eff + KT*KD3)  KT*KP3];
d4 = [J_eff(4)  (f_eff + KT*KD4)  KT*KP4];

so_z1 = sim('simulink_problem12');

% Script to plot zeta = 1 and zeta = 0 on the same graph
% Uncomment the following two lines to do this - its hacky but its also
% 11 pm, and i am exhausted

% addpath '../functions'
% q12_plot;
