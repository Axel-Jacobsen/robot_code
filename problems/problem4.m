global GM

% Define first and last column of T04 for each point
X = [0;0;-1;0];  % Same for all points
P1 = [1.4;-0.5;0.2;1];
P2 = [1.75;0.5;0.2;1];
P3 = [2.1;-0.5;0.2;1];
P4 = [2.45;0.5;0.2;1];
P5 = [2.8;-0.5;0.2;1];

% Get q vectors
q1 = getJoints(X,P1);
q2 = getJoints(X,P2);
q3 = getJoints(X,P3);
q4 = getJoints(X,P4);
q5 = getJoints(X,P5);

% Get T array which is t_deriv(0) concat with t_deriv(2) 
T = [time_deriv_matrix(0) time_deriv_matrix(2)]; 

% Get Q_i array defined as [q_i 0 0 q_{i+1} 0 0]
q_prime = zeros(4,1);
q_double_prime = zeros(4,1);
Q1 = [q1, q_prime, q_double_prime, q2, q_prime, q_double_prime];
Q2 = [q2, q_prime, q_double_prime, q3, q_prime, q_double_prime];
Q3 = [q3, q_prime, q_double_prime, q4, q_prime, q_double_prime];
Q4 = [q4, q_prime, q_double_prime, q5, q_prime, q_double_prime];

% Calculate A_i
A1 = Q1/T;
A2 = Q2/T;
A3 = Q3/T;
A4 = Q4/T;

GM = [A1;A2;A3;A4];