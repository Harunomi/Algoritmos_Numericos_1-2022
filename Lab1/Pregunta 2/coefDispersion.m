function [retorno] = coefDispersion(A)
retorno = 0;
[columnas, filas] =  size(A);
for i =0:columnas
    for j =0 :filas 
        if A(i,j) ~= 0
            retorno = retorno + 1;
        end
    end
end
retorno = (retorno/columnas*filas)* 100;