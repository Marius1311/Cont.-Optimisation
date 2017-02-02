function [] = getContours(x, f, px, py)
%% Plot the trajectory of the xk's

% the first thing we need is a contour plot of f
xmin = min(x(:, 1)) -1;
xmax = max(x(:, 1)) +1;
ymin = min(x(:, 2)) -1;
ymax = max(x(:, 2)) +1;

v = linspace(xmin, xmax, px);
w = linspace(ymin, ymax, py);
[X, Y] = meshgrid(v, w);
P = reshape(X, [px * py, 1]);
Q = reshape(Y, [px * py, 1]);
RawZ = evalF(f, [P, Q]);
Z = reshape(RawZ', [py, px]);
contour(X, Y, Z), xlabel('x'), ylabel('y'), zlabel('z'), title('Contours of the objective function f');
hold on;
plot(x(:, 1), x(:, 2), 'x-');
end

