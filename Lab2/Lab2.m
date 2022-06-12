archivo = readFile();

% eliminacion de datos innecesarios
mAux = archivo(:,6:235);
matriz = mAux(2:363,:);

% maipu
maipuy1 = matriz(114,:);
maipux1 = 1:1:size(maipuy1,2);

% vitacura
vitacuray1 = matriz(140,:);
vitacurax1 = 1:1:size(vitacuray1,2);


% interpolacion
% maipu
maipux0 = 1:2:size(maipux1,2);

maipuLineal = interp1(maipux1,maipuy1,maipux0,'linear');

maipuSpline = interp1(maipux1,maipuy1,maipux0,'spline');

maipuDFT = interpft(maipuy1,length(maipux0));


% vitacura

vitacurax0 = 1:2:size(vitacuray1,2);

vitacuraLineal = interp1(vitacurax1,vitacuray1,vitacurax0,'linear');

vitacuraSpline = interp1(vitacurax1,vitacuray1,vitacurax0,'spline');

vitacuraDFT = interpft(vitacuray1,length(vitacurax0));
%{
plot(maipux1,maipuy1,vitacurax1,vitacuray1);
legend("Maipu","Vitacura");
title('Incidencia Maipu vs Vitacura');
xlabel('Dias');
ylabel('Incidencia');
%}

%plotting

plot(maipux1,maipuy1,maipux0,maipuLineal,'--',maipux0,maipuSpline,':',maipux0,maipuDFT,'.');
legend("Maipu Original","Maipu Lineal","Maipu spline","Maipu DFT");
title('Comparativa de curvas originales e interpoladas')
xlabel('Dias');
ylabel('Incidencia');
% toma de errores


valorOriginalMaipu = trapz(maipux1,maipuy1);

valorLinealMaipu = trapz(maipux0,maipuLineal);
valorSplineMaipu = trapz(maipux0,maipuSpline);
valorDFTMaipu = trapz(maipux0,maipuDFT);

ErrorRelativoLinealM = abs(valorOriginalMaipu - valorLinealMaipu)/valorOriginalMaipu;
ErrorRelativoSplineM = abs(valorOriginalMaipu - valorSplineMaipu)/valorOriginalMaipu;
ErrorRelativoDFTM = abs(valorOriginalMaipu- valorDFTMaipu)/valorOriginalMaipu;

% Vitacura
valorOriginalVitacura = trapz(vitacurax1,vitacuray1);

valorLinealVitacura = trapz(vitacurax0,vitacuraLineal);
valorSplineVitacura = trapz(vitacurax0,vitacuraSpline);
valorDFTVitacura = trapz(vitacurax0,vitacuraDFT);

ErrorRelativoLinealV = abs(valorOriginalVitacura - valorLinealVitacura)/valorOriginalVitacura;
ErrorRelativoSplineV = abs(valorOriginalVitacura - valorSplineVitacura)/valorOriginalVitacura;
ErrorRelativoDFTV = abs(valorOriginalVitacura - valorDFTVitacura)/valorOriginalVitacura;
%}

% area de interes
vectorX = 1:1:163;
vectorInteresM = maipuy1(24:186);
vectorInteresV = vitacuray1(24:186);

areaInteresM = trapz(vectorX,vectorInteresM);
areaInteresV = trapz(vectorX,vectorInteresV);

resultado = areaInteresM/areaInteresV;












