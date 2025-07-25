clc, clear , close all
addpath('../Funciones/')
load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');


codifClases=unique(Y);
%Clase 1
XoIClase=[]; YoIClase=[];
clasesOi_C1=[1 2];
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
clasesOi_C2=[3 4];
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

%Clase 3
XoIClase=[]; YoIClase=[];
clasesOi_C3=[5 6];
codifClasesOI_C3=codifClases(clasesOi_C3);
numClasesOI=length(clasesOi_C3);

for i=1:numClasesOI
    fOI= Y==codifClasesOI_C3(i);
    X_i = Z(fOI,:);
    XoIClase = [XoIClase; X_i];
    YoIClase = [YoIClase; 3*ones(size(X_i,1),1)];
end
XoIClase3=XoIClase;
YoIClase3=YoIClase;

XoI=[XoIClase1; XoIClase2; XoIClase3];
YoI=[YoIClase1; YoIClase2; YoIClase3];

espacioCCas=[2 3 7];
XoI=XoI(:,espacioCCas);

nombresProblemaOI=[];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCCas);
nombresProblemaOI.clases = {' Arandela-Tuerca ','AlcayataLisa-AlcayataRosca', 'TornilloRosca-TornilloCabHex'};
nombresProblemaOI.simbolos = {'*r','*g', '*b'};

[vectorMedias, matrizCovarianza, probabilidadPriori]=funcion_ajuste_LDA(XoI,YoI);
save('DatosGenerados\LDA.mat','nombresProblemaOI','XoI','YoI','espacioCCas','vectorMedias','matrizCovarianza','probabilidadPriori');

