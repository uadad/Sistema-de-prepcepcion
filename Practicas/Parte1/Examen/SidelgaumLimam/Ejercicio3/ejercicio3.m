%% Ejercicio 3 - Calculo y representacion de datos esferas de agrupaciones

clc, clear

load('VariablesRequeridas\conjunto_de_datos.mat');
addpath('Funciones\');

valoresY= unique(Y);
FoI= Y==valoresY(2);
XColor=X(FoI,:);
XFondo=X(Y==valoresY(1),:);

numAgrup=5;
idx=funcion_kmeans(XColor,numAgrup);

datos_multiples_esferas=zeros(numAgrup,6);

for i=1:numAgrup
    XColor_i=X(idx==i,:);
   datos_multiples_esferas(i,:)=calcula_datos_esfera(XColor_i,XFondo);
end

save('datos_multiples_esferas.mat','datos_multiples_esferas');


%% Ejercico2

for i=1:3

representa_datos_color_seguimiento_fondo(X,Y),hold on 
for j=1:numAgrup
    centroide=datos_multiples_esferas(j,1:3);
    radio=datos_multiples_esferas(j,i+3);
   representa_esfera(centroide,radio)
end
hold off;
end

