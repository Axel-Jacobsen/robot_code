% addpath("functions/");

%% Define first and last column of T04 for each point
X = [0;0;-1;0];  % Same for all points
P1 = [1.4;-0.5;0.2;1];
P2 = [1.75;0.5;0.2;1];
P3 = [2.1;-0.5;0.2;1];
P4 = [2.45;0.5;0.2;1];
P5 = [2.8;-0.5;0.2;1];

%% Get q vectors
q1 = getJoints(X,P1);
q2 = getJoints(X,P2);
q3 = getJoints(X,P3);
q4 = getJoints(X,P4);
q5 = getJoints(X,P5);