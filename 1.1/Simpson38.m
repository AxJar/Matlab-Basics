function [int, n] = Simpson38(f, a, b, m)

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
w(2:3:end) = 3; 
w(3:3:end) = 3; 
w(4:3:end) = 2; 
w(end) = 1;

% Calcular wf(x)
wfx = w.*fx;

% Calcular integral
int = (3*h/8)*sum(wfx);

end
