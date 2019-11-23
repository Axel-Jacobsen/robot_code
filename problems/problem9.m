%   31383 ROBOTICS - PROJECT ASSIGNMENT
%   PROBLEM 9

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   BELOW IS COPIED AND PASTED FROM Q7 TO FIND THE ...

%   Defining numerical values for each of the 4 links
%   Link 1 = Cylinder
L1 = 0.67;
r1 = 0.04;
m1 = 4.9;
%   Link 2 = Box
L2 = 1.7;
b2 = 0.22;
m2 = 8.1;
%   Link 3 = Box
L3 = 1.65;
b3 = 0.18;
m3 = 4.9;
%   Link 4 = Infinitely thin rod
a4 = 0.98;
m4 = 2.2;

%   Determining the principal moments of inertia for each link
%       and consequently the matrix of inertia D
%   Link 1
I1 = 1/4 *m1 * r1^2 + 1/12 * m1 * L1^2;  % = I1_xx = I1_zz
I1_yy = 1/2 * m1 * r1^2; 

%   Link 2
I2 = 1/12 * m2 * (b2^2 + L2^2);  % = I2_xx = I2_yy
I2_zz = 1/12 * m2 *(b2^2 + b2^2);

%   Link 3
I3 = 1/12 * m3 * (b3^2 + L3^2);  % = I3_xx = I3_zz
I3_yy = 1/12 * m3 *(b3^2 + b3^2);

%   Link 4
I4 = 1/12 * m4 * a4^2;   % = I4_yy = I4_zz


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

%   The values that give the largest values of each diagonal element Dii in
%       the D(q) matrix can be determined by observational steps.
%   We first realise that as f1 and f2 are a function of q3 only, we can
%       determine which value between [1.35,3] will give the greatest
%       output of f1 and f2. This was found to be 3.00.
%   Using q3 = 3, we can then determine the value of q4 which gives the
%       largest D22. This is found to be pi/2.
%   Lastly, with these values given, we find that q2 = pi/2 results in the
%       largest D11.
q2 = pi/2;
q3 = 3;
q4 = pi/2;

f1 = 1/2 * K4 * q3^2 - 1/2 * m3 * L3 * q3;
f2 = m4 * a4 * q3;
f = 1/2 * a4 * m4 * cos(q4);

D11 = K5 + f1 - (K2 + f1) * cos(2 * q2) + K1 * cos(2 * (q2 + q4)) - f2 * cos(q2 + q4) * sin(q2);
D22 = K3 + 2 * f1 + f2 * sin(q4);

%   Defining sup_q(Dii(q))
sup_q = [D11, D22, K4, 2*K1]';

%   Finding the effective moments of inertia
n = 53;
Jm = 1320 * 10^(-7);

J_eff = zeros(4);
for i = 1:4
    J = 1/(n^2) * sup_q(i) + Jm;
    J_eff(i) = J;
end

J_eff = J_eff';
