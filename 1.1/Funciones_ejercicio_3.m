%% Ejercicio 3 de funciones

a = randi(1000);
clc
disp("Pies = " + num2str(a) + "   Metros = " + num2str(pies_a_metros(a)))

a = randi(1000);
disp("Pulgadas = " + num2str(a) + "   Metros = " + num2str(pulgadas_a_metros(a)))

a = randi(1000);
disp("Yardas = " + num2str(a) + "   Centrímetros = " + num2str(yardas_a_metros(a)))


%% Conversión de pies a metros
function r = pies_a_metros(x)
    if nargin < 1
        x = 0;
    end
    if ~isnumeric(x)
        error('La función sólo acepta valores numéricos')
    end
    
    r = x*0.3048;
end

%% Conversión de pulgadas a metros
function r = pulgadas_a_metros(x)
    if nargin < 1
        x = 0;
    end
    if ~isnumeric(x)
        error('La función sólo acepta valores numéricos')
    end
    
    r = x*0.0254;
end

%% Conversión de yardas a centímetros
function r = yardas_a_metros(x)
    if nargin < 1
        x = 0;
    end
    if ~isnumeric(x)
        error('La función sólo acepta valores numéricos')
    end
    
    r = x*91.44;
end