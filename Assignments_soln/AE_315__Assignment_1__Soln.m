

%% Q3
x = linspace(-5, 5, 200);
sigma1 = 0.15; mu1 = 0;
sigma2 = 1; mu2 = 0;
sigma3 = 0.4; mu3 = -2;

y1 = (1)/(sigma1*sqrt(2*pi))*exp(-0.5*((x-mu1)/sigma1).^2);
y2 = (1)/(sigma2*sqrt(2*pi))*exp(-0.5*((x-mu2)/sigma2).^2);
y3 = (1)/(sigma3*sqrt(2*pi))*exp(-0.5*((x-mu3)/sigma3).^2);

fig = figure();
set(fig, 'color', 'w')
plot(x, y1, x, y2, x, y3, 'LineWidth', 3)
xlabel('x')
ylabel('f1, f2, f3')
title('Plot for the normal distribution')
l1 = legend('sigma = 0.15, mu = 0', 'sigma = 1, mu = 0', 'sigma = 0.4, mu = -2');
fontsize(fig, 24, "points")
