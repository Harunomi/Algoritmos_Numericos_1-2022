function [retorno] = toPoly(x,matrix)

retorno = [];
%guardo todos los grados
grados = matrix(:,1);
%guardo los coeficientes;
coef = matrix(:,2:end);
len = size(matrix,1);
for i = 1:len
    %invertimos el arreglo
    coefInv = fliplr(coef(i,1:grados(1)));
    values = polyval(coefInv,x);
    retorno = [retorno;values];
end
% le volvemos a agregar los grados a los valores
retorno = [matrix(:,1),retorno];
end
                                                                       