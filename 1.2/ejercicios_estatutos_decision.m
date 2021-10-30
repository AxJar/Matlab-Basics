%% Ejercicio 1
dia = randi(8, 1, 1);

switch dia
    case 1
        disp('Lunes')
    case 2
        disp('Martes')
    case 3
        disp('Miércoles')
    case 4
        disp('Jueves')
    case 5
        disp('Viernes')
    case 6
        disp('Sábado')
    case 7
        disp('Domingo')
    otherwise
        disp('Número no válido')
end

%% Ejercicio 2
a = 5;
b = 10;
c = 15;

if a == b + c
    disp('a = b + c')
elseif b == a + c
    disp('b = a + c')
elseif c == a + b
    disp('c = a + b')
else 
    disp('Ningún número es la suma de los otros')
end

%% Ejercicio 3
a = randi(100, 1, 1);
b = randi(100, 1, 1);
c = randi(100, 1, 1);

if a <= b && a <= c
    if b <= c
        disp(num2str(a) + " - " + num2str(b)+ " - " + num2str(c))
    else
        disp(num2str(a) + " - " + num2str(c)+ " - " + num2str(b))
    end
elseif b <= a && b <= c
    if a <= c
        disp(num2str(b) + " - " + num2str(a)+ " - " + num2str(c))
    else
        disp(num2str(b) + " - " + num2str(c)+ " - " + num2str(a))
    end
else
    if a <= b
        disp(num2str(c) + " - " + num2str(a)+ " - " + num2str(b))
    else
        disp(num2str(c) + " - " + num2str(b)+ " - " + num2str(a))
    end
end

%% Ejercicio 4
act = 1;
tiempo = 85;

if act == 1
    disp(num2str(1.08 * tiempo) + " calorías")
elseif act == 2
    disp(num2str(1.66 * tiempo) + " calorías")
else
    disp('Actividad desconocida')
end

%% Ejercicio 5
a = randi(10, 1, 1);
b = randi(10, 1, 1);

disp("a = " + num2str(a) + " b = " + num2str(b))

if a == b
    disp("a x b = " + num2str(a*b))
elseif a > b
    disp("a - b = " + num2str(a-b))
else
    disp("a + b = " + num2str(a+b))
end

%% Ejercicio 6
salario = 10000;
tiempo = 200;

if tiempo < 1
    disp("Utilidad: $" + num2str(0.05*salario))
elseif tiempo < 2
    disp("Utilidad: $" + num2str(0.07*salario))
elseif tiempo < 3
    disp("Utilidad: $" + num2str(0.10*salario))
elseif tiempo < 5
    disp("Utilidad: $" + num2str(0.125*salario))
elseif tiempo < 10
    disp("Utilidad: $" + num2str(0.15*salario))
else
    disp("Utilidad: $" + num2str(0.20*salario))
end

%% Ejercicio 7
edad = 60;
tiempo = 20;

if edad >= 60 && tiempo < 25
    disp('Jubilación por edad')
elseif edad >= 60 && tiempo >= 25
    disp('Jubilación por antigüedad adulta')
elseif edad < 60 && tiempo >= 25
    disp('Jubilación por antigüedad joven')
else
    disp('A seguir trabajando, no hay jubilación aún.')
end

%% Ejercicio 8
computadoras = randi(30,1,1);
precio = 11000;
total = precio*computadoras;

if computadoras < 5
    descuento = 0.1*total;
elseif computadoras < 10
    descuento = 0.2*total;
else
    descuento = 0.4*total;
end

clc
disp("Computadoras: " + num2str(computadoras))
disp("Total $" + num2str(total))
disp("Descuento $" + num2str(descuento))
disp("A pagar $" + num2str(total - descuento))
