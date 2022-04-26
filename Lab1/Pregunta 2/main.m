fprintf("Iniciando la carga de datos\n");

% Carga de archivos
A1 = load("sistemas\289x289\A289.dat");
B1 = load("sistemas\289x289\b289.dat");

A2 = load("sistemas\1089x1089\A1089.dat");
B2 = load("sistemas\1089x1089\b1089.dat");

A3 = load("sistemas\4225x4225\A4225.dat");
B3 = load("sistemas\4225x4225\b4225.dat");


fprintf("Carga de datos terminada\n");



while opcion ~=0
    fprintf("Ingrese una de las siguientes opciones para la resolucion de los sistemas");
    fprintf("1: Modo automatico");
    fprintf("2: Modo Manual");
    input(opcion);
    switch opcion
        case 1
            fprintf("Aqui va el modo con el gestor");

        case 2
            fprintf("Ingrese la matriz que desea evaluar:");
            fprintf("1: 289x289\n");
            fprintf("2: 1089x1089\n");
            fprintf("3: 4225x4225\n");
            input(opcionMatriz);
            fprintf("Ingrese el metodo que desea utilizar\n");
            fprintf("1: Gauss.Jacobi\n");
            fprintf("2: Gauss.Seidel\n");
            fprintf("3: Cholesky\n");
            fprintf("4: LU \n");
            fprintf("5: QR\n");
            fprintf("6: LSQR\n");
            fprintf("7: LSQR-Disperso\n");
            input(opcionMetodo);
            switch opcionMatriz
                case 1
                    x1 = zeros(1,289);
                    switch opcionMetodo
                        case 1 % toma de tiempos Jacobi
                            timeGJ1 = tic;
                            [resGJ1, errorGJ1] = GaussJacobi(A1,B1',x1,100000);
                            timeGJ1 = toc(timeGJ1); % fin toma de tiempos jacobi
                            tiempos1 = [tiempos1,timeGJ1];
                        case 2 %toma de tiempos Seidel
                            timeGS1 = tic;
                            [resGS1, errorGS1] = GaussSeidel(A1,B1',x1,100000);
                            timeGS1 = toc(timeGS1); % fin de toma de tiempos Seidel
                            tiempos1 = [tiempos1,timeGS1];
                        case 3 %toma de tiempos Cholesky
                            tiempoC1 = tic;
                            [resC1, errorC1]= Cholesky(A1,B1);
                            tiempoC1 = toc(tiempoC1);
                            tiempos1 = [tiempos1,tiempoC1];
                        case 4 %toma de tiempos LU
                            tiempo1LU = tic;
                            [resLU1, errorLU1]= LU(A1,B1');
                            tiempo1LU = toc(tiempo1LU);
                            tiempos1 = [tiempos1,tiempo1LU];
                        case 5 % toma de tiempos QR
                            tiempo1QR = tic;
                            [resQR1, errorQR1]= QR(A1,B1);
                            tiempo1QR = toc(tiempo1QR);
                            tiempos1 = [tiempos1,tiempo1QR];
                        case 6 %toma de tiempos LSQR
                            tiempo1LSQR = tic;
                            [resLSQR1, errorLSQR1] = LSQR(A1,B1,0.00000000001,10000);
                            tiempo1LSQR =  toc(tiempo1LSQR);
                            tiempos1 = [tiempos1,tiempo1LSQR];
                        case 7 %toma de tiempos LSQR
                            tiempo1LSQRd = tic;
                            [resLSQRd1, errorLSQRd1] = LSQRdisperso(A1,B1,0.00000000001,10000);
                            tiempo1LSQRd =  toc(tiempo1LSQRd);
                            tiempos1 = [tiempos1,tiempo1LSQRd];
                    end
                case 2 % matriz de 1089
                    x2 = zeros(1,1089);
                    switch opcionMetodo
                        case 1 % toma de tiempos Jacobi
                            timeGJ2 = tic;
                            [resGJ2, errorGJ2] = GaussJacobi(A2,B2',x2,100000);
                            timeGJ2 = toc(timeGJ2); % fin toma de tiempos jacobi
                            tiempos2 = [tiempos2,timeGJ2];

                        case 2 %toma de tiempos Seidel
                            timeGS2 = tic;
                            [resGS2, errorGS2] = GaussSeidel(A2,B2',x2,100000);
                            timeGS2 = toc(timeGS2); % fin de toma de tiempos Seidel
                            tiempos2 = [tiempos2,timeGS2];

                        case 3 %toma de tiempos Cholesky
                            tiempoC2 = tic;
                            [resC2, errorC2]= Cholesky(A2,B2);
                            tiempoC2 = toc(tiempoC2);
                            tiempos2 = [tiempos2,tiempoC2];

                        case 4   %toma de tiempos LU
                            tiempo2LU = tic;
                            [resLU2, errorLU2] = LU(A2,B2');
                            tiempo2LU = toc(tiempo2LU);
                            tiempos2 = [tiempos2,tiempo2LU];

                        case 5 % toma de tiempos QR
                            tiempo2QR = tic;
                            [resQR2, errorQR2]= QR(A2,B2);
                            tiempo2QR = toc(tiempo2QR);
                            tiempos2 = [tiempos2,tiempo2QR];

                        case 6 % toma de tiempo LSQR
                            tiempo2LSQR = tic;
                            [resLQSR2, errorLSQR2] = LSQR(A2,B2,0.00000000001,10000);
                            tiempo2LSQR = toc(tiempo2LSQR);
                            tiempos2 = [tiempos2,tiempo2LSQR];

                        case 7 % toma de tiempo LSQR disperso
                            tiempo2LSQRd = tic;
                            [resLQSRd2, errorLSQRd2] = LSQRdisperso(A2,B2,0.00000000001,10000);
                            tiempo2LSQRd = toc(tiempo2LSQRd);
                            tiempos2 = [tiempos2,tiempo2LSQRd];
                    end
                
                case 3  % matrz de 4225
                    x3 = zeros(1,4225);
                    switch opcionMetodo
                        case 1  % toma de tiempos Jacobi
                            timeGJ3 = tic;
                            [resGJ3, errorGJ3] = GaussJacobi(A3,B3',x3,100000);
                            timeGJ3 = toc(timeGJ3); % fin toma de tiempos jacobi
                            tiempos3 = [tiempos3,timeGJ3];
                        case 2  %toma de tiempos Seidel
                            timeGS3 = tic;
                            [resGS3, errorGS3]= GaussSeidel(A3,B3',x3,100000);
                            timeGS3 = toc(timeGS3); % fin de toma de tiempos Seidel
                            tiempos3 = [tiempos3,timeGS3];
                        case 3  %toma de tiempos Cholesky
                            tiempoC2 = tic;
                            [resC2, errorC2]= Cholesky(A2,B2);
                            tiempoC2 = toc(tiempoC2);
                            tiempos2 = [tiempos2,tiempoC2];
                        case 4  %toma de tiempos LU
                            tiempo2LU = tic;
                            [resLU2, errorLU2] = LU(A2,B2');
                            tiempo2LU = toc(tiempo2LU);
                            tiempos2 = [tiempos2,tiempo2LU];

                        case 5 % toma de tiempos QR
                            tiempo2QR = tic;
                            [resQR2, errorQR2]= QR(A2,B2);
                            tiempo2QR = toc(tiempo2QR);
                            tiempos2 = [tiempos2,tiempo2QR];

                        case 6  % toma de tiempo LSQR
                            tiempo2LSQR = tic;
                            [resLQSR2, errorLSQR2] = LSQR(A2,B2,0.00000000001,10000);
                            tiempo2LSQR = toc(tiempo2LSQR);
                            tiempos2 = [tiempos2,tiempo2LSQR];

                        case 7  %% toma de tiempo LSQR disperso
                            tiempo3LSQRd = tic;
                            [resLQSRd3, errorLSQRd3] = LSQRdisperso(A3,B3,0.00000000001,10000);
                            tiempo3LSQRd = toc(tiempo3LSQRd);
                            tiempos3 = [tiempos3,tiempo3LSQRd];



    end






x1 = zeros(1,289);
x2 = zeros(1,1089);
x3 = zeros(1,4225);

%{
%toma de tiempos Jacobi
timeGJ1 = tic;
[resGJ1, errorGJ1] = GaussJacobi(A1,B1',x1,100000);
timeGJ1 = toc(timeGJ1); % fin toma de tiempos jacobi
tiempos1 = [tiempos1,timeGJ1];


%toma de tiempos Seidel
timeGS1 = tic;
[resGS1, errorGS1] = GaussSeidel(A1,B1',x1,100000);
timeGS1 = toc(timeGS1); % fin de toma de tiempos Seidel
tiempos1 = [tiempos1,timeGS1];

%toma de tiempos Cholesky
tiempoC1 = tic;
[resC1, errorC1]= Cholesky(A1,B1);
tiempoC1 = toc(tiempoC1);
tiempos1 = [tiempos1,tiempoC1];

%toma de tiempos LU
tiempo1LU = tic;
[resLU1, errorLU1]= LU(A1,B1');
tiempo1LU = toc(tiempo1LU);
tiempos1 = [tiempos1,tiempo1LU];


% toma de tiempos QR
tiempo1QR = tic;
[resQR1, errorQR1]= QR(A1,B1);
tiempo1QR = toc(tiempo1QR);
tiempos1 = [tiempos1,tiempo1QR];


%toma de tiempos LSQR
tiempo1LSQR = tic;
[resLSQR1, errorLSQR1] = LSQR(A1,B1,0.00000000001,10000);
tiempo1LSQR =  toc(tiempo1LSQR);
tiempos1 = [tiempos1,tiempo1LSQR];

%toma de tiempos LSQR
tiempo1LSQRd = tic;
[resLSQRd1, errorLSQRd1] = LSQRdisperso(A1,B1,0.00000000001,10000);
tiempo1LSQRd =  toc(tiempo1LSQRd);
tiempos1 = [tiempos1,tiempo1LSQRd];

errores2 = [errorGJ1,errorGS1,errorLU1,errorC1,errorQR1,errorLSQR1,errorLSQRd1];


%----------------------------------%

% toma de tiempos Jacobi
timeGJ2 = tic;
[resGJ2, errorGJ2] = GaussJacobi(A2,B2',x2,100000);
timeGJ2 = toc(timeGJ2); % fin toma de tiempos jacobi
tiempos2 = [tiempos2,timeGJ2];

%toma de tiempos Seidel
timeGS2 = tic;
[resGS2, errorGS2] = GaussSeidel(A2,B2',x2,100000);
timeGS2 = toc(timeGS2); % fin de toma de tiempos Seidel
tiempos2 = [tiempos2,timeGS2];

%toma de tiempos Cholesky
tiempoC2 = tic;
[resC2, errorC2]= Cholesky(A2,B2);
tiempoC2 = toc(tiempoC2);
tiempos2 = [tiempos2,tiempoC2];

%toma de tiempos LU
tiempo2LU = tic;
[resLU2, errorLU2] = LU(A2,B2');
tiempo2LU = toc(tiempo2LU);
tiempos2 = [tiempos2,tiempo2LU];

% toma de tiempos QR
tiempo2QR = tic;
[resQR2, errorQR2]= QR(A2,B2);
tiempo2QR = toc(tiempo2QR);
tiempos2 = [tiempos2,tiempo2QR];

% toma de tiempo LSQR
tiempo2LSQR = tic;
[resLQSR2, errorLSQR2] = LSQR(A2,B2,0.00000000001,10000);
tiempo2LSQR = toc(tiempo2LSQR);
tiempos2 = [tiempos2,tiempo2LSQR];

% toma de tiempo LSQR disperso
tiempo2LSQRd = tic;
[resLQSRd2, errorLSQRd2] = LSQRdisperso(A2,B2,0.00000000001,10000);
tiempo2LSQRd = toc(tiempo2LSQRd);
tiempos2 = [tiempos2,tiempo2LSQRd];

%------------------------------------

% toma de tiempos Jacobi
timeGJ3 = tic;
[resGJ3, errorGJ3] = GaussJacobi(A3,B3',x3,100000);
timeGJ3 = toc(timeGJ3); % fin toma de tiempos jacobi
tiempos3 = [tiempos3,timeGJ3];

%toma de tiempos Seidel
timeGS3 = tic;
[resGS3, errorGS3]= GaussSeidel(A3,B3',x3,100000);
timeGS3 = toc(timeGS3); % fin de toma de tiempos Seidel
tiempos3 = [tiempos3,timeGS3];

%toma de tiempos Cholesky
tiempoC3 = tic;
[resC3, errorC3]= Cholesky(A3,B3);
tiempoC3 = toc(tiempoC3);
tiempos3 = [tiempos3,tiempoC3];

%toma de tiempos LU
tiempo3LU = tic;
[resLU3, errorLU3]= LU(A3,B3');
tiempo3LU = toc(tiempo3LU);
tiempos3 = [tiempos3,tiempo3LU];

% toma de tiempos QR
tiempo3QR = tic;
[resQR3, errorQR3]= QR(A3,B3);
tiempo3QR = toc(tiempo3QR);
tiempos3 = [tiempos3,tiempo3QR];

% toma de tiempo LSQR 
tiempo3LSQR = tic;
[resLQSR3, errorLSQR3] = LSQR(A3,B3,0.00000000001,10000);
tiempo3LSQR = toc(tiempo3LSQR);
tiempos3 = [tiempos3,tiempo3LSQR];

% toma de tiempo LSQR disperso
tiempo3LSQRd = tic;
[resLQSRd3, errorLSQRd3] = LSQRdisperso(A3,B3,0.00000000001,10000);
tiempo3LSQRd = toc(tiempo3LSQRd);
tiempos3 = [tiempos3,tiempo3LSQRd];
%}

fprintf("Ejecucion terminada\n");






