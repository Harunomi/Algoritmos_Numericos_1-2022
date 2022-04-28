function [retorno] = isPositive(A)
try chol(A);
    retorno = 1;
catch ME;
    retorno = 0;
end
end
