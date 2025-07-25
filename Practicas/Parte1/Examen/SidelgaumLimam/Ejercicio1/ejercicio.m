%% EJERCICIO 1
clc, close all, clear

addpath('Funciones');

I=imread("Ej1.png");
Ib=I>0;

If=funcion_filtra_Objetos(Ib,50);

[Ietiq numObj]=funcion_etiquetar(If);

if numObj>0
    areas=funcion_calcula_area(Ietiq,numObj);
    [areas_ord pos]=sort(areas,'descend');
    If(Ietiq==find(areas_ord(1)))=false;
end
imshow(If);


%% EJERCICO2
I_salida=uint8(zeros(size(I,1),size(I,2),3));
I_salida(:,:,1)=I;
I_salida(:,:,2)=I;
I_salida(:,:,3)=I;
[Ietiq numObj]=funcion_etiquetar(If);
if numObj>0
    areas=funcion_calcula_area(Ietiq,numObj);
    centroides=funcion_calcula_centroides(Ietiq,numObj);
    [areas_ord pos]=sort(areas,'descend');
    I_salida(round(centroides(pos(1),2)),round(centroides(pos(1),1)),1:2)=255;
    I_salida(round(centroides(pos(1),2)),round(centroides(pos(1),1)),3)=0;

    Ib_i=Ietiq==pos(1);
    I_salida=funcion_visualiza(I_salida,Ib_i,[255 0 0]);

    Ib_i2=Ietiq==pos(2);
    I_salida=funcion_visualiza(I_salida,Ib_i2,[0 255 0]);
end

imshow(I_salida)
