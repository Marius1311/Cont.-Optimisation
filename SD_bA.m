function [MIN, x, gradX, k, RES] = SD_bA(f, x0, varargin)
% This function computes the minimum of a function of n variables using 
% a steepest descent methods where the stepsize is choosen using backtrackin Amijo

%% Parameters

if nargin == 2
    TOL = 1.e-3; % Tolerance
    IterMax = 200; % Max Number of iterations
    beta = 0.1; % has to be in (0, 1)
    alpha0 = 1; % Determines where we start the step size search
    tau = 0.8; % has to be in (0, 1)
elseif nargin == 7
    TOL = varargin{1}; % Tolerance
    IterMax = varargin{2}; % Max Number of iterations
    beta = varargin{3}; % has to be in (0, 1)
    alpha0 = varargin{4}; % Determines where we start the step size search
    tau = varargin{5}; % has to be in (0, 1)
end

%% Main Routine

k = 1; % Initialise loop count
[n, n] = size(x0); % gives the dimensions of the objective function
x = zeros(IterMax, n); % An array to store the iterates
x(1, :) = x0;
gradX = zeros(IterMax, 1); % We will store the magnitude of the gradient in here, not the actual gradients
h = 0.1; % spacing needed to approximate the gradient
gradX(1, 1) = norm(GetGrad(f, x0, h), 2); % Numerical approximation of the N-Dimensional Gradient (central differences)
RES = gradX(1, 1);

%Main loop
while k <= IterMax && RES > TOL
    % First, we need to find a search direction s
    CurrentX = x(k, :); 
    s = - GetGrad(f, CurrentX, h); % We use simply steepest descent
    
    % second, we need to compute a stepwidth alpha. We use backtracking
    % Amijo
    alpha = alpha0;
    % Check Amijo condition:
    while evalF(f, CurrentX + alpha * s') > evalF(f, CurrentX) + beta*alpha * GetGrad(f, CurrentX, h)' * s
        alpha = tau * alpha;
    end
    
    % Third, we update the iterate:
    x(k+1, :) = CurrentX + alpha * s';
    gradX(k+1, 1) = norm(GetGrad(f, x(k+1, :), h), 2); 
    RES = gradX(k+1, 1); % Calculate residual
    k = k+1;
end

x = x(1:k, :);
gradX = gradX(1:k, 1);
MIN = x(k, :);

end


