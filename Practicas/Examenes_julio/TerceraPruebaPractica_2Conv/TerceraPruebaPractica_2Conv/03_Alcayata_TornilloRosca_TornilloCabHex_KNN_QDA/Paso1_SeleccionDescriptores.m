clc, clear , close all
addpath('../Funciones/')
load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');

dim=3;
X=Z(:,1:end-1);
clasesOi=[3 4 5];
codifClases=unique(Y);
codifClasesOI=codifClases(clasesOi);
XoI=[]; YoI=[];
numClasesOI=length(clasesOi);
for i=1:numClasesOI
    fOI= Y==codifClasesOI(i);
    X_i = X(fOI,:);
    Y_i = Y(fOI);
    XoI = [XoI; X_i];
    YoI = [YoI; Y_i];
end
espacioCCas=funcion_selecciona_vector_ccas(XoI,YoI,dim);

save('DatosGenerados\espacioCCas.mat',"espacioCCas");