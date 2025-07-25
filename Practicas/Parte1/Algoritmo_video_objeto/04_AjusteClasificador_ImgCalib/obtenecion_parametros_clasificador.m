clc, clear


addpath('Funciones')


load('..\02_Representación\VariableGeneradas\Datos_Generados.mat','X','Y');


load('../03_DiseñoClasificador/VariablesGeneradas/datos_multiples_esferas.mat','datos_multiples_esferas');


load('..\01_Generación de material\MaterialGenerado\ImagenesEntrenamiento_Calibracion.mat','imagenes');

[nF,nC,Comp,numImg]=size(imagenes);



radio=4;
datosMultiplesEsferas_clasificador=datos_multiples_esferas(:,[1:3 radio]);


ultima_Imagen=imagenes(:,:,:,numImg);

Ib=roipoly(ultima_Imagen);

numero_pixeles=sum(Ib(:));


numPix_ref=round([0.5 0.75 0.9]*numero_pixeles);


numPix=numPix_ref(2);

save('VariablesGeneradas\parametros_clasificador','numPix','datosMultiplesEsferas_clasificador');