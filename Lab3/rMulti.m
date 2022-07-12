function [resultado, semilla]= rMulti(a, semilla, n, mMinMax)
min = mMinMax(1);
max = mMinMax(2);
resultado = [];
i = 1;
while n > 2^i
    i = i + 1;
end
m = 2^i;
for j = 1:n
    valor = a * semilla;
    y(j) = mod(valor,m);
    x(j) = min + (max-min)*(y(j)/(m-1));
    semilla = y(j);
    
end
resultado = [resultado,x];
end
