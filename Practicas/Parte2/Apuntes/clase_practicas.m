clear, close all, clc
addpath('../Funciones');

rutaImg='../Imegenes/Entrenamiento/';
nombreImg= 'Triangulo01.jpg';
I=imread([rutaImg nombreImg]);

[Ietiq,N]=funcion_Segmenta_Imagen(I);

stats=regionprops(Ietiq,'Circularity','Eccentricity','Solidity','Extent');
Circ=cat(1,stats.Circularity);
Ecc=cat(1,stats.Eccentricity);
Sol=cat(1,stats.Solidity);
Ext=cat(1,stats.Extent);

XImagen= [Circ Ecc Sol Ext];


% calcular el boudingbox de un objeto
etiq=5;
Ib_etiq=Ietiq==etiq;
[f,c]= find(Ib_etiq);

fmin=min(f)-0.5;
fmax=max(f)+0.5;
cmin=min(c)-0.5;
cmax=max(c)+0.5;
ABB=(cmax-cmin)*(fmax-fmin);
numPixObjeto=sum(Ib_etiq(:));
BoudingBox=numPixObjeto/ABB;






X=funcion_calcula_ExtentIR_HU_DF(Ietiq,N)

X=zeros(N,1+7+10);% 1->IR,7->HU,10->Df

for i=1:N
   Ib=Ietiq==i;
   EIR=funcion_Calcula_Extent_Inv_Rot(Ib);
   Hu=Funcion_Calcula_Hu(Ib);
   DF=Funcion_Calcula_DF(Ib,10);
   X(i,:)=[EIR, Hu, DF];
end
