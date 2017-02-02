function [ Y ] = evalF(f, X )
%X is a Matrix of input arguments, f is a function handle. Columns in f
%correspond to the different arguments, rows correspond to the various
%point at which one wishes to evaluate.

[a, b] = size(X);

for i = 1:a
   Y(i, :) = f(X(i, :)); 
end

end

