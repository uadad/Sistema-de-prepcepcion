


addpath('Funciones')

ruta='../02_Representación/VariableGeneradas/';
load([ruta 'Datos_Generados_Original.mat'])

valoresY= unique(Y);
FoI= Y==valoresY(2);
XColor=X(FoI,:);
XFondo=X(Y==valoresY(1),:);

numAgrup=3;
idx=funcion_kmeans(XColor,numAgrup);
% idxM=kmeans(double(XColor),numAgrup);

datos_multiples_esferas=zeros(numAgrup,6);

for i=1:numAgrup
    XColor_i=X(idx==i,:);
   datos_multiples_esferas(i,:)=calcula_datos_esfera(XColor_i,XFondo);
end

save('VariablesGeneradas\datos_multiples_esferas',"datos_multiples_esferas");

