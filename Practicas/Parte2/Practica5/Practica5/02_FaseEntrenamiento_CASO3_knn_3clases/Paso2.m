clc, clear , close all
addpath('../Funciones/')
load('../01_GeneracionDatos/DatosGenerados/conjunto_datos_estandarizados.mat');
load('DatosGenerados\espacioCcas.mat');

%clasesOi=[1 2 3];
YoI=Y;
XoI=Z(:,espacioCCas);

nombresProblemaOI=[];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCCas);
nombresProblemaOI.clases = {'Circulo','Cuadrado','Triangulo'};
nombresProblemaOI.simbolos = {'*r','*b','*g'};

save('DatosGenerados\Knn.mat',"nombresProblemaOI","espacioCCas","XoI","YoI");

