function [q] = getJoints(x, p)
    t1 = atan2(p(2), p(1));
    
    cx = p(1) - 1.02*x(1);
    cy = p(2) - 1.02*x(2);
    cz = p(3) - 1.02*x(3);
    
    d3 = sqrt(cx^2 + cy^2 + (cz-1.5)^2);
    
    t2 = atan2(cx/(d3*cos(t1)), (cz-1.5)/d3);
    
    phi = atan2(x(3), x(2)/sin(t1));
    t4 = phi-t2;
    
    while t4 < -pi/2
        t4 = t4 + 2*pi;
    end
    while t4 > 5*pi/4
        t4 = t4 - 2*pi;
    end
    
    while t2 < pi/6
        t2 = t2 + 2*pi;
    end
    while t2 > 3*pi/4
        t2 = t2 - 2*pi;
    end
    
    while t1 < -pi
        t1 = t1 + 2*pi;
    end
    while t1 > pi
        t1 = t1 - 2*pi;
    end
    
    q = [t1;t2;d3;t4];
end
