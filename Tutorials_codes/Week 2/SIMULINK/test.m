

stepsize = .05;
time = 0:stepsize:1;

numericalSolution = zeros(size(time));

analyticalSolution = time.^2 +1 ;

for n = 1 : length(time)-1
    numericalSolution(1) = 1;
    numericalSolution(n+1) = numericalSolution(n) + stepsize*(2 *time(n));
end

[tODE45, yODE45] = ode45('func', [0:stepsize:1], 1);

% Plot the numerical and analytical solutions
fig = figure(); % Initialize a figure
set(fig, 'color', 'w') % Set the background color to be white
plot(tODE45, yODE45, 'r-+', 'LineWidth', 1.5);
    hold on;
plot(time, numericalSolution, ...
    'b-', 'LineWidth', 1.5); % Plot numerical solution
hold on;
plot(time, analyticalSolution, ...
    'r--', 'LineWidth', 1.5); % Plot analytical solution
hold off;

% Set plot properties
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 18);
legend('ODE45','Numerical Solution (RK1)', 'Analytical Solution', ...
    'Interpreter', 'latex', 'FontSize', 16, 'location', 'best');
set(gca, 'FontSize', 16, 'TickLabelInterpreter', 'latex');

% function dydt = myODE(t,y)
%     dydt = 2*t;
% end
