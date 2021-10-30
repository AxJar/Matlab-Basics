function [int,n] = reglaTrapecio(f,a,b,m)
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
n = m + 1;

% calcula h
h = (b - a)/m;

% calcular x
x = a : h : b;

% calcular f(x)
fx = f(x);

% calcular w
w = zeros(1, n);
w(1) = 1;
w(2:n-1) = 2;
w(n) = 1;

%calcular wf(x)
wfx = w.*fx;

% calcula la integral
int = h/2 * sum(wfx);

end