function [resultado,error] = Cholesky(A,b)

[n,m] = size(A);
U = zeros(n,n);

for i = 1 : n
    U(i,i) = sqrt( A(i,i) - U(1:i-1,i)' * U(1:i-1,i) );

    for j = i+1 :n
        U(i,j) = (A(i,j) - U(1:i-1,i)' * U(1:i-1,j)) / U(i,i);
    end
end
L = U';

z = L\b;
resultado = U\z; % X 
error = norm(A*resultado - b);