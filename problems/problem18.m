problem9;
problem5;

% Define global variables needed by prof blocks
global GM m1 m2 m3 m4 L1 L2 dd2 L3 a4 I2 I3 I4 I1yy I2zz I3yy g n k_T f_eff d1;

m1 = 4.9;
m2 = 8.1;
m3 = 4.9;
m4 = 2.2;

L1 = 0.67;
L2 = 1.7;

dd2 = 0.34;

a4 = 0.98;
d1 = 1.5;

% 'etc' configurations
omega = 15;
zeta = 1;
f_eff = 2.4e-5;
k_T = 0.17;

% PID Constants

KI = omega^2 / k_T;

KP1 = KI * (2 * zeta / omega + J_eff(1));
KP2 = KI * (2 * zeta / omega + J_eff(2));
KP3 = KI * (2 * zeta / omega + J_eff(3));
KP4 = KI * (2 * zeta / omega + J_eff(4));

KD1 = (1 + 2 * zeta * omega * J_eff(1) -  J_eff(1)) / k_T;
KD2 = (1 + 2 * zeta * omega * J_eff(2) -  J_eff(2)) / k_T;
KD3 = (1 + 2 * zeta * omega * J_eff(3) -  J_eff(3)) / k_T;
KD4 = (1 + 2 * zeta * omega * J_eff(4) -  J_eff(4)) / k_T;

% Transfer Function Numerators (ni) and Denomenators (di)
num1 = k_T * [KD1  KP1  KI];
num2 = k_T * [KD2  KP2  KI];
num3 = k_T * [KD3  KP3  KI];
num4 = k_T * [KD4  KP4  KI];

den1 = [J_eff(1)  (f_eff + k_T*KD1)  k_T*KP1  k_T*KI];
den2 = [J_eff(2)  (f_eff + k_T*KD2)  k_T*KP2  k_T*KI];
den3 = [J_eff(3)  (f_eff + k_T*KD3)  k_T*KP3  k_T*KI];
den4 = [J_eff(4)  (f_eff + k_T*KD4)  k_T*KP4  k_T*KI];

% TL Transfer Function Numerators (Ai) and Denomenators (Ci)
A1 = k_T;
A2 = k_T;
A3 = k_T;
A4 = k_T;

C1 = n^2 * den1;
C2 = n^2 * den2;
C3 = n^2 * den3;
C4 = n^2 * den4;

% Pre Filter Transfer Function Denomenators (PFi)
PF1 = [KD1/KI  KP1/KI  1];
PF2 = [KD2/KI  KP2/KI  1];
PF3 = [KD3/KI  KP3/KI  1];
PF4 = [KD4/KI  KP4/KI  1];

so_z1 = sim('simulink_problem18');

% Script to plot zeta = 1 and zeta = 0 on the same graph
% Uncomment the following two lines to do this - its hacky but its also
% 11 pm, and i am exhausted

% addpath '../functions'
% q12_plot;

figure()
plot(so_z1.q)
hold on
plot(so_z1.qr)
legend('q1', 'q2', 'q3', 'q4', 'qr1', 'qr2', 'qr3', 'qr4')
hold off

figure()
plot(so_z1.p.Data(:,1), so_z1.p.Data(:,2))
xlabel('Px')
ylabel('Py')

