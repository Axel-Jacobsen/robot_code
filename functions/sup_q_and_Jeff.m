%% DEFINITIONS FOR q2, q3, q4 ARE ASSUMED AT THIS POINT IN THE SCRIPT
%  This is because we need to add all the variables below to our workspace,
%  yet this needs to be done with different q2,q3,q4 values. Therefore, you
%  should define q2,q3,q4 and then call this script.


addpath '../problems'
problem7;

I1    = I1_mat(1,1);
I1_yy = I1_mat(2,2);
I2    = I2_mat(1,1);
I2_zz = I2_mat(3,3);
I3    = I3_mat(1,1);
I3_yy = I3_mat(2,2);
I4    = I4_mat(3,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   With the above determined moments of inertia, we can use them to
%       determine values for the symmetric manipulator inertia tensor D(q)

delta2 = 0.34;

K0 = m2 * (1/2 * L2 - delta2)^2 + m3 * (1/2 * L3)^2;
K1 = 1/2 * (I4 + 1/4 * m4 * a4^2);
K2 = 1/2 * (I2 - I2_zz + I3 - I3_yy + K0);
K3 = I2 + I3 + K0 + 2 * K1;
K4 = m3 + m4;
K5 = 1/2 * (2 * I1_yy + I2_zz + I3_yy + K3);

f1 = 1/2 * K4 * q3^2 - 1/2 * m3 * L3 * q3;
f2 = m4 * a4 * q3;
f = 1/2 * a4 * m4 * cos(q4);

D11 = K5 + f1 - (K2 + f1) * cos(2 * q2) + K1 * cos(2 * (q2 + q4)) - f2 * cos(q2 + q4) * sin(q2);
D22 = K3 + 2 * f1 + f2 * sin(q4);

%   Defining sup_q(Dii(q))
sup_q = [D11, D22, K4, 2*K1]';

%   Finding the effective moments of inertia
n = 53;
JM = 1320 * 10^(-7);

J_eff = zeros(4,1);
for i = 1:4
    J_eff(i) = 1/(n^2) * sup_q(i) + JM;
end