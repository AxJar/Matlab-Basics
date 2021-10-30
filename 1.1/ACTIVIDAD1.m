%%
%Ejercicio 1
clc 
clear

valor = randi(10); 

disp("cubo de " + valor +" = " + cubo(valor)) 
disp("¿"+ valor + " Es divisible entre 3? " + divisible_por_tres(valor))

%%
%Ejercicio 2
clc 
clear

vec = randi(100,10,1); 

[me,mi,ma] = func2(vec);

disp([me,mi,ma])




%% 
%Ejercicio 3
clc 
clear 

f1 = @(x) x.^3; 
f2 =@(x) 3.*x.^3 - x.^2 + x - 1; 
f3 = @(x) x./(x.^2 - 1);  
f4 = @(t) (sin(t)).^3.*(cos(t)).^4; 
f5 = @(t) t.^2.*log(t);

subplot(2,3,1) 
graf(f1,0,1,"f1: x.^3")

subplot(2,3,2) 
graf(f2,2,3," f2: 3.*x.^3 - x.^2 + x - 1")

subplot(2,3,3) 
graf(f3,2,3,"f3: x./(x.^2 - 1)")


subplot(2,3,4) 
graf(f4,0,pi/2,"f4: sin(t)).^3 .* (cos(t).^4")


subplot(2,3,5) 
graf(f5,1,5,"f5: t.^2.*log(t)")

%%
%Ejercicio 4
clc 
clear

disp(estima_pi(10000000))


%%
%Ejercicio 4
function out =  estima_pi(n) 
    pointsx = rand(1,n).*2 - 1; 
    pointsy = rand(1,n).*2 - 1;
    pointsin = ((pointsx.^2) + (pointsy.^2)).^(1/2)<1;
    pointsin(pointsin==0) = []; 
    out = 4*length(pointsin)/n;  
 
end

%Ejercicio 3
function graf(f, lowlim, uplim, tit)

    x = linspace(lowlim, uplim, 1000);
    y = f(x);
    
    plot(x, y)
    xlabel('x')
    ylabel('f(x)')
    
    in = integral(f, lowlim, uplim);
    title(tit + "   Integral = " + in)

end

%Ejercicio 2
function [me,mi,ma] = func2(x) 
    me = mean(x); 
    mi = min(x);
    ma = max(x);
end

%Ejercicio 1_1
function respuesta = cubo(n)
    if nargin < 1
        n = 0;
    end
    respuesta= n^3;
end
%Ejercicio 1_2
function res = divisible_por_tres(n)
    if mod(n,3) == 0
        res =true;
    else 
        res=false;
    end
    
end
