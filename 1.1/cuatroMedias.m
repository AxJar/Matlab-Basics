clc
x = rand(1,100);
[ma, mh, mg, mc] = cuatroMedias(x);
disp("Media aritmetica: " + num2str(ma))
disp("Media armónica: " + num2str(mh))
disp("Media geométrica: " + num2str(mg))
disp("Media cuadrática: " + num2str(mc))

function [ma, mh, mg, mc] = cuatroMedias(x)
    ma = media_aritmetica(x);
    mh = media_armonica(x);
    mg = media_geometrica(x);
    mc = media_cuadratica(x);
end

function m = media_aritmetica(x)
    n = length(x);
    m = sum(x)/n;
end

function m = media_armonica(x)
    n = length(x);
    m = n / sum(1./x);
end

function m = media_geometrica(x)
    n = length(x);
    m = prod(x)^(1/n);
end

function m = media_cuadratica(x)
    n = length(x);
    m = sqrt(sum(x.^2)/n);
end
