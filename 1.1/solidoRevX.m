function solidoRevX(f, a, b)
% Funci�n que muestra un s�lido de revoluci�n
% f - Funci�n a girar en torno al eje x
% a - L�mite inferior en el eje x
% b - L�mite superior en el eje x

x = linspace(a, b, 50);
y = f(x); 

% funci�n original
subplot(221);
plot(x,y);
xlabel('x'); 
ylabel('y'); 

% Primera vista del s�lido de revoluci�n
[Z,Y,X] = cylinder(y);
X = X*(b-a) + a;

subplot(222);
surf(X,Y,Z);
axis square
xlabel('x'); 
ylabel('y'); 
zlabel('z');

% Segunda vista del s�lido
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

