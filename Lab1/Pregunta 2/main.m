fprintf("Iniciando la carga de datos\n");
x1 = zeros(1,289);
x2 = zeros(1,1089);
x3 = zeros(1,4225);

tiempos1 = [];
tiempos2 = [];
tiempos3 = [];
costos1 = [];
costos2 = [];
costos3 = [];

% Carga de archivos
A1 = load("sistemas\289x289\A289.dat");
B1 = load("sistemas\289x289\b289.dat");


A2 = load("sistemas\1089x1089\A1089.dat");
B2 = load("sistemas\1089x1089\b1089.dat");

A3 = load("sistemas\4225x4225\A4225.dat");
B3 = load("sistemas\4225x4225\b4225.dat");


fprintf("Carga de datos terminada\n");

prompt = "Ingrese un valor de prioridad del 1 al 100, en donde mas cercano al uno\n" + ...
    "correspondea un valor mas exacto. \nEn cambio un valor cercano a 100 prioriza el tiempo: ";
entrada = input(prompt);
% Gestor con prioridad
if entrada < 1 || entrada > 100
    fprintf("error, valor de entrada no valido");
end
tic
M = A1;
B = B1;
x = x1;
n = size(M);
if n<1090
    if entrada < 7
        [res, error,c] = GaussJacobi(M,B',x,100000);
    elseif entrada >7 && entrada < 14
        [res, error,c] = GaussSeidel(M,B',x,100000);
    elseif entrada > 14 && entrada < 21
        [res, error,c]= LU(M,B');
    elseif entrada >21 && entrada < 28
        [res, error,c]= Cholesky(M,B);
    elseif entrada > 28 && entrada < 35
        [res,error,c] = LSQRdisperso(M,B,0.0000000001,10000);
    elseif entrada > 35 && entrada < 42
        [res,error,c] = LSQR(M,B,0.0000000001,10000);
    elseif entrada > 42 && entrada < 51
        [res,error,c] = QR(M,B); % caso promedio
    elseif entrada > 51 && entrada < 58
        [res,error,c] = LSQR(M,B,0.0000000001,10000);   
    elseif entrada > 58 && entrada < 65
        [res, error,c] = GaussJacobi(M,B',x,100000);
    elseif entrada > 65 && entrada < 72
        [res,error,c] = LSQRdisperso(M,B,0.0000000001,10000);  
    elseif entrada >72 && entrada < 79
        [res, error,c] = GaussSeidel(M,B',x,100000);
    elseif entrada > 79 && entrada < 86
        [res, error,c]= Cholesky(M,B);
    elseif entrada > 86 && entrada < 93
        [res,error,c] = QR(M,B);
    elseif entrada > 93 && entrada < 101
        [res, error,c]= LU(M,B);
    end
else
    if entrada < 7
        [res, error,c] = GaussJacobi(M,B',x,100000);
    elseif entrada >7 && entrada < 14
        [res, error,c] = GaussSeidel(M,B',x,100000);
    elseif entrada > 14 && entrada < 21
        [res, error,c]= Cholesky(M,B);
    elseif entrada >21 && entrada < 28
        [res, error,c]= LU(M,B');
    elseif entrada > 28 && entrada < 35
        [res,error,c] = QR(M,B);
    elseif entrada > 35 && entrada < 42
        [res,error,c] = LSQR(M,B,0.0000000001,10000);
    elseif entrada > 42 && entrada < 51
        [res,error,c] = LSQRdisperso(M,B,0.0000000001,10000); % caso promedio
    elseif entrada > 51 && entrada < 58
        [res, error,c] = GaussJacobi(M,B',x,100000);
    elseif entrada > 58 && entrada < 65
        [res, error,c] = GaussSeidel(M,B',x,100000);
    elseif entrada > 65 && entrada < 72
        [res,error,c] = LSQR(M,B,0.0000000001,10000); 
    elseif entrada >72 && entrada < 79
        [res,error,c] = QR(M,B);
    elseif entrada > 79 && entrada < 86
        [res, error,c]= LU(M,B);
    elseif entrada > 86 && entrada < 93
        [res, error,c]= Cholesky(M,B);
    elseif entrada > 93 && entrada < 101
        [res,error,c] = LSQRdisperso(M,B,0.0000000001,10000);
        
    end
end

toc
% GESTOR DEPENDIENDO DEL TIPO DE MATRIZ



%{
% verificamos que la matriz sea simetrica
t = transpose(A3);
tic
if A3 == t %simetrica
    if isPositive(A3) == 1
        %cholesky
        tiempoC1 = tic;
        [resC1, errorC1,c1]= Cholesky(A3,B3);
        tiempoC1 = toc(tiempoC1);
        tiempos1 = [tiempos1,tiempoC1];
    else
        % LU 
        tiempo1LU = tic;
        [resLU1, errorLU1,clu1]= LU(A3,B3');
        tiempo1LU = toc(tiempo1LU);
        tiempos1 = [tiempos1,tiempo1LU];
    end
elseif coefDispersion(A3)>= 9
    %lsqr
    tiempo1LSQR = tic;
    [resLSQR1, errorLSQR1,clsqr1] = LSQR(A3,B3,0.0000000001,10000);
    tiempo1LSQR =  toc(tiempo1LSQR);
    tiempos1 = [tiempos1,tiempo1LSQR];
elseif coefDispersion(A3)< 9
    %toma de tiempos LSQRdisperso
    tiempo1LSQRd = tic;
    [resLSQRd1, errorLSQRd1,clsqrd1] = LSQRdisperso(A3,B3,0.0000000001,10000);
    tiempo1LSQRd =  toc(tiempo1LSQRd);
    tiempos1 = [tiempos1,tiempo1LSQRd];
elseif edd(A3) == 1
    %toma de tiempos Seidel
    timeGS1 = tic;
    [resGS1, errorGS1,cs1] = GaussSeidel(A3,B3',x1,100000);
    timeGS1 = toc(timeGS1); % fin de toma de tiempos Seidel
    tiempos1 = [tiempos1,timeGS1];
elseif edd(A3) == 0
    %toma de tiempos Jacobi
    timeGJ1 = tic;
    [resGJ1, errorGJ1,cj1] = GaussJacobi(A3,B3',x1,100000);
    timeGJ1 = toc(timeGJ1); % fin toma de tiempos jacobi
    tiempos1 = [tiempos1,timeGJ1];
    costos1 = [costos1,cj1];

else
        % QR 
        tiempo1QR = tic;
        [resQR1, errorQR1,cqr1]= QR(A3,B3);
        tiempo1QR = toc(tiempo1QR);
        tiempos1 = [tiempos1,tiempo1QR];
end
%}
        



%{
tic;
%toma de tiempos Jacobi
timeGJ1 = tic;
[resGJ1, errorGJ1,cj1] = GaussJacobi(A1,B1',x1,10000);
timeGJ1 = toc(timeGJ1); % fin toma de tiempos jacobi
tiempos1 = [tiempos1,timeGJ1];
costos1 = [costos1,cj1];


%toma de tiempos Seidel
timeGS1 = tic;
[resGS1, errorGS1,cs1] = GaussSeidel(A1,B1',x1,10000);
timeGS1 = toc(timeGS1); % fin de toma de tiempos Seidel
tiempos1 = [tiempos1,timeGS1];
costos1 = [costos1,cs1];

%toma de tiempos Cholesky
tiempoC1 = tic;
[resC1, errorC1,c1]= Cholesky(A1,B1);
tiempoC1 = toc(tiempoC1);
tiempos1 = [tiempos1,tiempoC1];
costos1 = [costos1,c1];

%toma de tiempos LU
tiempo1LU = tic;
[resLU1, errorLU1,clu1]= LU(A1,B1);
tiempo1LU = toc(tiempo1LU);
tiempos1 = [tiempos1,tiempo1LU];
costos1 = [costos1,clu1];


% toma de tiempos QR
tiempo1QR = tic;
[resQR1, errorQR1,cqr1]= QR(A1,B1);
tiempo1QR = toc(tiempo1QR);
tiempos1 = [tiempos1,tiempo1QR];
costos1 = [costos1,cqr1];


%toma de tiempos LSQR
tiempo1LSQR = tic;
[resLSQR1, errorLSQR1,clsqr1] = LSQR(A1,B1,0.00000000001,10000);
tiempo1LSQR =  toc(tiempo1LSQR);
tiempos1 = [tiempos1,tiempo1LSQR];
costos1 = [costos1,clsqr1];

%toma de tiempos LSQRdisperso
tiempo1LSQRd = tic;
[resLSQRd1, errorLSQRd1,clsqrd1] = LSQRdisperso(A1,B1,0.00000000001,10000);
tiempo1LSQRd =  toc(tiempo1LSQRd);
tiempos1 = [tiempos1,tiempo1LSQRd];
costos1 = [costos1,clsqrd1];

errores1 = [errorGJ1,errorGS1,errorC1,errorLU1,errorQR1,errorLSQR1,errorLSQRd1];


%----------------------------------%

% toma de tiempos Jacobi
timeGJ2 = tic;
[resGJ2, errorGJ2,cj2] = GaussJacobi(A2,B2',x2,100000);
timeGJ2 = toc(timeGJ2); % fin toma de tiempos jacobi
tiempos2 = [tiempos2,timeGJ2];
costos2 = [costos2,cj2];

%toma de tiempos Seidel
timeGS2 = tic;
[resGS2, errorGS2,cs2] = GaussSeidel(A2,B2',x2,100000);
timeGS2 = toc(timeGS2); % fin de toma de tiempos Seidel
tiempos2 = [tiempos2,timeGS2];
costos2 = [costos2,cs2];

%toma de tiempos Cholesky
tiempoC2 = tic;
[resC2, errorC2,c2]= Cholesky(A2,B2);
tiempoC2 = toc(tiempoC2);
tiempos2 = [tiempos2,tiempoC2];
costos2 = [costos2,c2];

%toma de tiempos LU
tiempo2LU = tic;
[resLU2, errorLU2,clu2] = LU(A2,B2);
tiempo2LU = toc(tiempo2LU);
tiempos2 = [tiempos2,tiempo2LU];
costos2 = [costos2,clu2];

% toma de tiempos QR
tiempo2QR = tic;
[resQR2, errorQR2,cqr2]= QR(A2,B2);
tiempo2QR = toc(tiempo2QR);
tiempos2 = [tiempos2,tiempo2QR];
costos2 = [costos2,cqr2];

% toma de tiempo LSQR
tiempo2LSQR = tic;
[resLQSR2, errorLSQR2,clsqr2] = LSQR(A2,B2,0.00000000001,10000);
tiempo2LSQR = toc(tiempo2LSQR);
tiempos2 = [tiempos2,tiempo2LSQR];
costos2 = [costos2,clsqr2];

% toma de tiempo LSQR disperso
tiempo2LSQRd = tic;
[resLQSRd2, errorLSQRd2,clsqrd2] = LSQRdisperso(A2,B2,0.00000000001,10000);
tiempo2LSQRd = toc(tiempo2LSQRd);
tiempos2 = [tiempos2,tiempo2LSQRd];
costos2 = [costos2,clsqrd2];

errores2 = [errorGJ2,errorGS2,errorC2,errorLU2,errorQR2,errorLSQR2,errorLSQRd2];

%------------------------------------

% toma de tiempos Jacobi
timeGJ3 = tic;
[resGJ3, errorGJ3,cj3] = GaussJacobi(A3,B3',x3,100000);
timeGJ3 = toc(timeGJ3); % fin toma de tiempos jacobi
tiempos3 = [tiempos3,timeGJ3];
costos3 = [costos3,cj3];

%toma de tiempos Seidel
timeGS3 = tic;
[resGS3, errorGS3,cs3]= GaussSeidel(A3,B3',x3,100000);
timeGS3 = toc(timeGS3); % fin de toma de tiempos Seidel
tiempos3 = [tiempos3,timeGS3];
costos3 = [costos3,cs3];

%toma de tiempos Cholesky
tiempoC3 = tic;
[resC3, errorC3,c3]= Cholesky(A3,B3);
tiempoC3 = toc(tiempoC3);
tiempos3 = [tiempos3,tiempoC3];
costos3 = [costos3,c3];

%toma de tiempos LU
tiempo3LU = tic;
[resLU3, errorLU3,clu3]= LU(A3,B3);
tiempo3LU = toc(tiempo3LU);
tiempos3 = [tiempos3,tiempo3LU];
costos3 = [costos3,clu3];

% toma de tiempos QR
tiempo3QR = tic;
[resQR3, errorQR3,cqr3]= QR(A3,B3);
tiempo3QR = toc(tiempo3QR);
tiempos3 = [tiempos3,tiempo3QR];
costos3 = [costos3,cqr3];

% toma de tiempo LSQR 
tiempo3LSQR = tic;
[resLQSR3, errorLSQR3,clsqr3] = LSQR(A3,B3,0.00000000001,10000);
tiempo3LSQR = toc(tiempo3LSQR);
tiempos3 = [tiempos3,tiempo3LSQR];
costos3 = [costos3,clsqr3];

% toma de tiempo LSQR disperso
tiempo3LSQRd = tic;
[resLQSRd3, errorLSQRd3,clsqrd3] = LSQRdisperso(A3,B3,0.00000000001,10000);
tiempo3LSQRd = toc(tiempo3LSQRd);
tiempos3 = [tiempos3,tiempo3LSQRd];
costos3 = [costos3,clsqrd3];

errores3 = [errorGJ3,errorGS3,errorC3,errorLU3,errorQR3,errorLSQR3,errorLSQRd3];

toc
%}


fprintf("Ejecucion terminada\n");






