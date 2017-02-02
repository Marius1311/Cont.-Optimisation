%% Steepest Descent Backtracking Amijo 

%This is an implementation of a linesearch methods for unconstrained
%optimisation, using the steepest decent as search direction and uisng
%backtracking Amijo to find the step length.
% This method can only find local optima.

%% Objective Function and initial guess

% The function can be any function in C1 that goes from R^n to R. In order
% to guarantee global convergence to a local optimum, we need a lipschitz
% continious gradient. The method might not converge, depending on what the
% constant of convergence is.

f = @(x) x(1)^2 + x(2)^2 + sin(x(1)); % Variables must be written in this form

% The second thing we need is an initial guess.
x0 = [5, -5];

% This calls the function
[MIN, x, GradX, k, RES] = SD_bA(f, x0);

% MIN is the minimul (local)
% k is the humber of iterations needed
% GradX is a vector that contains the 2-norm of the succesive gradients
% RES is the final residual that was achieved

%% If the input argument is two dimensional:

xmin = -5;
xmax = 5;
ymin= -5;
ymax = 5;
px = 100; % Points in either direction
py = 100;

figure(1);
% We can first of all plot the function:
plotF(f, xmin, xmax, ymin, ymax, px, py);

figure(2);
% One can plot the path of the iterates together with the contour lines:
getContours(x, f, px, py);












