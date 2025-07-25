

% para leer las imagenes y generar XTrain y YTrain
addpath('./Funciones')
ruta='./ImagenesPractica5/Entrenamiento/';
extension='.jpg';
nombreClase={'Circulo','Cuadrado', 'Triangulo'}; % otro scripot se modifica esto  y numImClase
numClases=length(nombreClase);
numImClase=2;
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

nombreClase{1}='Circulos';
nombreClase{2}='Cuadrados';
nombreClase{3}='Triangulos';

simboloClases{1}='*r';
simboloClases{2}='*g';
simboloClases{3}='*b';

nombresProblema= [];
nombresProblema.descriptores= nombreDescriptores;
nombresProblema.clases= nombreClase;
nombresProblema.simbolos= simboloClases;


save('./DatosGenerados/conjunto_datos', 'X','Y','nombresProblema');




%%%%
clear,clc, close all
load('./DatosGenerados/conjunto_datos','X','Y','nombresProblema');

% justificacion estandarizacion de datos
mean(X);
std(X);

% estandarizacion de datos
medias=mean(X);
desv=std(X);
desv(desv==0)=eps;
Z=X;
for i=1:size(X,1)
    for j=1:22
        Z(i,j)=(X(i,j)-medias(j))/desv(j); % quitamos el primer for Z(:,j)=(X(:,j)-medias(j))/desv(j);
    end
end

% guardar la Z y la Y y los nombresProblema en
% conjunto-datos_estandarizacion
%y las medias y desv tipica en datos_estandarizacion

save('./DatosGenerados/conjunto_datos_estandarizados.mat','Z','Y','nombresProblema');

save('./DatosGenerados/medias_desviaciones_estandarizacion.mat','medias','desv','nombresProblema');
% funcion representa datos
numDescriptores=length(nombresProblema.descriptores);
for i=1:2:numDescriptores-1
    espacioCCas= [i i+1];
    funcion_respresenta_datos(Z,Y,espacioCCas,nombresProblema);
end




% Sacar los datos de indiceJ que calcula la separabilidad entre el
% descriptor 5 y el 6 que son el Inv_Rotacion y el numero 1 de Hu

Xoi=X(:,[5 6]);

YoI=Y;
Separabilidad=indiceJ(Xoi,YoI);



%% Crear ranking de caracteristicas  individuales para separar
% las tres clases del problema

XoI=X;
YoI=Y;
nombresProblemaOI=nombresProblema;
numDescriptores=22;
J=zeros(numDescriptores,1);

for i=1:numDescriptores

      J(i)=indiceJ(XoI(:,i),YoI);

end 

[Jord,ind]=sort(J,'descend');
dim=3;
espacioCCas=ind(1:dim); % la tres mejores caracteristicas 

XoI=XoI(:,espacioCCas);
nombresProblemaOI.descriptores=nombresProblemaOI.descriptores(espacioCCas);
figure,
espacioCC_representacion=1:length(espacioCCas);
funcion_representa_datos(XoI,YoI,espacioCC_representacion,nombresProblemaOI);


%% los tres mejores en combinacion

XoI=X;
YoI=Y;
nombresProblemaOI=nombresProblema;
numDescriptores=22;

dim=3;
comb=combnk(1:numDescriptores,dim);
numComb=size(comb,1);
J=zeros(numComb,1);

for i=1:numComb

      J(i)=indiceJ(XoI(:,comb(i,:)),YoI);

end 

[Jord,ind]=max(J);
espacioCCas=comb(ind,:); 

XoI=XoI(:,espacioCCas);
nombresProblemaOI.descriptores=nombresProblemaOI.descriptores(espacioCCas);
figure,
espacioCC_representacion=1:length(espacioCCas);
funcion_representa_datos(XoI,YoI,espacioCC_representacion,nombresProblemaOI);




