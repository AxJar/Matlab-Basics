% Ejercicio Flujo Electrico en 2D

% Propiedades de la lamina (+)
PxLP = -3; % posicion en x
PyLP = -3; % posicion en y
ALp = 1; % ancho en centimetros
lLP = 6; % largo en centimetros

% Propiedades de la lamina (-)
PxLN = 2; % posicion en x
PyLN = -3; % posicion en y 
ALn = 1;% mismo ancho
lLN = 6; % largo 

xl = linspace(-2,2,10);  % Valores de x que vamos a evaluar
yl = linspace(-3,3,10);  % Valores de y que vamos a evaluar
[x, y] = meshgrid(xl, yl);   % Retícula de puntos

% Propiedades campo electrico
q = 20e-6; % Carga positiva 
eps0 = 8.854e-12; % Constante dielectrica
A = ALp * lLP; % Area de la lamina positiva
E = q / (eps0 * A);

% Propiedades para los vectores
Px = x;
Py = y;

Ex = q .* Px ./ (eps0 * A);
Ey = q .* Py ./ (eps0 * A);

% Componentes de los vectores
i = (Ex ./ E) * 0 + 1;
i = i * E;
j = Ey ./ E;


figure();
hold on 

% Grafica función vectorial
h = quiver(x, y, i, j);

LP = rectangle('Position',[PxLP,PyLP,ALp,lLP],'FaceColor','r','EdgeColor','r'); 
LN = rectangle('Position',[PxLN,PyLN,ALn,lLN],'FaceColor','b','EdgeColor','b'); 

     %  x    y
axis([-6 6 -6 6]); %ampliar la vista

hold off 
