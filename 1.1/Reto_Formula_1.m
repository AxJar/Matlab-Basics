clc
clear
clf

f1 = @(x)0.0000070833*x.^3-0.01075*x.^2+3.4666666667*x+680;
f2 = @(x)3*0.0000070833*x.^2-2*0.01075*x+3.46666;
f3 = @(x)2*3*0.0000070833*x-2*0.01075;

xmin = 200;
xmax = 1200;
ymin = 200;
ymax = 1600;

points = 100;
step = (xmax-xmin)/points;

x = zeros(1,points);
y = zeros(1,points);

x(1) = xmin;
x(points) = xmax;

for i = 2:1:points+1
    x(i) = x(i-1)+step;
end

for i = 1:1:points+1
    y(i) = f1(x(i));
end

lp = zeros(1,points);
pp = zeros(1,points);
lt = 0;

len = 0;
l = zeros(1,points);

for i = 2:1:points+1
    lp(i) = sqrt((x(i)-x(i-1)).^2+(y(i)-y(i-1)).^2);
    len = len + lp(i);
    l(i) = len;
    lt = lt+lp(i);
end

rc = zeros(1,points);
t = zeros(1,points);
vmax = zeros(1,points);
vp = 0; 
g = 9.81;
c = 1.5;

for i = 1:1:points+1
    rc(i) = ((1+f2(x(i)).^2).^(3/2))/abs(f3(x(i)));
    vmax(i) = sqrt(rc(i)*g*c);
end
vp = 50;

%disp("Longitud de la curva " + num2str(len) + " m");

% Tiempo

tiempo = (lt/vp);

for k = 1:1:points+1
    t(k) = l(k)/vp;
end

%disp("Tiempo: " + num2str(tiempo) + " s");

menu = 3;

while menu == 3
    disp("Solucion del reto F1");
    disp("Elige una opcion:");
    disp("1) Recorrido de la pista con derrape.");
    disp("2) Recorrido de la pista segura.");
    disp("3) Salir del menu");
    menu = input("Ingrese opcion: ");

    if menu == 1
        plot(x,y,"-r")
        axis equal
        xlim([0 ,1600])
        ylim([0 ,1600])
        xlabel("x")
        ylabel("y")
        title("f(x)")
        hold on;
        grid on;        
    end

    if menu == 2
        plot(x,y,"-g")
        axis equal
        xlim([0 ,1600])
        ylim([0 ,1600])
        xlabel("x")
        ylabel("y")
        title("f(x)")
        hold on;
        grid on;
    end
        
    puntos();
    gradas();

    %Cuadro de informacion en grafica
    textox = 100; textoy = 1500;
    yspace = 70;
    text(textox,textoy,['Posicion inicial = [' num2str(xmin) ',' num2str(ymin),']'])
    text(textox,textoy-yspace,['Posicion final = [' num2str(xmax) ',' num2str(ymax),']'])

    t0 = text(textox,textoy-2*yspace,['X = ' num2str(x(1))]);
    t1 = text(textox,textoy-3*yspace,['Y = ' num2str(y(1))]);
    t2 = text(textox,textoy-4*yspace,['Vel. = ' num2str(vmax(1))]);
    t3 = text(textox,textoy-5*yspace,['Tiempo = ' num2str(t(1))]);
    t4 = text(textox,textoy-6*yspace,['Longitud = ' num2str(lt)]);

    k = 1;
    
    for j=points:-1:1
        if menu == 1
            %if x(j)<=860
            if vmax(j)<=vp
            %if rc(j)<=100
                text(x(j)+100,y(j),'PELIGRO DERRAPE',"fontsize",10,"color","r");
                ld = @(z) f2(x(j))*(z-x(j)) + y(j);
                
                px = linspace(x(j), x(j) - 200, 90);
                py = ld(px);
                for i=1:1:90
                    plot(px(i),py(i), "o b");
                    pause(0.0005);
                    plot(px(i),py(i), "o w");
                    drawnow
                    plot(px,py,"-g");
                    plot(px,py,"-r");
                    
                    xlim([0 ,1600])
                    ylim([0 ,1600])
                end
                plot(px(90),py(90), "o b");
                break;
            end
        end
        
        plot(x(j),y(j),'o b')
        set(t0, 'String', ['X = ' num2str(x(j))])
        set(t1, 'String', ['Y = ' num2str(y(j))])
        set(t2, 'String', ['Vel. = ' num2str(vmax(j))])
        set(t3, 'String', ['Tiempo = ' num2str(t(k))])
        k = k+1;
        pause(0.1)
        plot(x(j),y(j),'o w')
        xlim([0 ,1600])
        ylim([0 ,1600])
        drawnow
    end 
end

function puntos()
    px = [200 400 800 1200];
    py = [1000 800 200 1600];
    plot (px, py, "*");
    title ('Grafica de puntos');
    grid on;
    axis equal;
    hold on;
end

function gradas()
    x5 = 980; y5 = 354.50267; x6 = 1010; y6 = 428.66;
    x7 = 999; y7 = 344.36; x8 = 1029; y8 = 418.52;
    patch('Faces', [1 2 3 4],'Vertices',[x5 y5; x6 y6; x8 y8; x7 y7], 'FaceColor','yellow');
    text(1010, 428.66, '\rightarrow Grada#1')

    x1 = 460; y1 = 645; x2 = 496.53; y2 = 573.83;
    x3 = 478.73; y3 = 561.69; x4 = 442.2; y4 = 632.87;
    patch('Faces', [1 2 3 4],'Vertices',[x1 y1; x2 y2; x3 y3; x4 y4], 'FaceColor','red');
    text(460,645, '\rightarrow Grada#2')
end