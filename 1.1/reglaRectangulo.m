function [int,n] = reglaRectangulo(f,a,b,m)

% f = funcion a integrar
% a = inicio del intervalo donde se integra f
% b = final del intervalo donde se integra f
% m = cantidad de rectangulos a integrar
% int = integral calculada
% n = cantidad de puntos en los que se evaluo f

if nargin < 4
    m = 100;
    
end

if m < 1
    m = 1;
end

% calcula n
n = m;

% calcula h
h = (b - a)/m;

% calcular x
x = a + h/2: h : b - h/2;

% calcular f(x)
fx = f(x);

% calcula la integral
int = h * sum(fx);

end
