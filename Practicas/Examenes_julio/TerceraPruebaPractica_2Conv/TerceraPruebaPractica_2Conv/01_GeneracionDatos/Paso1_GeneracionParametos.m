clear, close all, clc
addpath('../Funciones')
ruta='../Imagenes/Entrenamiento/';
extension='.bmp';
nombreClase={'Arandela','Tuerca', 'Alcayata', 'TornilloRosca', 'TornilloCabHex'};
numClases=length(nombreClase);
numImClase=3;
X=[];
Y=[];
for i=1:numClases
    for j=1:numImClase
        nombreImage=[nombreClase{i} num2str(j,'%02d') extension];
        I=imread([ruta nombreImage]);
        [Ietiq,N]=funcion_Segmenta_Imagen(I);

         if N>0
              Yimagen=i*ones(N,1);
              Ximagen=funcion_calcula_descriptores_imagen(Ietiq,N);
         else
             Ximagen=[];
             Yimagen=[];
         end

         X=[X; Ximagen];
         Y=[Y; Yimagen];
    end
end

nombreDescriptores={'Circularidad','Excentricidad','Solidez','Extension', 'Extension Invariante Rotacion', 'Hu Numero 1', 'Hu Numero 2','Hu Numero 3','Hu Numero 4','Hu Numero 5','Hu Numero 6','Hu Numero 7','DF Numero 1','DF Numero 2','DF Numero 3','DF Numero 4','DF Numero 5','DF Numero 6','DF Numero 7','DF Numero 8','DF Numero 9','DF Numero 10','Numero de Euler' }

nombreClase{1}='Arandelas';
nombreClase{2}='Tuercas';
nombreClase{3}='Alcayata';
nombreClase{4}='TornilloRosca';
nombreClase{5}='TornilloCabHex';

simboloClases{1}='*r';
simboloClases{2}='*g';
simboloClases{3}='*b';
simboloClases{4}='*k';
simboloClases{5}='*y';

nombresProblema= [];
nombresProblema.descriptores= nombreDescriptores;
nombresProblema.clases= nombreClase;
nombresProblema.simbolos= simboloClases;


save('./DatosGenerados/conjunto_datos', 'X','Y','nombresProblema');
