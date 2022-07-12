clear
archivo = readFile();
% eliminacion de datos innecesarios
mAux = archivo(:,6:235);
matriz = mAux(2:363,:);

% maipu
maipu = matriz(114,:);
n1 = 20;
v = ones(n1);
v = v(1,:)/n1;

maipuAjustado = ceil(conv(maipu,v));

maipuAjustado = maipuAjustado(1:230);


% division del dataset
maipu1 = maipuAjustado(1:77);
maipu2 = maipuAjustado(78:154);
maipu3 = maipuAjustado(155:230);

target = maipu1;
x1 = 1:1:size(target,2);



%{
pObjetivo = polyfit(x1,maipu1,3);
y0 = polyval(pObjetivo,x1);
%}

%errorAjuste = sum(maipu) - sum(maipuAjustado);

%-----------------Parametros iniciales generacion de numeros---------%
mmin = -10000; 
mmax = 10000;
vMin = [];
vMax = [];
for i = 1:19
    vMin = [vMin,mmin];
end
for i = 1:19
    vMax = [vMax,mmax];
end
mMinMax = [vMin;vMax];

sims = 1000;
v_aditivo = 17;
v_mult = 13;
seed = 3;
gradoMin = 4;
gradoMax = 19;
resultado = [];


iter = 0;
coefientesGlobales = [];
valoresGlobales = [];
while iter < 10000
    % generacion de numeros
    random = [];
    for i=1:gradoMax
        
        %[resultado,seed] = rAditivo(v_aditivo,seed,sims,mMinMax(:,i));         
        %[resultado,seed] = rMixto(v_mult,v_aditivo,seed,sims,mMinMax(:,i));
        [resultado,seed] = rMulti(v_mult,seed,sims,mMinMax(:,i));
        random = [random,resultado'];

    
    end
    % generamos los grados
    grado = randi([gradoMin,gradoMax], sims, 1);
    gradoRandom = [grado, random];

    %obtenemos los valores del polinomio segun su grado
    valores = toPoly(x1,gradoRandom);

    [sel,errores] = fitness(valores,target);
    
    %aplicamos un sort por el error obtenido
    sel = sortrows(sel,1);
    % seleccionamos a los primeros 20%
    bestValues = sel(1:end*0.2,:);

    %ahora hacemos lo mismo para los coeficientes
    errorCoef = [errores,gradoRandom];
    errorCoef = sortrows(errorCoef,1);
    bestCoef = errorCoef(1:end*0.2,:);

    %guardamos los mejores datos en una global
    valoresGlobales = [valoresGlobales;bestValues];
    
    %seteamos los coeficientes que no pertenecen a su grado a 0
    aux = size(bestCoef,2);
    bestCoef(:,1+aux:19+2) = 0;

    coefientesGlobales = [coefientesGlobales;bestCoef];
    valoresGlobales = sortrows(valoresGlobales,1);

    coefientesGlobales = sortrows(coefientesGlobales,1);
    coefientesGlobales = coefientesGlobales(1:0.2*end,:);

    %obtenemos los grados minimos y maximos y los seteamos para la
    %siguiente iteracion

    gradoMin = min(bestValues(:,2));
    gradoMax = max(bestValues(:,2));

    %minimos y maximos para los coeficientes
    mMinMax = [];
    for i=3:gradoMax+2
        nMinMax = toMinMax(coefientesGlobales(:,i));
        mMinMax = [mMinMax,nMinMax];
    end
    iter = iter + 1

    %hacemos una condicion de termino
    if var(valoresGlobales(1:10,1)) < 10^-8
        break;
    end
end
besto = valoresGlobales(1,:);
727




    










    




    



















