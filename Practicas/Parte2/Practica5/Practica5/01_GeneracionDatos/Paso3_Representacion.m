clear,clc , close all
addpath('../Funciones/')
load('./DatosGenerados/conjunto_datos_estandarizados.mat');



numDescriptores=length(nombresProblema.descriptores);
for i=1:2:numDescriptores-1
    espacioCCas= [i i+1];
    figure, hold on
    funcion_representa_datos(Z,Y,espacioCCas,nombresProblema);
end



%parte 2
codifClases=unique(Y);
numClases=length(codifClases);
for j=1:numDescriptores 
      
     % Valores máximo y mínimos para representar en la misma escala 
     vMin = min(Z(:,j));  
     vMax = max(Z(:,j)); 
      
     hFigure = figure; hold on 
     bpFigure = figure; hold on 
      
    for i=1:numClases 
      
         Xij = Z(Y==codifClases(i),j); % datos clase i del descriptor j  
  
         figure(hFigure) 
         subplot(numClases,1,i), hist(Xij), 
         xlabel(nombreDescriptores{j}) 
         ylabel('Histograma') 
         axis([ vMin vMax 0 numMuestras/4]) % inf escala automática eje y 
         title(nombreClases{i}) 
          
         figure(bpFigure) 
         subplot(1,numClases,i), boxplot(Xij) 
         xlabel('Diagrama de Caja') 
         ylabel(nombreDescriptores{j}) 
         axis([ 0 2 vMin vMax ]) 
         title(nombreClases{i}) 
     end 
 end