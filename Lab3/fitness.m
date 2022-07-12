function [sel, errores] = fitness(entrada,target)

[fila,~] = size(entrada);
R = [];
MSE = [];

for i = 1:fila
    mseR = mse(target-entrada(i,2:end));
    MSE = [MSE;mseR];
    [r,~] = corr(entrada(i,2:end)',target');
    R = [R;r];

end
% como fue visto en clases, se le agregara la correlacion de pearson al mse
% de modo de castigar a los errores iniciales, los cuales seran muy altos]

errores = MSE+(10^4*(1-abs(R)));
sel = [errores,entrada];