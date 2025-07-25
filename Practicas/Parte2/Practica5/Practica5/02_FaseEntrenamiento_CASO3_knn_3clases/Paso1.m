clc, clear , close all
addpath('../Funciones/')
load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');

dim=5;
%clasesOi=[1 2 3];
%codifClases=unique(Y);
%codifClasesOI=codifClases(clasesOi);
XoI=Z(:,1:end-1); YoI=Y;
%numClasesOI=length(clasesOi);
espacioCCas=funcion_selecciona_vector_ccas(XoI,YoI,dim);

save('DatosGenerados\espacioCCas.mat',"espacioCCas");