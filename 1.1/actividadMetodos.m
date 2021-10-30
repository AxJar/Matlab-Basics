f = @ (x) x./(x.^2-1);
a = 2;
b = 3;

%% Grafica de la funcion

x = linspace(a, b, 1000);
plot(x,f(x));
xlabel("x");
ylabel("y");
title("f(x)");

%% Integral de la funcion

disp("Rectangulo: " + reglaRectangulo(f, a, b, 1000))
disp("Trapecio: " + reglaTrapecio(f, a, b, 1000))
disp("Simpson 1/3: " + reglaSimpson13(f, a, b, 1000))
disp("Simpson 3/8: " + reglaSimpson38(f, a, b, 1000))

%% Comparacion de metodos
hold on

% Rectangulo
m = 1:15;
int = zeros(1, length(m));
n = zeros(1, lenght(m));

for k = 1:lenght(m)
    [int(k), n(k)] = reglaRectangulo(f, a , b, m(k));
end

plot(n,int)

% Decoracion de la grafica
xlabel("Numero de puntos evaluados")
ylabel"Valor de la integral")

 %% Trapecio
 
m = 1:14;
int = zeros(1, length(m));
n = zeros(1, lenght(m));

for k = 1:lenght(m)
    [int(k), n(k)] = reglaTrapecio(f, a , b, m(k));
end

plot(n,int)

% Decoracion de la grafica
xlabel("Numero de puntos evaluados")
ylabel(

%% Simpson 1/3

m = 1:7;
int = zeros(1, length(m));
n = zeros(1, lenght(m));

for k = 1:lenght(m)
    [int(k), n(k)] = reglaSimpson13(f, a , b, m(k));
end

plot(n,int)

% Decoracion de la grafica
xlabel("Numero de puntos evaluados")
ylabel(

%% Simpson 3/8

m = 1:15;
int = zeros(1, length(m));
n = zeros(1, lenght(m));

for k = 1:lenght(m)
    [int(k), n(k)] = reglaSimpson38(f, a , b, m(k));
end

plot(n,int)

% Decoracion de la grafica
xlabel("Numero de puntos evaluados")
ylabel(