%% Solución Reto Equipo 2
%A01640120  Emilio González Martínez
%A01636324  Axel Jarquin Morga
%A01639225  Carla Morales López
%A01639289  Joel Isaias Solano Ocampo
%A01639710  Ulises Delgado Martinez

clc
g = 9.81; %gravedad
step = 0.5; %paso
kp = input("Ingrese la resistencia del aire (recomendada 1.17): ");
%kp = 1.165586167;
m = 29984.28182; %masa

% Inicializa los vectores de posición, velocidad y aceleración
h = []; %altura
s = []; %distancia en x
v = []; %velocidad (vector)
vx = []; %velocidad en x(componente)
vy = []; %velocidad en y
ax = []; %aceleracion en x (componente)
ay = []; %aceleracion en y

% Asignar los valores iniciales
h(1) = 5426; %altura del volcan
s(1) = 0;
v(1) = input("Ingrese la velocidad inicial 200-400: ");
%v(1) = 350;
ay(1) = -g; %gravedad negativa
ax(1) = 0;
ang = input("Ingrese el ángulo 60-80: ");
%ang = 70;
angRad = deg2rad(ang); %calculando angulo en radianes
vy(1) = sin(angRad)*v(1); %calculcar velocidad en X y Y 
vx(1) = cos(angRad)*v(1);

k = 2; %contador

% Volcan
x = -1570:1570; %dominio del volcan en la grafica
volcano = 5426*sin(0.001*x-6*pi/4); %para que se dibuje la forma del volcan

hold on

plot(x,volcano,"k");

%inicializar texto
texto = "s";
texto1 = "s";
texto2 = "s";

while h > 0
    % Eje y
        % Nueva posición
        h(k) = h(k-1) + step.*vy(k-1) + 0.5.*ay(k-1).*step.^2;

        % Velocidad intermedio    
        vmy = vy(k-1) + 0.5.*ay(k-1).*step;

        % Nueva aceleración
        ay(k) = -g + (kp./m).*vmy.^2;

        % Nueva velocidad
        vy(k) = vmy + 0.5.*ay(k).*step;   
    
    % Eje x
        % Nueva posición
        s(k) = s(k-1) + step.*vx(k-1) + 0.5.*ax(k-1).*step.^2;

        % Velocidad intermedio    
        vmx = vx(k-1) + 0.5.*ax(k-1).*step;

        % Nueva aceleración
        ax(k) =(kp./m).*vmx.^2 .* sign(vx(k-1));

        % Nueva velocidad
        vx(k) = vmx + 0.5.*ax(k).*step;  
        
       
    % Velocidad
        v(k) = sqrt(vx(k).^2+vy(k)^2);
        
       %borrar texto en la grafica
       delete(texto)
       delete(texto1)
       delete(texto2)
       
       %graficar la s(vector x) y la h(vector y), 'ro' de rojo
       plot(s, h, 'ro')
       
       %asignar limites de la grafica
       xlim([-50000 50000])
       ylim([0 18000])
       
       %imprimir nuevo texto con nuevos valores
       texto1 = text(30000, 10000, "v = " + num2str(v(k)));
       texto = text(30000, 9000, "x = " + num2str(s(k)));
       texto2 = text(30000, 8000, "y = " + num2str(h(k)));
       
       %nombrar los ejes
       xlabel('s')
       ylabel('h(s)')
       
       %asignar titulo y dibujar grafica
       title('Roca 1')
       drawnow
     
    k = k + 1; %incrementa contador
end

%al final terminamos imprimiendo datos como hmax, smax y valores de entrada
text(30000, 12000, "hmax = " + num2str(max(h)))
text(30000, 11000, "smax = " + num2str(max(s)))
text(-40000, 12000, "Resitencia del aire = " + num2str(kp))
text(-40000, 11000, "Velocidad inicial = " + num2str(v(1)))
text(-40000, 10000, "Ángulo  = " + num2str(ang))

hold off