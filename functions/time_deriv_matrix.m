%% Time and Derivative Matrix
%
% defines [t^5 t^4 ... t 1 ; 5t^4 4t^3 ... 1 0; 20t^3 12t^2 ... 0 0]'

function A = time_deriv_matrix(t)
    A = [
        t^5    t^4    t^3   t^2 t^1 1 ;
        5*t^4  4*t^3  3*t^2 2*t   1 0 ;
        20*t^3 12*t^2 6*t   2     0 0
    ]';
end
