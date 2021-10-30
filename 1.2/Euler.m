%% Ejercicio 1 (sin gráfica y sin guardar resultados)
h = 0.1;
x = 1;
y = 5;
disp("x = " + num2str(x) + "   y = " + num2str(y))

while x <=3
    y = y + h*(6 - 2*y/x);
    x = x + h;
    disp("x = " + num2str(x) + "   y = " + num2str(y))
end    
    
%% Ejercicio 1
ht = [0.1 0.05 0.01];   % Valores de h a probar
hold on
for h = ht
    
    % Inicializa vectores x y 
    x = 1:h:3;
    y = zeros(size(h));

    % Inicializa primer valor de y
    y(1) = 5;

    % Encuentra con Euler los valores de y
    for k = 1:length(x)-1
       y(k+1) = y(k) +h*(6 - 2*y(k)/x(k));    
    end
   
    % Grafica los valores obtenidos
    plot(x, y)    
end

% Resultado analítico
x = linspace(1, 3, 200);
y = (2*x.^3+3)./(x.^2);
plot(x, y)

% Termina de decorar la gráfica
hold off

title("Ejercicio 1")
xlabel("x")
ylabel("y")    
legend('h = 0.1', 'h = 0.05', 'h = 0.01', 'Resultado analítico')

%% Ejercicio 2
ht = [0.1 0.05 0.01, 0.001];   % Valores de h a probar
hold on

for h = ht
    
    % Inicializa vectores x y 
    x = 2:h:10;
    y = zeros(size(h));

    % Inicializa primer valor de y
    y(1) = exp(1);

    % Encuentra con Euler los valores de y
    for k = 1:length(x)-1
       y(k+1) = y(k) +h*(y(k)*log(y(k))/x(k));    
    end
   
    % Grafica los valores obtenidos
    plot(x, y)    
end

% Resultado analítico
x = linspace(2, 10, 200);
y = exp(0.5*x);
plot(x, y)

% Termina de decorar la gráfica
hold off

title("Ejercicio 2")
xlabel("x")
ylabel("y")    
legend('h = 0.1', 'h = 0.05', 'h = 0.01', 'h = 0.001', 'Resultado analítico')

%% Ejercicio 3
ht = [0.1 0.05 0.01];   % Valores de h a probar
hold on
for h = ht
    
    % Inicializa vectores x y 
    x = -1.5:h:1.5;
    y = zeros(size(h));

    % Inicializa primer valor de y
    y(1) = 0;

    % Encuentra con Euler los valores de y.
    for k = 1:length(x)-1
       y(k+1) = y(k) +h*( (50*x(k).^2-10*y(k))/3 );    
    end
    
    % Grafica los valores obtenidos
    plot(x, y)    
end

% Termina de decorar la gráfica
hold off

title("Ejercicio 3")
xlabel("x")
ylabel("y")    
legend('h = 0.1', 'h = 0.05', 'h = 0.01')

%% Ejercicio 4
g = 9.81;
h = 0.1;

% Inicializa vector de tiempo.
t = 0:h:30;

% Inicializa vectores de posición, velocidad y aceleración
s = zeros(size(t));
v = zeros(size(t));
a = zeros(size(t));

% Asigna valores iniciales
s(1) = 5000;
v(1) = 0;
a(1) = -g;

% Calcula con Euler los valores de s, v, y a
for k = 1:length(t)-1
    s(k+1) = s(k) + h*v(k);
    v(k+1) = v(k) + h*a(k);
    a(k+1) = -g;
end

% Grafica resultados
subplot(1,3,1)
plot(t, s)
xlabel('t')
ylabel('s(t)')
title('Posición')

subplot(1,3,2)
plot(t, v)
xlabel('t')
ylabel('v(t)')
title('Velocidad')

subplot(1,3,3)
plot(t, a)
xlabel('t')
ylabel('a(t)')
title('Aceleración')

%% Ejercicio 5
m = 70;
kp = 0.50;
g = 9.81;
h = 0.01;

% Inicializa vector de tiempo.
t = 0:h:100;

% Inicializa vectores de posición, velocidad y aceleración
s = zeros(size(t));
v = zeros(size(t));
a = zeros(size(t));

% Asigna valores iniciales
s(1) = 5000;
v(1) = 0;
a(1) = -g + (kp/m)*v(1)^2;

% Calcula con Euler los valores de s, v, y a
for k = 1:length(t)-1
    s(k+1) = s(k) + h*v(k);
    v(k+1) = v(k) + h*a(k);
    a(k+1) = -g + (kp/m)*v(k+1)^2;
end

% Grafica resultados
subplot(1,3,1)
plot(t, s)
xlabel('t')
ylabel('s')
title('Posición')

subplot(1,3,2)
plot(t, v)
xlabel('t')
ylabel('v')
title('Velocidad')

subplot(1,3,3)
plot(t, a)
xlabel('t')
ylabel('a')
title('Aceleración')

%% Ejercicio de Verlet
m = 70;
kp = 0.50;
g = 9.81;
h = 0.1;

% Inicializa vector de tiempo.
t = 0:h:30;

% Inicializa los vectores de posición, velocidad y aceleración
s = zeros(size(t));
v = zeros(size(t));
a = zeros(size(t));

% Asignar los valores iniciales
s(1) = 5000;
v(1) = 0;
a(1) = -g;

% Calcula con Euler los valroes de s, v, y a
for k = 2:length(t)
    
    % Nueva posición
    s(k) = s(k-1) + h*v(k-1) + 0.5*a(k-1)*h^2;
    
    % Velocidad intermedio    
    vm = v(k-1) + 0.5*a(k-1)*h;
    
    % Nueva aceleración
    a(k) = -g;
    
    % Nueva velocidad
    v(k) = vm + 0.5*a(k)*h;   
    
end

% Grafica resultados
subplot(1,3,1)
plot(t, s)
xlabel('t')
ylabel('s(t)')
title('Posición')

subplot(1,3,2)
plot(t, v)
xlabel('t')
ylabel('v(t)')
title('Velocidad')

subplot(1,3,3)
plot(t, a)
xlabel('t')
ylabel('a(t)')
title('Aceleración')

%% Ejercicio 2 de Verlet

g = 9.81;
h = 0.1;
kp = 0.5;
m = 70;


% Inicializa vector de tiempo.
t = 0:h:100;

% Inicializa los vectores de posición, velocidad y aceleración
s = zeros(size(t));
v = zeros(size(t));
a = zeros(size(t));

% Asignar los valores iniciales
s(1) = 5000;
v(1) = 0;
a(1) = -g +(kp/m)*v(1)^2;

% Calcula con Euler los valroes de s, v, y a
for k = 2:length(t)
    
    % Nueva posición
    s(k) = s(k-1) + h*v(k-1) + 0.5*a(k-1)*h^2;
    
    % Velocidad intermedia    
    vm = v(k-1) + 0.5*a(k-1)*h;
    
    % Nueva aceleración
    a(k) = -g + (kp/m)*vm^2;
    
    % Nueva velocidad
    v(k) = vm + 0.5*a(k)*h;
    
end

% Grafica resultados
subplot(1,3,1)
plot(t, s)
xlabel('t')
ylabel('s(t)')
title('Posición')

subplot(1,3,2)
plot(t, v)
xlabel('t')
ylabel('v(t)')
title('Velocidad')

subplot(1,3,3)
plot(t, a)
xlabel('t')
ylabel('a(t)')
title('Aceleración')
