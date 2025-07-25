clc, clear , close all
addpath('../Funciones/')
load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');

clasesOi=[3 4];
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
espacioCCas=[8 9 21];
XoI=XoI(:,espacioCCas);

nombresProblemaOI=[];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCCas);
nombresProblemaOI.clases = {'AlcayataLisa','AlcayataRosca'};
nombresProblemaOI.simbolos = {'*b','*g'};

save('DatosGenerados\Knn.mat','nombresProblemaOI','espacioCCas','XoI','YoI');


