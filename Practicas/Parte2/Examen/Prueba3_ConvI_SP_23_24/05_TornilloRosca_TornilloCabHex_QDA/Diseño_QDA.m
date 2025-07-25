clc, clear , close all
addpath('../Funciones/')
load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');
load('DatosGenerados\espacioCcas.mat');

clasesOi=[5 6];
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
nombresProblemaOI.clases = {'TornilloRosca','TornilloCabHex'};
nombresProblemaOI.simbolos = {'*b','*g'};

%[vectorMedias,matricesCovarianza,probabilidadPriori]=funcion_ajuste_QDA(XoI,YoI);
[d1,d2,d12]=funcion_calcula_d1_d2_d12_QDA_2Clases_2_3_Dim(XoI,YoI);

%save('DatosGenerados\QDA.mat','matricesCovarianza','probabilidadPriori','vectorMedias','nombresProblemaOI','XoI','YoI','espacioCCas');

save('DatosGenerados\QDA.mat','d12','nombresProblemaOI','XoI','YoI','espacioCCas');