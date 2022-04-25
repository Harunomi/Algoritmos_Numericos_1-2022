fprintf("Iniciando la carga de datos\n");

% Carga de archivos
A1 = load("sistemas\289x289\A289.dat");
B1 = load("sistemas\289x289\b289.dat");

A2 = load("sistemas\1089x1089\A1089.dat");
B2 = load("sistemas\1089x1089\b1089.dat");

A3 = load("sistemas\4225x4225\A4225.dat");
B3 = load("sistemas\4225x4225\b4225.dat");


fprintf("Carga de datos terminada\n");


%{
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
            fprintf("3: LU \n");
            fprintf("4: Cholesky\n");
            fprintf("5: QR\n");
            fprintf("6: LSQR\n");
            fprintf("7: LSQR-Disperso\n");
            input(opcionMetodo);
            switch opcionMatriz
                case 1
                    switch opcionMetodo
                        case 1
                            x1 = zeros(1,289)
                            raizGJ = 

    end
%}

tiempos1 = [];
tiempos2 = [];
tiempos3 = [];
x1 = zeros(1,289);
x2 = zeros(1,1089);
x3 = zeros(1,4225);


% toma de tiempos Jacobi
timeGJ1 = tic;
resGJ1 = GaussJacobi(A1,B1',x1,100000);
timeGJ1 = toc(timeGJ1); % fin toma de tiempos jacobi
tiempos1 = [tiempos1,timeGJ1];

%toma de tiempos Seidel
timeGS1 = tic;
resGS1 = GaussSeidel(A1,B1',x1,100000);
timeGS1 = toc(timeGS1); % fin de toma de tiempos Seidel
tiempos1 = [tiempos1,timeGS1];

%toma de tiempos Cholesky
tiempoC1 = tic;
resC1 = Cholesky(A1,B1);
tiempoC1 = toc(tiempoC1);
tiempos1 = [tiempos1,tiempoC1];

%toma de tiempos LU
tiempo1LU = tic;
resLU1 = LU(A1,B1');
tiempo1LU = toc(tiempo1LU);
tiempos1 = [tiempos1,tiempo1LU];

% toma de tiempos QR
tiempo1QR = tic;
resQR1 = QR(A1,B1);
tiempo1QR = toc(tiempo1QR);
tiempos1 = [tiempos1,tiempo1QR];

%----------------------------------%

% toma de tiempos Jacobi
timeGJ2 = tic;
resGJ2 = GaussJacobi(A2,B2',x2,100000);
timeGJ2 = toc(timeGJ2); % fin toma de tiempos jacobi
tiempos2 = [tiempos2,timeGJ2];

%toma de tiempos Seidel
timeGS2 = tic;
resGS2 = GaussSeidel(A2,B2',x2,100000);
timeGS2 = toc(timeGS2); % fin de toma de tiempos Seidel
tiempos2 = [tiempos2,timeGS2];

%toma de tiempos Cholesky
tiempoC2 = tic;
resC2 = Cholesky(A2,B2);
tiempoC2 = toc(tiempoC2);
tiempos2 = [tiempos2,tiempoC2];

%toma de tiempos LU
tiempo2LU = tic;
resLU2 = LU(A2,B2');
tiempo2LU = toc(tiempo2LU);
tiempos2 = [tiempos2,tiempo2LU];

% toma de tiempos QR
tiempo2QR = tic;
resQR2 = QR(A2,B2);
tiempo2QR = toc(tiempo2QR);
tiempos2 = [tiempos2,tiempo2QR];

%------------------------------------

% toma de tiempos Jacobi
timeGJ3 = tic;
resGJ3 = GaussJacobi(A3,B3',x3,100000);
timeGJ3 = toc(timeGJ3); % fin toma de tiempos jacobi
tiempos3 = [tiempos3,timeGJ3];

%toma de tiempos Seidel
timeGS3 = tic;
resGS3 = GaussSeidel(A3,B3',x3,100000);
timeGS3 = toc(timeGS3); % fin de toma de tiempos Seidel
tiempos3 = [tiempos3,timeGS3];

%toma de tiempos Cholesky
tiempoC3 = tic;
resC3 = Cholesky(A3,B3);
tiempoC3 = toc(tiempoC3);
tiempos3 = [tiempos3,tiempoC3];

%toma de tiempos LU
tiempo3LU = tic;
resLU3 = LU(A3,B3');
tiempo3LU = toc(tiempo3LU);
tiempos3 = [tiempos3,tiempo3LU];

% toma de tiempos QR
tiempo3QR = tic;
resQR3 = QR(A3,B3);
tiempo3QR = toc(tiempo3QR);
tiempos3 = [tiempos3,tiempo3QR];

fprintf("Ejecucion terminada\n");






