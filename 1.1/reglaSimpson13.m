function [int,n] = reglaSimpson13(f,a,b,m)
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
n = 2*m + 1;

% calcula h
h = (b - a)/m;

% calcular x
x = a : h : b;

% calcular f(x)
fx = f(x);

% calcular w
w = zeros(1, n);
w(1) = 1;
w(2:2:end) = 2;
w(end) = 1;

%calcular wf(x)
wfx = w.*fx;

% calcula la integral
int = h/3 * sum(wfx);

end