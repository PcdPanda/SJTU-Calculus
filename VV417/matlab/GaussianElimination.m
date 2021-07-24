function [Ab] = GaussianElimination(A, b)
%% Applying Naive Gaussian Elimination to the agumented matrix A|b
%
% A is an n by n matrix 
% b is an n by k matrix (k number of n-vector)
% Ab is a row echelon form of A|b without leading coefficient being 1

[m, n] = size(A); % Find size of matrix A
if m~=n
    fprintf('A must be n by n \n')
    return
end
m = size(b,1); % Find size of matrix b
if m~=n
    fprintf('b must be compatible with A \n')
    return
end  
   
for j = 1:(n-1)
    if A(j, j) == 0 % Check if we need interchange rows 
        fprintf('Row %d ',j)
        for i = (j+1):n
            if A(i,j) ~= 0
                fprintf('is interchanged with row %d \n',i)
                tmp = A(i,:);
                A(i,:) = A(j,:);
                A(j,:) = tmp;
                tmp = b(i,:);
                b(i,:) = b(j,:);
                b(j,:) = tmp;
                break
            elseif i == n
                fprintf('No unique solution exists \n')
                return
            end
        end
    end
    for i = (j+1):n
        alpha = - A(i,j)/A(j,j); % Multiplier alpha
        A(i,:) = A(i,:) + alpha * A(j,:);
        b(i,:) = b(i,:) + alpha * b(j,:);
    end
end

if A(n,n) == 0 % Check if the last diagonal is zero 
    fprintf('No unique solution exists \n')
    return
else
    Ab = [A,b];
end           