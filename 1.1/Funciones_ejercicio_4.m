%% Ejercicio 4 de funciones

%% Gráfica 1
f1 = @(t) 2*exp(-0.25*t).*(sin(15*t)).^2;
grafica_funcion(f1, 0, 5, "2*exp(-0.25*t)*(sin(15*t))^2");

%% Gráfica 2
f2 = @(x) (2*x+1)./(x.^2+x);
grafica_funcion(f2, 1, 2, "(2*x+1)/(x^2+x)");

%% Gráfica 3
f3 = @(x) 4./sqrt(1-x.^2);
grafica_funcion(f3, 0, 0.5, "4/sqrt(1-x^2)");

%% Gráfica 4
f4 = @(x) log(x).^2./x;
grafica_funcion(f4, 1, exp(3), "log(x)^2/x");

%% Función auxiliar para graficar funciones
function grafica_funcion(f, lower_limit, upper_limit,tit)

    x = linspace(lower_limit, upper_limit, 1000);
    y = f(x);
    int = integral(f, lower_limit, upper_limit);

    plot(x, y)
    xlabel('x')
    ylabel('f(x)')
    
    title(tit + "Integral = " + int)
end

