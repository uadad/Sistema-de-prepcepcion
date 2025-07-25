clc, clear , close all
addpath('../Funciones/')
load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');

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
espacioCCas=[3 4 12];
XoI=XoI(:,espacioCCas);

nombresProblemaOI=[];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCCas);
nombresProblemaOI.clases = {'Arandelas','Tuercas'};
nombresProblemaOI.simbolos = {'*b','*g'};

[d1,d2,d12,coeficente]=funcion_calcula_d1_d2_d12_LDA_2Clases_2_3_Dim(XoI,YoI);


save('DatosGenerados\LDA.mat','d12','coeficente','XoI','YoI','nombresProblemaOI','espacioCCas');

