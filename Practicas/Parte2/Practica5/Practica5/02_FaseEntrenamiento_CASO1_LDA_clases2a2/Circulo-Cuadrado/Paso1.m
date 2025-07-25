clc, clear, close all

addpath('../../Funciones/')
load('../../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');

dim=3;
clasesOi=[1 2];
codifClases=unique(Y);
codifClasesOI=codifClases(clasesOi);
XoI=[]; YoI=[];
numClasesOI=length(clasesOi);
for i=1:numClasesOI
    fOI= Y==codifClasesOI(i);
    X_i = Z(fOI,:);
    Y_i = Y(fOI);
    XoI = [XoI; X_i];
    YoI = [YoI; Y_i];
end

espacioCCas=funcion_selecciona_vector_ccas(XoI,YoI,dim);

save('DatosGenerados\espacioCcas.mat','espacioCCas');