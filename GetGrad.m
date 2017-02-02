function [ g ] = GetGrad( f, x, h )
%This simply calculates the gradient vector of f at a given point x in
%space

n = length(x);
g = zeros(n, 1);
I = eye(n);

for i = 1:n
   g(i, 1) =  ( evalF(f, x + I(i, :) * h) - evalF(f, x - I(i, :) * h) ) / h;
end







end

