%% Ejercicio 1

% 1. ¿Cómo se podría definir un vector de tamaño 100, cuyo primer elemento 
%es 5, el último es 210, y todos los elementos están a la misma distancia?
v = 5:210;
disp(v)

% 2. ¿Las siguientes dos instrucciones devuelven el mismo vector?
a = 2:7;
b = 0:100;

% 3. Si se tienen los siguientes vectores: ¿Cómo se concatenan ambos 
%vectores, y qué resultado se obtendría?
c = 2:7;
d = linspace(5,20,6);

concatena = [c d];


%4. Si consideramos los vectores de la pregunta 3, ¿qué se obtiene en cada 
%una de las siguientes instrucciones? ¿Cuáles son posibles?

disp(c')
disp(d')
disp(c .* d)
disp([c' d'])
disp([c; d])
disp(c.^2)
disp([c' b']')

% 5. ¿Qué elementos tiene el vector c?
a = 1:2:20;
b = a([1 7 3]);
c = b(length(b):-1:1);

% 6. ¿Cómo se definiría un vector con 10000 elementos, todos iguales a 5?
vector = 5.*(ones(1,10000));

% 7. Dado el siguiente vector:
a = 1:2:20;
%¿Cómo se obtendría la siguiente salida utilizando los elementos de a?

b = a([5 4 5 7]);

%% 8. ¿Con qué instrucciones se obtendría un arreglo de tamaño 10, en el
% cual las posiciones son -3 y las posiciones pares son 3?

positive = 3;
negative = -3;
lista = [];

for i=1:1000
    if mod(i,2) == 0
        lista = [lista,positive];
    else
        lista = [lista,negative];
    end
end

disp(lista)

%% Ejercicio 2

% 1. ¿De qué forma se podría definir una matriz de 10 X 10, la cual tenga 
%ceros en todo sus elementos, excepto en la diagonal, la cual tenga cincos?

matriz = eye(5).*5

% 2. Dadas las siguientes matrices:
a = [1 2; 3 4];
b = [5 6; 7 8];

[a b];
[a;b]
[b' a]
[a';b'];
[b;a']

% 3. Dada la siguiente matriz:

a = [1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15; 16 17 18 19 20];

a(:, 5);
a(2, :)
a(3, [2 4 1])
a(4, 4:-1:2)
a(1:2:4, 5:-1:1)

% 4. 
%¿Cómo modificarían el elemento del segundo renglón y la tercer columna
%para que tenga un valor de 100?

a(2,3) = 100

% ¿Cómo modificarían todos los elementos del tercer renglón para que tengan
%todos el valor de 500?

a(3,:) = 500

% 5. Dadas las siguientes matrices:

a = [1 2; 3 4; 5, 6];
b = [2 4; 6 8; 10, 12];

%% Ejercicio 3

t = linspace(-5,10);
f = (t.^3 - 3.*t.^2 + 5)./(2.*t + 4);

plot(t, f)
xlabel('t')
ylabel('f(t)')
title('Ejercicio 3')

%% Ejercicio 4

x = linspace(0,5);
f = x.*exp(-x);
f1 = -1 .* (x - 1) .* exp(-x);
f2 = (x - 2) .* exp(-x);
f3 = -1 .* (x - 3) .* exp(-x);

subplot(2,2,1)
plot(x,f)
xlabel('x')
ylabel('f(x)')
title('x(e^-x)')


subplot(2,2,2)
plot(x,f1)
xlabel('x')
ylabel('f(x)')
title('(x-1)(-e^-x)')

subplot(2,2,3)
plot(x,f2)
xlabel('x')
ylabel('f(x)')
title('(x-2)(e^-x)')

subplot(2,2,4)
plot(x,f3)
xlabel('x')
ylabel('f(x)')
title('(x-3)(-e^-x)')

%% Ejercicio 5

x = linspace(0.5,4);
f = cos(2*pi.*x);
g = exp(-2.*x).*cos(5*pi.*x);
h = cos(6*pi.*x) .* sin(12*pi.*x);

hold on
plot(x,f, 'r*')
plot(x,g, 'b--')
plot(x,h, 'g-')
hold off

xlabel('0.5<=x<=4')
ylabel('f(x)')
title('Ejercicio 5')
legend('f(x)', 'g(x)', 'h(x)')

