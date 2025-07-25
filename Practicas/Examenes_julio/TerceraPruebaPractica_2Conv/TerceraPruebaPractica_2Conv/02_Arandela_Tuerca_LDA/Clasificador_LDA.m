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

espacioCCas=[1 3 6];
XoI=XoI(:,espacioCCas);

nombresProblemaOI=[];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCCas);
nombresProblemaOI.clases = {' Arandela ',' Tuerca'};
nombresProblemaOI.simbolos = {'*r','*g'};

[d1,d2,d12,coef]=funcion_calcula_d1_d2_d12_LDA_2Clases_2_3_Dim(XoI,YoI);
save('DatosGenerados\LDA.mat','nombresProblemaOI','XoI','YoI','espacioCCas','d12','coef');
