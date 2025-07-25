%% Ejercicio 5 - Aplicación de algoritmo de clasificacion en imagen de test
clc, clear

load("VariablesRequeridas\parametros_clasificador.mat");

I=imread("VariablesRequeridas\ImTest.jpg");

Ib=calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas_clasificador);

I2=funcion_visualiza(I,Ib,[255 255 0]);
figure, imshow(I2)

IB_f=bwareaopen(Ib,numPix);
[Ietiq numObj]=bwlabel(IB_f);
I3=I;
if numObj>0
    for i=1:numObj
        Ib_i=Ietiq==i;
        I3=funcion_visualiza(I3,Ib_i,[255 255 0]);
    end
    stats=regionprops(Ietiq,'Area','Centroid');
   centroides=cat(1,stats.Centroid);
   areas=cat(1,stats.Area);
   
   W=7;
   vmin=floor(W/2)+1;
   vmax=size(I,1)-floor(W/2);
   vmax2=size(I,2)-floor(W/2);
   pos=find(centroides(:,2)<vmin | centroides(:,2)>vmax);
   centroides(pos,:)=[];
   areas(pos,:)=[];
   pos=find(centroides(:,1)<vmin | centroides(:,1)>vmax2);
   centroides(pos,:)=[];
   areas(pos,:)=[];

   [area_Ord indice]=sort(areas,'descend');
   xc=centroides(indice(1),2);
   yc=centroides(indice(1),1);
  
    I3(round(xc)-floor(W/2):round(xc)+floor(W/2),round(yc)-floor(W/2):round(yc)+floor(W/2),1:2)=0;
    I3(round(xc)-floor(W/2):round(xc)+floor(W/2),round(yc)-floor(W/2):round(yc)+floor(W/2),3)=255;

end

figure, imshow(I3)