%Simulacion de espira y campo magnetico 3D

clear; % borra variables
close all; % borra figuras
clc; % limpia pantalla

%Parametros de la rejilla (meshgrid)
x0 = -5;
x1 = 5;
xn = 0.5;
y0 = 0;
y1 = 0;
yn = 0.1;
z0 = -5;
z1 = 5;
zn = xn;

[xGrid, yGrid, zGrid]= meshgrid(x0:xn:x1, y0:yn:y1, z0:zn:z1); 
%Datos de Biot-Savat
uo = 4.*pi.*10.^-7; % Permeabilidad del espacio libre
I = 30; % Intensidad - corriente
r = 2; % Radio Circulo
xn1 = r;
xn2 = -r;

r1 = sqrt((xGrid-xn1).^2 + (zGrid-0).^2);
r2 = sqrt((xGrid-xn2).^2 + (zGrid-0).^2);

Bx = (-(uo.*I.*(zGrid-0)))./(2.*pi.*r1.^2); % Y porque es el inverso
Bz = (uo.*I.*(xGrid-xn1))./(2.*pi.*r1.^2);% X porque es el inverso

Bx2 = (-(uo.*-I.*(zGrid-0)))./(2.*pi.*r2.^2); % Y porque es el inverso
Bz2 = (uo.*-I.*(xGrid-xn2))./(2.*pi.*r2.^2); % X porque es el inverso

By = Bx * 0;

B = sqrt(Bx.^2 + Bz.^2);

Cx =((Bx+Bx2)./B);
Cz =((Bz+Bz2)./B);
Cy = By;

sumBx = Bx + Bx2;
sumBy = By;
sumBz = Bz + Bz2;
%Parametros de la espira (circulo)
xCirculo = (-r):0.1:r; % Valores en x del circulo
yCirculo = sqrt((r^2)-xCirculo.^2); % Valores en y del circulo %r^2 = r*r

figure();
hold on;
grid on;
rotate3d on;
view(30,30);
plot(xCirculo, yCirculo,'k', xCirculo, -yCirculo, 'k'); % Dibuja circulo
quiver3(xGrid, yGrid, zGrid, sumBx, sumBy, sumBz,'linewidth',2); % Dibuja flechas
hold off;

