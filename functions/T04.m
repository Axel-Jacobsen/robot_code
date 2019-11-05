%% DH

function out = T04(q)
    % constants
    d1 = 1.50; % m
    a4 = 1.02; % m

    % free variables - initial settings
    q1 = q(1);
    q2 = q(2);
    q3 = q(3);
    q4 = q(4);

    % DH Definitions
    a_1 = 0;
    d_1 = d1;
    alpha_1 = -pi/2;
    theta_1 = q1;

    a_2 = 0;
    d_2 = 0;
    alpha_2 = pi/2;
    theta_2 = q2;

    a_3 = 0;
    d_3 = q3;
    alpha_3 = pi/2;
    theta_3 = pi;

    a_4 = a4;
    d_4 = 0;
    alpha_4 = pi/2;
    theta_4 = q4;

    % Matrix math and calculation
    T01_dh = DH_matrix(a_1, alpha_1, d_1, theta_1);
    T12_dh = DH_matrix(a_2, alpha_2, d_2, theta_2);
    T23_dh = DH_matrix(a_3, alpha_3, d_3, theta_3);
    T34_dh = DH_matrix(a_4, alpha_4, d_4, theta_4);

    out = T01_dh * T12_dh * T23_dh * T34_dh;
end


function outMatrix = DH_matrix(a, alpha, d, theta)
    outMatrix = [
        cos(theta) -sin(theta) * cos(alpha)  sin(theta) * sin(alpha) a * cos(theta);
        sin(theta)  cos(theta) * cos(alpha) -cos(theta) * sin(alpha) a * sin(theta);
        0           sin(alpha)               cos(alpha)              d             ;
        0           0                        0                       1
    ];
end
