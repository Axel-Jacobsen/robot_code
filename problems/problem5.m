% Define x,y coords for each point
p1 = [1.4;-0.5];  % [x;y]
p2 = [1.75;0.5];
p3 = [2.1;-0.5];
p4 = [2.45;0.5];
p5 = [2.8;-0.5];

% Define T = [t_deriv(0) t_deriv(2)]
T = [time_deriv_matrix(0) time_deriv_matrix(2)];

% Get P_i matrix defined as [p_i 0 0 p_{i+1} 0 0]
z = [0;0];
P1 = [p1 z z p2 z z];
P2 = [p2 z z p3 z z];
P3 = [p3 z z p4 z z];
P4 = [p4 z z p5 z z];

% Solve for A_i
A1 = P1/T;
A2 = P2/T;
A3 = P3/T;
A4 = P4/T;
