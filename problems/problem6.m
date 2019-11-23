syms t1 t2 d3 t4;

T01 = [cos(t1) 0 -sin(t1) 0; sin(t1) 0 cos(t1) 0; 0 -1 0 3/2; 0 0 0 1];
T12 = [cos(t2) 0 sin(t2) 0;sin(t2) 0 -cos(t2) 0; 0 1 0 0;0 0 0 1];
T23 = [-1 0 0 0; 0 0 1 0; 0 1 0 d3; 0 0 0 1];
T34 = [cos(t4) 0 sin(t4) 1.02*cos(t4); sin(t4) 0 -cos(t4) 1.02*sin(t4); 0 1 0 0; 0 0 0 1];

T02 = T01*T12;
T03 = T02*T23;
T04 = T03*T34;

z0 = [0;0;1];
z1 = T01(1:3,3);
z2 = T02(1:3,3);
z3 = T03(1:3,3);
z4 = T04(1:3,3);

o = [0;0;0];
o1 = T01(1:3,4);
o2 = T02(1:3,4);
o3 = T03(1:3,4);
o4 = T04(1:3,4);

% Joint 1 and 2 are revolute
J(:,1) = [symcross(z0, (o4-o)); z0];
J(:,2) = [symcross(z1, (o4-o1)); z1];

% Joint 3 is prismatic
J(:,3) = [z2; zeros(3,1)];

% Joint 4 is revolute
J(:,4) = [symcross(z3, (o4-o3)); z3];

getJ = matlabFunction(J);
getJ()


function [v] = symcross(a, b)
    v = [a(2)*b(3) - a(3)*b(2);
        a(3)*b(1) - a(1)*b(3);
        a(1)*b(2) - a(2)*b(1)];
end