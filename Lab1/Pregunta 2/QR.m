function [X,error,contador] = QR(A, b)
contador = 0;
X=[];
[m, n] = size(A);
contador = contador + 7;
if m < n
   disp('Error');
end
R = zeros(n, n);
V = A;
Q = zeros(m, n);
contador = contador + 7;

for i = 1:n
    R(i,i) = norm(V(:,i));
    Q(:,i) = V(:,i) / R(i,i);
    contador = contador + 9;
    for j = i+1:n
       R(i,j) = (Q(:,i)') * V(:,j);
       V(:,j) = V(:,j) - R(i,j)*Q(:,i);
       contador = contador + 9;
    end
end
X=R\Q'*b;
error = norm(A*X-b);