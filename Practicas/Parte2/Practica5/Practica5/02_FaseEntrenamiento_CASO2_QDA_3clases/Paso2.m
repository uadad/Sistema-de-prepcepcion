clc, clear , close all
addpath('../Funciones/')
load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');
load('DatosGenerados\espacioCcas.mat');

%clasesOi=[1 2 3];
%codifClases=unique(Y);
%codifClasesOI=codifClases(clasesOi);
%numClasesOI=length(clasesOi);
XoI=Z(:,espacioCCas);
YoI=Y;

nombresProblemaOI=[];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCCas);
nombresProblemaOI.clases = {'Circulo','Cuadrado','Triangulo'};
nombresProblemaOI.simbolos = {'*r','*b','*g'};

[vectorMedias,matricesCovarianza,probabilidadPriori]=funcion_ajuste_QDA(XoI,YoI);

save('DatosGenerados\QDA.mat','matricesCovarianza','probabilidadPriori','vectorMedias','nombresProblemaOI','XoI','YoI','espacioCCas');


