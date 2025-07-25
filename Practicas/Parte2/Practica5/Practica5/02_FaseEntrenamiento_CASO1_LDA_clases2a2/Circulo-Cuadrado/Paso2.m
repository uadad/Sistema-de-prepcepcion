clc, clear, close all

addpath('../../Funciones/')
load('../../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');

load('DatosGenerados\espacioCcas.mat');

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

XoI=XoI(:,espacioCCas);

nombresProblemaOI=[];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCCas);
nombresProblemaOI.clases = {'Circulo','Cuadrado'};
nombresProblemaOI.simbolos = {'*r','*b'};

[d1,d2,d12,coeficente]=funcion_calcula_d1_d2_d12_LDA_2Clases_2_3_Dim(XoI,YoI);


save('DatosGenerados\LDA.mat','nombresProblemaOI','d1','d2',"d12","coeficente",'XoI','YoI','espacioCCas');
