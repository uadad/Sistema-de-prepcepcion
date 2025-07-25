%% Ejercicio 4- Calculo y representacion de datos esferas de agrupaciones
clc, clear

load('VariablesRequeridas\datos_multiples_esferas.mat');
I=imread('VariablesRequeridas\ImTrain.jpg');
addpath('Funciones\')

Ib=calcula_deteccion_multiples_esferas_en_imagen(I,[datosMultiplesEsferas(:,1:3) datosMultiplesEsferas(:,4)]);
Ib2=calcula_deteccion_multiples_esferas_en_imagen(I,[datosMultiplesEsferas(:,1:3) datosMultiplesEsferas(:,5)]);
Ib3=calcula_deteccion_multiples_esferas_en_imagen(I,[datosMultiplesEsferas(:,1:3) datosMultiplesEsferas(:,6)]);

I2=funcion_visualiza(I,Ib,[255 255 0]);
I3=funcion_visualiza(I,Ib2,[255 255 0]);
I4=funcion_visualiza(I,Ib3,[255 255 0]);
subplot(2,2,1),imshow(I)
subplot(2,2,2),imshow(I2)
subplot(2,2,3),imshow(I3)
subplot(2,2,4),imshow(I4)

ROI=roipoly(I);

numPix=sum(ROI(:));

datosMultiplesEsferas_Calsificador=datosMultiplesEsferas(:,1:4);

save('VariablesGeneradas/parametros_clasififcador.mat','numPix','datosMultiplesEsferas_Calsificador');
