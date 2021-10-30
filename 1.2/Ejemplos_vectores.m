%% Ejemplo 1
t = linspace(0,4*pi, 160);
f  = sin(t);
plot(t,f)
xlabel('t')
ylabel('f(t)')
title('Mi Primera Grafica')

%% Ejemplo 2
t = linspace(0,5,100);
f = exp(-0.5*t).*cos(15*t);
g = -2*t + 2;
h = (t.^2-t+3)./(t-8);

plot(t,f,t,g,t,h)
title('Graficas de Multiples Funciones')

%% Ejemplo 3
t = linspace(0, 5, 100);
f = exp(-0.5*t) .* cos(15*t);
g = -2*t + 2;
h = (t.^2-t+3)./(t-8);

hold on
plot(t, f)
plot(t, g)
plot(t, h)
hold off

xlabel('0<=t<=5')
ylabel('f(t)')
title('Gráficas de múltiples funciones')
legend('f(t)', 'g(t)', 'h(t)')

%% Ejemplo 4
x = linspace(-5, 5, 100);
f1 = 2*x.^4 + 15*x.^2;
f2 = 8*x.^3 + 30*x;
f3 = 24*x.^2 + 30;
f4 = 48*x;

subplot(2, 2, 1)
plot(x, f1)
xlabel('x')
ylabel('f(x)')
title('2*x.^4 + 15*x.^2')

subplot(2, 2, 2)
plot(x, f2)
xlabel('x')
ylabel('f(x)')
title('8*x.^3 + 30*x')

subplot(2, 2, 3)
plot(x, f3)
xlabel('x')
ylabel('f(x)')
title('24*x.^2 + 30')

subplot(2, 2, 4)
plot(x, f4)
xlabel('x')
ylabel('f(x)')
title('48*x')

%% Ejemplo 5
x = linspace(-5, 5, 100);
f1 = 2*x.^4 + 15*x.^2;
f2 = 8*x.^3 + 30*x;
f3 = 24*x.^2 + 30;
f4 = 48*x;

hold on
plot(x, f1, 'r-', 'linewidth', 15)
plot(x, f2, 'b*')
plot(x, f3, 'gO')
plot(x, f4, 'y-.')

hold off
