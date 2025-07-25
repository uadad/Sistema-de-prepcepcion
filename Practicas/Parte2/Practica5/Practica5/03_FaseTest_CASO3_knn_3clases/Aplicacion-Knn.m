clc, clear, close all

addpath('..\Funciones\');
ruta='../ImagenesPractica5/Test/';
nombreImage='Test1.JPG';
[I,Z,Ietiq,N]=estandarizar([ruta nombreImage]);

ruta='..\02_FaseEntrenamiento_CASO3_knn_3clases\DatosGenerados\';
nombreArchivo='Knn.mat';
load([ruta nombreArchivo])
valoresC=unique(YoI);

for i=1:N

    Xi=Z(i,espacioCCas);
    Yi=funcion_knn(XoI,YoI,Xi,5);
    posClase=find(valoresC==Yi);
    r=['Este Objeto es un: ' nombresProblemaOI.clases{posClase}];
   
    figure,
    subplot(1,2,1)
    Ib=Ietiq==i;
    Io=funcion_visualiza(I,Ib,[0 255 255],false);
    imshow(Io)
    title(r)

   subplot(1,2,2)
   funcion_representa_datos(XoI,YoI,1:3,nombresProblemaOI);
   hold on
   Xi=Z(i,espacioCCas);
   x1=Xi(1); x2=Xi(2); x3=Xi(3);
   plot3(x1,x2,x3,'.k');

end