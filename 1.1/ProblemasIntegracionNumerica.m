%% MAIN
%
%
%
%
f = @(x) (x.^2-x)./(cos(x));
a = -1;
b = 1;

%% Gráfica de la función

x = linspace(a, b, 1000);
plot(x, f(x))
xlabel('x')
ylabel('y')
title('f(x)')

%% Integral de la función

disp("Rectángulo: " + reglaRectangulo(f, a, b, 1000))
disp("Trapecio: " + reglaTrapecio(f, a, b, 1000))
disp("Simpson 1/3: " + reglaSimpson13(f, a, b, 1000))
disp("Simpson 3/8: " + reglaSimpson38(f, a, b, 1000))


%% Comparación de métodos
hold on

% Rectángulo
m = 1:15;
int = zeros(1, length(m));
n = zeros(1, length(m));

for k = 1:length(m)
    [int(k), n(k)] = reglaRectangulo(f, a, b, m(k));
end

plot(n, int)

% Trapecio

m = 1:14;
int = zeros(1, length(m));
n = zeros(1, length(m));

for k = 1:length(m)
    [int(k), n(k)] = reglaTrapecio(f, a, b, m(k));
end

plot(n, int)

% Simpson 1/3

m = 1:7;
int = zeros(1, length(m));
n = zeros(1, length(m));

for k = 1:length(m)
    [int(k), n(k)] = reglaSimpson13(f, a, b, m(k));
end

plot(n, int)

% Simpson 3/8

m = 1:4;
int = zeros(1, length(m));
n = zeros(1, length(m));

for k = 1:length(m)
    [int(k), n(k)] = reglaSimpson38(f, a, b, m(k));
end

plot(n, int)

% Decoración de la gráfica
hold off
xlabel('Número de puntos evaluados')
ylabel('Valor de la integral')
title('Comparación de las reglas de integración')

legend('Rectangulo', 'Trapecio', 'Simpson 1/3', 'Simpson 3/8')



%% RECTANGULO
function [int, n] = reglaRectangulo(f, a, b, m)

% f = Función a integrar
% a = Inicio del intervalo donde se integra f
% b = Final del intervalo donde se integra f
% m = Cantidad de rectángulos para integrar
% int = Integral calculada
% n = Cantidad de puntos en las que se evaluó f

if nargin < 4
    m = 100;
end

if m < 1
    m = 1;
end
  
% Calcula n
n = m;

% Calcula h
h = (b - a)/m;

% Calcular x
x = a + h/2 : h : b - h/2;

% Calcular f(x)
fx = f(x);

% Calcula la integral
int = h * sum(fx);

end

%% TRAPECIO
function [int, n] = reglaTrapecio(f, a, b, m)

% f = Función a integrar
% a = Inicio del intervalo donde se integra f
% b = Final del intervalo donde se integra f
% m = Cantidad de trapecio para integrar
% int = Integral calculada
% n = Cantidad de puntos en las que se evaluó f

if nargin < 4
    m = 100;
end

if m < 1
    m = 1;
end

% Calcula n
n = m + 1;

% Calcula h
h = (b - a)/m;

% Calcular x
x = a : h : b;

% Calcular f(x)
fx = f(x);

% Calcular w
w = zeros(1, n);
w(1) = 1;
w(2:n-1) = 2;
w(n) = 1;

% Calcular wf(x)
wfx = w.*fx;

% Calcular integral
int = (h/2)*sum(wfx);

end

%% SIMPSON 13
function [int, n] = reglaSimpson13(f, a, b, m)

% f = Función a integrar
% a = Inicio del intervalo donde se integra f
% b = Final del intervalo donde se integra f
% m = Cantidad de reglas de Simpson para integrar
% int = Integral calculada
% n = Cantidad de puntos en las que se evaluó f

if nargin < 4
    m = 100;
end

if m < 1
    m = 1;
end

% Calcula n
n = 2*m + 1;

% Calcula h
h = (b - a)/(2*m);

% Calcular x
x = a : h : b;

% Calcular f(x)
fx = f(x);

% Calcular w
w = zeros(1, n);
%%%%%%%%%%%%%%%%%%% Por implementar %%%%%%%%%%%%%%%%%%%%%%%%%%%%
w(1) = 1;
w(2:2:end) = 4;
w(3:2:end) = 2;
w(end) = 1;

% Calcular wf(x)
wfx = w.*fx;

% Calcular integral
int = (h/3)*sum(wfx);

end

%% SIMPSON38
function [int, n] = reglaSimpson38(f, a, b, m)

% f = Función a integrar
% a = Inicio del intervalo donde se integra f
% b = Final del intervalo donde se integra f
% m = Cantidad de reglas de Simpson para integrar
% int = Integral calculada
% n = Cantidad de puntos en las que se evaluó f

if nargin < 4
    m = 100;
end

if m < 1
    m = 1;
end

% Calcula n
n = 3*m + 1;

% Calcula h
h = (b - a)/(3*m);

% Calcular x
x = a : h : b;

% Calcular f(x)
fx = f(x);

% Calcular w
w = zeros(1, n);
%%%%%%%%%%%%%%%%%%% Por implementar %%%%%%%%%%%%%%%%%%%%%%%%%%%%
w(1) = 1;
w(2:2:end) = 3;
w(3:2:end) = 3;
w(4:2:end) = 2;
w(end) = 1;

% Calcular wf(x)
wfx = w.*fx;

% Calcular integral
int = (3*h/8)*sum(wfx);

end


