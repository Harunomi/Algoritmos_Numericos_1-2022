function [raiz, Error,contador] = LU(A,b)
contador = 0;
if nargin < 1
    error('la matriz no es cuadrada')
else
    [cols, filas] = size(A);
    if cols ~= filas
        error('la matriz no es cuadrada');
    else
        L = zeros(cols);
        U = zeros(cols);
        U(1,1) = 1;
        L(1,1) = A(1,1);
        contador = contador + 5;
        for i=2:cols
            U(i,i)=1;
            L(i,1)=A(i,1);
            U(1,i)=A(1,i)/L(1,1);
            contador = contador + 5;
        end
        for j=2:cols
            for i=j:cols
                sumaL=0;
                sumaU=0;
                contador = contador + 2;
                for k=1:j-1
                    if(L(i,k)~=0)&&(U(k,j)~=0)
                        sumaL=sumaL+L(i,k)*U(k,j);
                        contador = contador + 4;
                    end
                    if (L(j,k)~=0)&&(U(k,i)~=0)
                        sumaU=sumaU + L(j,k)*U(k,i);
                        contador = contador + 4;
                    end
                end
                L(i,j) = A(i,j)-sumaL;
                contador = contador + 2;
                if(j<cols)&&(i>j)
                    U(j,i) = (A(j,i)-sumaU)/L(j,j);
                    contador = contador + 4;
                end
            end
        end
    end
    z = L\b;
    raiz = U\z;
    Error = norm(A*raiz-b);
end