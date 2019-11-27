%   31383 ROBOTICS - PROJECT ASSIGNMENT
%   PROBLEM 9
% AXEL - NOV 28
% SEE sup_q_and_Jeff for the explanation of the changes made;

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
addpath '../functions';
sup_q_and_Jeff;
