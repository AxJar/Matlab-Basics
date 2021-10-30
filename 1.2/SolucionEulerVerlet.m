%% Ejercicio 1.1

ht = [0.1,0.05,0.01];

hold on
for h=ht
    % Inicialicen vectores x y y
    x = 0:h:1;
    y = zeros(size(x));

    % Inicializa primer valor de y
    y(1) = 1;

    % Encontrar con Euler los valores de y
    for k = 2:length(x)
        y(k) = y(k-1) + h.*( exp(-0.2.*x(k-1)).*cos(15.*y(k-1)) );
    end

    plot(x, y)
    
end

hold off

%% Ejercicio 1.2

ht = [0.1,0.01,0.001];

hold on
for h=ht
    % Inicialicen vectores x y y
    x = 1:h:5;
    y = zeros(size(x));

    % Inicializa primer valor de y
    y(1) = 0;

    % Encontrar con Euler los valores de y
    for k = 2:length(x)
        y(k) = y(k-1) + h.*( sqrt(x(k-1)^2 + y(k-1)^2) );
    end

    plot(x, y)
    
end

hold off

%% Ejercicio 1.3 REVISAR

ht = [0.1,0.01,0.001];

hold on
for h=ht
    % Inicialicen vectores x y y
    x = -5:h:5;
    y = zeros(size(x));

    % Inicializa primer valor de y
    y(1) = 10;

    % Encontrar con Euler los valores de y
    for k = 2:length(x)
        y(k) = y(k-1) + h.*( x(k-1).*sin((x(k-1))^2).*(cos(y(k-1))) );
    end

    plot(x, y)
    
end

hold off

%% Ejercicio 2.1

ht = [0.5,0.4,0.3,0.2,0.1,0.01,0.001]; % Desde los 0.001 casi no se nota cambio

hold on
for h=ht
    % Inicialicen vectores x y y
    x = 0:h:2;
    y = zeros(size(x));

    % Inicializa primer valor de y
    y(1) = 1;

    % Encontrar con Euler los valores de y
    for k = 2:length(x)
        y(k) = y(k-1) + h.*( exp(-(x(k-1)).*y(k-1)) );
    end

    plot(x, y)
    
end

hold off


%% Ejercicio 2.2

ht = 0.5; % No necesita cambios en el paso, con todos sale igual

hold on
for h=ht
    % Inicialicen vectores x y y
    x = 1:h:2;
    y = zeros(size(x));

    % Inicializa primer valor de y
    y(1) = 1;

    % Encontrar con Euler los valores de y
    for k = 2:length(x)
        y(k) = y(k-1) + h.*( x(k-1)./y(k-1) );
    end

    plot(x, y)
    
end

hold off

%% Ejercicio 2.3 REVISAR

ht = 0.5; 

hold on
for h=ht
    % Inicialicen vectores x y y
    x = -10:h:10;
    y = zeros(size(x));

    % Inicializa primer valor de y
    y(1) = 5;

    % Encontrar con Euler los valores de y
    for k = 2:length(x)
        y(k) = y(k-1) + h.*( sin((x(k-1))^2)*cos(y(k-1)) );
    end

    plot(x, y)
    
end

hold off


%% Ejercicio 2.1

g = 9.81;
h = 0.1;
kp = 0.25;
m = 0.150;
% Inicializa vector de tiempo.
t = 0:h:6;

% Inicializa los vectores de posición, velocidad y aceleración
sv = zeros(size(t));
vv = zeros(size(t));
av = zeros(size(t));
se = zeros(size(t));
ve= zeros(size(t));
ae = zeros(size(t));

% Asignar los valores iniciales
sv(1) = 5;
vv(1) = 25;
av(1) = -g -(kp/m)*vv(1);
se(1) = 5;
ve(1) = 25;
ae(1) = -g -(kp/m)*ve(1);

% Calcula con Verlet los valroes de s, v, y a
for k = 2:length(t)
    
    % Nueva posición
    sv(k) = sv(k-1) + h*vv(k-1) + 0.5*av(k-1)*h^2;
    
    % Velocidad intermedio    
    vm = vv(k-1) + 0.5*av(k-1)*h;
    
    % Nueva aceleración
    av(k) = -(g)-((kp/m)*vm);
    
    % Nueva velocidad
    vv(k) = vm + (0.5*av(k)*h);  
    
end

%Calcular con Euler los valores de s, v, y a
for j = 2:length(t)
    se(j) = se(j-1) + h*ve(j-1);
    ve(j) = ve(j-1) + h*ae(j-1);
    ae(j) = -g -((kp/m)*ve(j-1));
end

% Grafica resultados
subplot(2,3,1)
plot(t, sv)
xlabel('t')
ylabel('s(t)')
title('Posición-Verlet')

subplot(2,3,4)
plot(t, se)
xlabel('t')
ylabel('s(t)')
title('Posición-Euler')

subplot(2,3,2)
plot(t, vv)
xlabel('t')
ylabel('v(t)')
title('Velocidad-Verlet')

subplot(2,3,5)
plot(t, ve)
xlabel('t')
ylabel('v(t)')
title('Velocidad-Euler')

subplot(2,3,3)
plot(t, av)
xlabel('t')
ylabel('a(t)')
title('Aceleración-Verlet')

subplot(2,3,6)
plot(t, ae)
xlabel('t')
ylabel('a(t)')
title('Aceleración-Euler')


%% Ejercicio 5

clc
g = 9.81;
step = 0.01;
kp = 0.25;
m = 0.45;

% Inicializa los vectores de posición, velocidad y aceleración
h = [];
s = [];
v = [];
vx = [];
vy = [];
ax = [];
ay = [];

% Asignar los valores iniciales
h(1) = 0.8;
s(1) = 0;
v(1) = 300;
ay(1) = -g;
ax(1) = 0;
ang = 30;
angRad = deg2rad(ang);
vy(1) = sin(angRad)*v(1);
vx(1) = cos(angRad)*v(1);

k = 2;

hold on
while h > 0
    % Eje y
        % Nueva posición
        h(k) = h(k-1) + step.*vy(k-1) + 0.5.*ay(k-1).*step.^2;

        % Velocidad intermedio    
        vmy = vy(k-1) + 0.5.*ay(k-1).*step;

        % Nueva aceleración
        ay(k) = -g - (kp./m).*vmy;

        % Nueva velocidad
        vy(k) = vmy + 0.5.*ay(k).*step;   
    
    % Eje x
        % Nueva posición
        s(k) = s(k-1) + step.*vx(k-1) + 0.5.*ax(k-1).*step.^2;

        % Velocidad intermedio    
        vmx = vx(k-1) + 0.5.*ax(k-1).*step;

        % Nueva aceleración
        ax(k) =-(kp./m).*vmx;

        % Nueva velocidad
        vx(k) = vmx + 0.5.*ax(k).*step;  
        
       
    % Velocidad
        v(k) = sqrt(vx(k).^2+vy(k)^2);
     
    k = k + 1;
end

plot(s, h, 'co')
xlabel('s')
ylabel('h(s)')
title('Cañón')

hold off
