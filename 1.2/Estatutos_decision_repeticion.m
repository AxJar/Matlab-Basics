%% Ejercicio 1

n1 = randi(5,1,1);
n2 = randi(5,1,1);

if n1 > n2
    if mod(n1,n2) == 0
        disp(num2str(n1)+ " es multiplo de " + num2str(n2))
        
    else
        disp(num2str(n1)+ " no es multiplo de " + num2str(n2))
    end
    
else
    if mod(n2,n1) == 0
        disp(num2str(n2)+ " es multiplo de " + num2str(n1))
        
    else
        disp(num2str(n2)+ " no es multiplo de " + num2str(n1))
    end
        
end

%% Ejercicio 2

numero = input("Ingresa un número entre 1-5: ");

if numero == 1
    x = linspace(0,5);
    y = sin(5.*x) + 2;
    plot(x,y)
    xlabel('x')
    ylabel('f(x)')
    title('sin(5x) + 2')
    
elseif numero == 2
    x = linspace(0,5);
    y = cos(5.*x) - 2;
    plot(x,y)
    xlabel('x')
    ylabel('f(x)')
    title('cos(3x) - 2')
    
elseif numero == 3
    x = linspace(0,2);
    y = 3.*exp(-5.*x) + 2;
    plot(x,y)
    xlabel('x')
    ylabel('f(x)')
    title('3.*exp(-5x) + 2 ')
    
elseif numero == 4
    x = linspace(0,1);
    y = sqrt(10.*x.^3);
    plot(x,y)
    xlabel('x')
    ylabel('f(x)')
    title('sqrt(10x^3) ')
    
elseif numero == 5
    x = linspace(-5,5);
    y = abs(4.*x)-2;
    plot(x,y)
    xlabel('x')
    ylabel('f(x)')
    title('|4x|-2')
else 
    disp('Opcion no valida');
end



%% Ejercicio 3

n1 = randi(20,1,1);

for k = 0:20
    mult = n1 * k;
    disp(num2str(n1) + " x " + num2str(k) + " = " + num2str(mult))
end

%% Ejercicio 4

for k = 00:23
    for l = 00:59
        for m = 00:59
            disp(num2str(k) + ":" + num2str(l) + ":" + num2str(m))
        end
    end
end


%% Ejercicio 5

suma = 0;
contador = 0;

while true
    numero = input("Ingrese un número: ");
    if numero > 0
        contador = contador + 1;
        suma = suma + numero;
    
    else
        break
    end
end

promedio = suma / contador;

disp("Promedio: " + num2str(promedio))


%% Ejercicio 6

p1 = input("Ingrese precio: ");
p2 = input("Ingrese precio: ");
p3 = input("Ingrese precio: ");
p4 = input("Ingrese precio: ");
p5 = input("Ingrese precio: ");
p6 = input("Ingrese precio: ");
p7 = input("Ingrese precio: ");
p8 = input("Ingrese precio: ");
p9 = input("Ingrese precio: ");
p10 = input("Ingrese precio: ");

array = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10];

maximo = max(array);
minimo = min(array);

disp("Precio Maximo: " + num2str(maximo))
disp("Precio Menor: " + num2str(minimo))


%% Ejercicio 7

t = 8:18;
A = [];

for k = t
    personas = input("Ingresa la cantidad de personas: ");
    A = [A,personas];
end

plot(t,A)
xlabel('Horas')
ylabel('Personas')
title('Ejercicio 7')

%% Ejercicio 8

x = 0.1:0.1:100;
y = 0.1;
lista = [];

for t = x
    y1 = y;
    y = y1 + 0.1 * cos(t) * exp(-y1);
    lista = [lista,y];
end

plot(x,lista)
xlabel('Tiempo')
ylabel('F(t)')
title('Ejercicio 8')

