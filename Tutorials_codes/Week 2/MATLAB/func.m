function dxdt = myODE(t, x)
    % Function representing the system of first-order ODEs
    % Inputs:
    %   t: time
    %   y: vector containing the variables y(t) and v(t)
    % Output:
    %   dydt: vector of derivatives of y(t) and v(t)

    dxdt = zeros(2, 1);
    dxdt(1) = x(2);  % Derivative of y(t) is v(t)
    dxdt(2) = cos(t) - 4 * x(2) - 3 * x(1);  % Derivative of v(t) is given by the second-order ODE
end