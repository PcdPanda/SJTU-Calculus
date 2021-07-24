function [x] = BackSubstitution(Ab)
%% Applying back substitution to solve Ax = b
%
% A is an n by n matrix
% Ab is an n by (n+k) matrix 
% x is an n by k matrix 

[m,k] = size(Ab); % Find the size of the system
if m>=k 
    fprintf('Incorrect size')
    return
end

A = Ab(:,1:m); % Separate the coefficient matrix
b = Ab(:,m+1:k);

x(m,:) = b(m,:)/A(m,m); % Solution to the last variable
for i = m-1:-1:1
    tmp = b(i,:) - A(i, i+1:m) * x(i+1:m, :); 
    x(i,:) = tmp / A(i,i);
end