%Simulacion de espira y campo magnetico 2D

clear; % borra variables
close all; % borra figuras
clc; % limpia pantalla

% Parametros de la rejilla
x0 = -5;
x1 = 5;
xn = 0.5;
y0 = x0;
y1 = x1;
yn = xn;

[xGrid, yGrid]= meshgrid(x0:xn:x1, y0:yn:y1); 

% Datos de B
uo = 4.*pi.*10.^-7; % Permeabilidad del espacio libre
I = 30; % Intensidad - corriente
r = 2; % Radio Circulo
r1 = sqrt((xGrid-r).^2 + (yGrid-0).^2);
r2 = sqrt((xGrid-(-r)).^2 + (yGrid-0).^2);

Bx = (uo.*I.*(yGrid-0))./(2.*r1.^2); % Y porque es el inverso
By = -(uo.*I.*(xGrid-2))./(2.*r1.^2); % X porque es el inverso
Bx2 = -(uo.*I.*(yGrid-0))./(2.*r2.^2); % Y porque es el inverso
By2 = (uo.*I.*(xGrid+2))./(2.*r2.^2); % X porque es el inverso
sumBx = Bx + Bx2;
sumBy = By + By2;
B = sqrt(Bx.^2+By.^2);
Cx = ((Bx+Bx2)./B); % Componente en x
Cy = ((By+By2)./B); % Componente en y

%Parametros de la espisa ( circulo )
xCirculo = (-r):0.1:r; % Valores en x del circulo
yCirculo = sqrt((r*r)-xCirculo.^2); % Valores en y del circulo %r^2 = r*r

figure();
hold on;
plot(xCirculo, yCirculo,'k', xCirculo, -yCirculo, 'k'); % Dibuja circulo
quiver(xGrid, yGrid, sumBx, sumBy); % Dibuja flechas
hold off;