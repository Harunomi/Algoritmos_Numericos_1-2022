function [X,iteracion]=GaussJacobi(A,b,x0,iter)
   X=[];
   [columnas filas]=size(A);
   if (columnas~=size(x0))|(columnas~=size(b))
       error('El sistema no es valido');
   else
       for k=1:columnas
         for j=k+1:columnas
            if k~=j
               D(j,k)=0;
               D(k,j)=0;
               L(j,k)=A(j,k);
               L(k,j)=0;
               R(k,j)=A(k,j);
               R(j,k)=0;
            end
         end
         D(k,k)=A(k,k);
         L(k,k)=0;
         R(k,k)=0;
       end
       fin=0;
       iteracion=1;
       x(1,:)=x0';
       while (fin==0)&&(iteracion<=iter)
           X=[X; x(iteracion,:)];
           for componente=1:columnas
               vectant=0;
               vectsig=0;
               for k=1:componente-1
                  vectant=vectant+A(componente,k)*x(iteracion,k);
               end
               for k=componente+1:columnas
                 vectsig=vectsig+A(componente,k)*x(iteracion,k);
               end
               x(iteracion+1,componente)=(b(componente)-vectant-vectsig)/A(componente,componente);
            end
           if x(iteracion,:)==x(iteracion+1,:)
             fin=1;
           end
           iteracion=iteracion+1;
        end
      X=[X; x(iteracion,:)];
   end
end