%%
function r = suma(primera, segunda, tercera)
    
    if nargin < 3
        tercera = 0;
    end
    
    if nargin < 2
        segunda = 10;
    end
    
    if nargin < 1
        primera = 100;
    end
    
    if ~isnumeric(primera)
        err("El primer argumento debe ser numérico")
    end
    
    if ~isnumeric(segunda)
        err("El segundo argumento debe ser numérico")
    end

    if ~isnumeric(tercera)
        err("El tercero argumento debe ser numérico")
    end
    
    if ~isscalar(segunda)
        err("El segunda argumento debe ser escalar")
    end
    
    r = primera + segunda + tercera;
end

%%
function mi_septima_funcion
    global b
    disp(b)
end
function r = mi_sexta_function(arg1, arg2)

    if nargin < 2
        arg2 = 0;
    end
    
    if nargin < 1
        arg1 = 10;
    end
    
    if ~isnumeric(arg1)
        err("El primer argumento debe ser numérico")
    end
    
    if ~isnumeric(arg2)
        err("El segundo argumento debe ser numérico")
    end
    
    r = arg1 + arg2;
end


%% 
function mi_segunda_funcion
    disp("Hola de nuevo")
    disp("¿Cómo estás?")
end

%% 
function mi_tercera_funcion(primero, segundo, tercero)
    a = primero + segundo + tercero;
    disp("a = " + num2str(a))
end

%%
function r = mi_cuarta_funcion
    r = 5;
    r = 52;
    r = randi(100,1,100);
end

%%
function [r1, r2] = mi_quinta_funcion
    r1 = 5;
    r2 = 52;
end

%%
h = randi(24);
m = randi(24);
s = randi(24);
disp(calcula_segundos(h, m, s))

%%
function r = calcula_segundos(horas, minutos, segundos)

    if nargin ~=3
        error("La cantidad de argumentos debe ser 3")
    end
    
    if ~isnumeric(horas) || ~isscalar(horas)
        error("horas debe ser numérico y escalar")
    end
    
    if ~isnumeric(minutos) || ~isscalar(minutos)
        error("minutos debe ser numérico y escalar")
    end
    
    if ~isnumeric(segundos) || ~isscalar(segundos)
        error("segundos debe ser numérico y escalar")
    end
    
    r = horas*3600 + minutos*60 + segundos;
end
assert

