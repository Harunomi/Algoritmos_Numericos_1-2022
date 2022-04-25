syms x y z

tol = 0.0000000001;
ecuacion1 = x^2 + y - 37;
ecuacion2 = x - y^2 - 5;
ecuacion3 = x + y + z - 3;
F = [ecuacion1;ecuacion2;ecuacion3];

valoresExactos= [6.0; 1.0; -4.0];

[multiIteraciones,multiErrores,multiRaices,erroresNormales,erroresAbsolutos,erroresRelativos] = newtonMultivariable(F,tol,valoresExactos);
lRaiz = size(multiRaices,1);
fprintf("El resultado del sistema de ecuacion es: ");
multiRaices(lRaiz,:)
