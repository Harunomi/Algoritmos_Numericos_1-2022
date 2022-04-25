function raiz = LU(A,b)
      [columnas filas]=size(A);
      if columnas~=filas
         error('La matriz no es cuadrada');
      else
         L=zeros(columnas);
         U=zeros(columnas);
         U(1,1)=1;
         L(1,1)=A(1,1);
         for i=2:columnas
            U(i,i)=1;
            L(i,1)=A(i,1);
            U(1,i)=A(1,i)/L(1,1);
         end
         for j=2:columnas
            for i=j:columnas
               sumal=0;
               sumau=0;
               for k=1:j-1
                  if (L(i,k)~=0)&(U(k,j)~=0)
                     sumal=sumal+L(i,k)*U(k,j);
                  end
                  if (L(j,k)~=0)&(U(k,i)~=0)
                     sumau=sumau+L(j,k)*U(k,i);
                  end
               end
               L(i,j)=A(i,j)-sumal;
               if (j<columnas)&(i>j)
                  U(j,i)=(A(j,i)-sumau)/L(j,j);
               end
            end
         end
      end
   matrizB = b';
   z = inv(L)*matrizB;
   raiz = inv(U)*z;
end