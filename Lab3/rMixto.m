function [resultado, seed] = rMixto(multi, adi, seed, n, mMinMax)
min = mMinMax(1);
max = mMinMax(2);
resultado = [];
i = 1;
delta = max - min;
while n > 2^i
    i = i + 1;
end
m = 2^i;
for j = 1:n
    valor = multi * seed + adi;
    y(j) = mod(valor,m);
    x(j) = min + delta*(y(j)/(m-1));
    seed = y(j);
    
end
resultado = [resultado,x];
end
