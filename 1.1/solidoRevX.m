function solidoRevX(f, a, b)
% Función que muestra un sólido de revolución
% f - Función a girar en torno al eje x
% a - Límite inferior en el eje x
% b - Límite superior en el eje x

x = linspace(a, b, 50);
y = f(x); 

% función original
subplot(221);
plot(x,y);
xlabel('x'); 
ylabel('y'); 

% Primera vista del sólido de revolución
[Z,Y,X] = cylinder(y);
X = X*(b-a) + a;

subplot(222);
surf(X,Y,Z);
axis square
xlabel('x'); 
ylabel('y'); 
zlabel('z');

% Segunda vista del sólido
subplot(223);
surf(X,Y,Z);
axis square;
xlabel('x');
ylabel('y'); 
zlabel('z');
view(0,90);

% Tercera vista
subplot(224);
surf(X,Y,Z);
axis square;
xlabel('x');
ylabel('y'); 
zlabel('z');
view(90,0)

end

