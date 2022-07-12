function [minmax] = toMinMax(coeficientes)


mmin = min(coeficientes);
mmax = max(coeficientes);

minmax = [mmin;mmax];