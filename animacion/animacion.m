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

resultado = load('matlab.mat');
matriz = resultado.top_general_vals;

% division del dataset
maipu1 = maipuAjustado(1:77);
maipu2 = maipuAjustado(78:154);
maipu3 = maipuAjustado(155:230);

target = maipu1;
x1 = 1:1:size(target,2);

y1 = matriz(:,3:end); 


i=1
while i < 12600
    plot(x1,maipu1,'red');
    hold on
    y2 = y1(i,:);
    plot(x1,y2,'blue');
    nombre = int2str(i);
    saveas(gcf,nombre,'png');
    i = i + 100;
end

