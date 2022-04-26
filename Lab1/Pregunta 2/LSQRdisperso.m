function [X, error, tiempo] = LSQRdisperso(A, b, tol, iterMax)
A = sparse(A);
b = sparse(b);
tiempo = 0;
tic;
beta = norm(b);
u = b/beta;
alfa = norm(A'*u);
v = (A'*u)/alfa;
w = v;
n = length(A);
X = zeros(n,1);
phi_barra = beta;
rho_barra = alfa;
for k = 1:iterMax
    beta = norm(A*v - alfa*u);
    u = (A*v - alfa*u) / beta;
    alfa = norm(A' * u - beta*v);
    v = (A' * u - beta*v) / alfa;
    rho = sqrt(rho_barra^2 + beta^2);
    c = rho_barra / rho;
    s = beta / rho;
    theta = s*alfa;
    rho_barra = -c*alfa;
    phi = c*phi_barra;
    phi_barra = s*phi_barra;
    X = X + (phi/rho)*w;
    w = v - (theta/rho)*w;
    error = norm(A*X-b);
    if error < tol
        tiempo = tiempo + toc;
        return
    end
end
tiempo = tiempo + toc;