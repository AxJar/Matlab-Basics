%CAMPO ELÉCTRICO 3D

v = 0.5;
ancho = 0.2;
largo = 3;
movX = 1;

%VERTICES Y CARAS DE LÁMINA (+)
           % x               y        z
vertices = [-v*ancho-movX  -v*largo  -v; %v1
            -v*ancho-movX   v*largo  -v; %v2
             v*ancho-movX   v*largo  -v; %v3
             v*ancho-movX  -v*largo  -v; %v4
            -v*ancho-movX  -v*largo   v; %v5
            -v*ancho-movX   v*largo   v; %v6
             v*ancho-movX   v*largo   v; %v7
             v*ancho-movX  -v*largo   v]; %v8
         
caras = [1 5 8 4; %c1
         1 5 6 2; %c2
         2 3 7 6; %c3
         3 4 8 7; %c4
         5 6 7 8; %c5
         1 2 3 4]; %c6

     
%VERTICES Y CARAS DE LÁMINA (-)
           % x               y        z
vertices2 = [-v*ancho+movX  -v*largo  -v; %v1
            -v*ancho+movX   v*largo  -v; %v2
             v*ancho+movX   v*largo  -v; %v3
             v*ancho+movX  -v*largo  -v; %v4
            -v*ancho+movX  -v*largo   v; %v5
            -v*ancho+movX   v*largo   v; %v6
             v*ancho+movX   v*largo   v; %v7
             v*ancho+movX  -v*largo   v]; %v8

x1 = -1;
x2 = 1;
xn = 0.5;
y1 = -1.5;
y2 = 1.5;
yn = 0.2;
     
[xGrid, yGrid]= meshgrid(x1:xn:x2,y1:yn:y2);
zGrid = xGrid * 0;

%PROPIEDADES DEL CAMPO ELÉCTRICO
Q = 20; %Carga (+)
eps0 = 8.854e-12; %Constante dieléctrica
A = (ancho * largo) * 2; %Área de la lámina positiva
E = Q / (eps0 * A);

%PROPIEDADES PARA LOS VECTORES
Px = xGrid;
Py = yGrid;
Pz = zGrid;

Ex = Q .* Px ./ (eps0 * A);
Ey = Q .* Py ./ (eps0 * A);
Ez = Q .* Pz ./ (eps0 * A);

%COMPONENTES DE LOS VECTORES
i = (Ex ./ E) * 0 + 1;
i = i * E;
j = Ey ./ E;
k = Ez ./ E;

figure();
hold on

patch('Faces',caras,'Vertices',vertices,'FaceColor','r');
patch('Faces',caras,'Vertices',vertices2,'FaceColor','b');

h = quiver3(xGrid, yGrid, zGrid, i, j, k);

axis([-2 2 -2 2 -2 2]);
view(30,30); %Establecer la vista de el espacio 3D
grid();

hold off