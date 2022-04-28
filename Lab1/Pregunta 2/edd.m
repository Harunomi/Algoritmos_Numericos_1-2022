function [retorno] = edd(A)
n=length(A);
kf=0;kc=0;
for i=1:n
    sf=sum(abs(A(i,:)));
    if(2*abs(A(i,i))>sf)
        kf=kf+1;
    end
    sc=sum(abs(A(:,i)));
    if(2*abs(A(i,i))>sc)
        kc=kc+1;
    end
end
if(kf==n || kc == n)
    retorno = 1;
else
    retorno = 0;
end
end