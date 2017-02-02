function [  ] = plotF( f, xmin, xmax, ymin, ymax, px, py )
%This simply plots f in case there are only two input arguments

v = linspace(xmin, xmax, px);
w = linspace(ymin, ymax, py);
[X, Y] = meshgrid(v, w);
P = reshape(X, [px * py, 1]);
Q = reshape(Y, [px * py, 1]);
RawZ = evalF(f, [P, Q]);
Z = reshape(RawZ', [py, px]);
surf(X, Y, Z), xlabel('x'), ylabel('y'), zlabel('z'), title('Surface plot of the objective function f');

end

