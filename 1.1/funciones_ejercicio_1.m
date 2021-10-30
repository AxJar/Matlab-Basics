%% Ejercicio 1 de funciones
disp("Segundos: " + num2str(calcula_segundos(6, 5, 2)))
disp("Segundos: " + num2str(calcula_segundos2(2, 4, 2)))

%% Función calcula segundos
function s = calcula_segundos(horas, minutos, segundos)   

    if nargin ~= 3
        error('Esta función requiere de tres argumentos')
    end
    
    if ~isnumeric(horas) 
        error('Las horas deben ser un parámetro numérico')
    end
    if ~isscalar(horas) 
        error('Las horas deben ser un escalar')
    end

    if ~isnumeric(minutos) 
        error('Los minutos deben ser un parámetro numérico')
    end
    
    if ~isscalar(minutos) 
        error('Los minutos deben ser un escalar')
    end    
    
    if ~isnumeric(segundos) 
        error('Los segundos deben ser un parámetro numérico')
    end
    
    if ~isscalar(segundos) 
        error('Los segundos deben ser un escalar')
    end
    
    s = horas * 3600 + minutos * 60 + segundos;
end

%% Función calcula segundos
function s = calcula_segundos2(horas, minutos, segundos)
    if nargin < 3
        segundos = 0;
    end
    
    if nargin < 2
        minutos = 0;
    end
    
    if nargin < 1
        horas = 0;
    end

    s = horas * 3600 + minutos * 60 + segundos;
end

