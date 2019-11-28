% This is needed for the simulink values n1->n4, d1->d4; the other values
% are overwritten below with the sup_q_and_Jeff script.
problem12;


%   The values that give the largest values of each element `hi` in
%       the h(q) vector can be determined by observational steps.
%   First, h3 only depends on cos(q2), which has a range of [pi/6, 3pi/4].
%          On this range, cos(q2) is maximized when q2 = pi/6
%   Using q2 = pi/6, we can then determine the value of q4 which gives the
%       largest h4. This is found to be -pi/6.
%   Lastly, with these values given, we find that q3 = 1.35 results in the
%       largest h2 (h2 is inversly proportional to q3).
q2 = pi/6;
q3 = 1.35;
q4 = -pi/6;

addpath '../functions';
sup_q_and_Jeff;

g = 9.81;

hq1 = 0;
hq2 = 0.5*m4*a4*cos(q2 + q4) + (m2*(delta2 - 0.5*L2) + m3*(.5*L3 - q3) - m4*q3)*sin(q2);
hq3 = (m3 + m4) * cos(q2);
hq4 = 0.5*a4*m4*cos(q2 + q4);

hq = g * [hq1; hq2; hq3; hq4];

TL = hq;

% 'etc' configurations
omega = 15;
zeta = 1;
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
A1 = 1; % KT * [KD1  KP1];
A2 = 1; %KT * [KD2  KP2];
A3 = 1; %KT * [KD3  KP3];
A4 = 1; %KT * [KD4  KP4];

C1 = n^2 * [J_eff(1)  (f_eff + KT*KD1)  KT*KP1  0];
C2 = n^2 * [J_eff(2)  (f_eff + KT*KD2)  KT*KP2  0];
C3 = n^2 * [J_eff(3)  (f_eff + KT*KD3)  KT*KP3  0];
C4 = n^2 * [J_eff(4)  (f_eff + KT*KD4)  KT*KP4  0];

so_z1 = sim('simulink_problem13');

% Script to plot zeta = 1 and zeta = 0 on the same graph
% Uncomment the following two lines to do this - its hacky but its also
% 11 pm, and i am exhausted

% addpath '../functions'
% q12_plot;
