%% HANDS ON
% p0 px py are coords in 3d space in mm
% Calculate Pbase = (vx vy vz) * Ptask + P0
% TEST INPUTS
p0 = [149.91 -333.25 1007.34]';
px = [-108.97 -310.50 1003.32]';
py = [163.99 -182.89 1008.59]';
% TEST OUTPUT: Rotation matrix is
R = [
 0.0082  -0.9998 -0.0130;
 0.9999   0.0132  0.0083;
-0.0082  -0.0132  0.9999
];

A = xform(p0, px, py);


function out = xform(p0, px, py)
    vx = ((px - p0) / norm(px - p0));
    vy = ((py - p0) / norm(py - p0));
    vz  = cross(vx, vy);
    out = [vx vy vz];
end

