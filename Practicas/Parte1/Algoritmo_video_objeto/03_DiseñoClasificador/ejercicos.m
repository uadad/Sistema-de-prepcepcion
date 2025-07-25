
%%% Ejercicos

addpath('Funciones')

ruta='../02_Representación/VariableGeneradas/';
load([ruta 'Datos_Generados.mat'])

XColor=X(Y==1,:);
XFondo=X(Y==0,:);

datos_esferas=calcula_datos_esfera(XColor,XFondo);

centroide=datos_esferas(1,1:3);
radios=datos_esferas(1,4:6);
addpath('../02_Representación/Funciones/')
for i=1:length(radios)
representa_datos_color_seguimiento_fondo(X,Y),hold on 
representa_esfera(centroide,radios(i)),hold off
title(['Esfera de Radio ' num2str(i) ' : ' num2str(radios(i))])

pause
end


%%% Ejercico2

load('../01_Generación de material/MaterialGenerado/ImagenesEntrenamiento_Calibracion.mat')

[N M NumComp NumImg]=size(imagenes);

addpath('Funciones')

ruta='../02_Representación/VariableGeneradas/';
load([ruta 'Datos_Generados.mat'])

XColor=X(Y==1,:);
XFondo=X(Y==0,:);

datos_esferas=calcula_datos_esfera(XColor,XFondo);

centroide=datos_esferas(1,1:3);
radios=datos_esferas(1,4:6);


addpath('../../P2/Funciones/')
for i=1:NumImg
   color=[255 255 0];

   I=imagenes(:,:,:,i);
   subplot(2,2,1),imshow(I)

    % calculamos los pixeles de cada radio
   Ib1=calcula_deteccion_1esfera_en_imagen(I,[centroide radios(1)]);
   Ib2=calcula_deteccion_1esfera_en_imagen(I,[centroide radios(2)]);
   Ib3=calcula_deteccion_1esfera_en_imagen(I,[centroide radios(3)]);

    % visualizamos las imagenes
   I2=funcion_visualiza(I,Ib1,color,false);
   subplot(2,2,2),imshow(I2)
   title(radios(1))

   I3=funcion_visualiza(I,Ib2,color,false);
   subplot(2,2,3),imshow(I3)
   title(radios(2))

   I4=funcion_visualiza(I,Ib3,color,false);
   subplot(2,2,4),imshow(I4)
   title(radios(3))
 
   pause
end