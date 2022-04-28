function [resultado,error,contador] = Cholesky(A,b)
contador = 0;
[n,m] = size(A);
U = zeros(n,n);

for i = 1 : n
    U(i,i) = sqrt(A(i,i) - U(1:i-1,i)' * U(1:i-1,i));
    contador = contador + 11;
    for j = i+1 :n
        U(i,j) = (A(i,j) - U(1:i-1,i)' * U(1:i-1,j)) / U(i,i);
        contador = contador + 8;
    end
end
L = U';

z = L\b;
resultado = U\z; % X 
error = norm(A*resultado - b);