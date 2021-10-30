%% Función 1
f = @(x) exp(-x);
a = -1;
b = 1;

% Derivada de f
h = 1e-6;
df = @(x) (f(x + h) - f(x - h))/(2*h);

% Longitud de arco
dl = @(x)sqrt(1 + df(x).^2);
l = reglaTrapecio(dl, a, b);
disp("Longitud de arco: " + l)

% Gráfica de la función y su radio de curvatura
d2f = @(x) (f(x+h) - 2*f(x) + f(x-h))/(h*h);
r = @(x) (1+df(x).^2).^(3/2) ./ d2f(x);

x = linspace(a, b, 1000);
y = f(x);
rc = r(x);

subplot(2, 1, 1)
plot(x, y)
xlabel('x')
ylabel('y')
title('Gráfica de la función')

subplot(2, 1, 2)
plot(x, rc)
xlabel('x')
ylabel('R')
title('Radio de curvatura')

% Sólido de revolución

dv = @(x) pi * f(x).^2;
v = reglaTrapecio(dv, a, b);
disp("Volumen del sólido de revolución: " + v)

figure()
solidoRevX(f, a, b)


%%

