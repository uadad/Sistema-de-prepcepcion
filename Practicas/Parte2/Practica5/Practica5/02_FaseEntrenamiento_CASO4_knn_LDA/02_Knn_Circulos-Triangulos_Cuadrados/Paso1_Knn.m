clc, clear , close all
addpath('../Funciones/')
load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');


dim=4;

codifClases=unique(Y);
%Clase 1
XoIClase=[]; YoIClase=[];
clasesOi_C1=[1 3];
codifClasesOI_C1=codifClases(clasesOi_C1);
numClasesOI=length(clasesOi_C1);

for i=1:numClasesOI
    fOI= Y==codifClasesOI_C1(i);
    X_i = Z(fOI,:);
    XoIClase = [XoIClase; X_i];
    YoIClase = [YoIClase; ones(size(X_i,1),1)];
end
XoIClase1=XoIClase;
YoIClase1=YoIClase;

%Clase 2
XoIClase=[]; YoIClase=[];
clasesOi_C2=[2];
codifClasesOI_C2=codifClases(clasesOi_C2);
numClasesOI=length(clasesOi_C2);

for i=1:numClasesOI
    fOI= Y==codifClasesOI_C2(i);
    X_i = Z(fOI,:);
    XoIClase = [XoIClase; X_i];
    YoIClase = [YoIClase; 2*ones(size(X_i,1),1)];
end
XoIClase2=XoIClase;
YoIClase2=YoIClase;

XoI=[XoIClase1; XoIClase2];
YoI=[YoIClase1; YoIClase2];

espacioCCas_Knn=funcion_selecciona_vector_ccas(XoI,YoI,dim);

save('DatosGenerados\espacioCCas-Knn.mat','espacioCCas_Knn');