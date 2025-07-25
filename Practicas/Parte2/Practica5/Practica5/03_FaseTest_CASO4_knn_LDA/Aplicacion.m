clc, clear, close all

addpath('..\Funciones\');
ruta='../ImagenesPractica5/Test/';
nombreImage='Test1.JPG';
[I,Z,Ietiq,N]=estandarizar([ruta nombreImage]);

rutaKnn='..\02_FaseEntrenamiento_CASO4_Knn_LDA\02_Knn_Circulos-Triangulos_Cuadrados\DatosGenerados\';
nombreArchivoKnn='Knn.mat';
rutaLDA='..\02_FaseEntrenamiento_CASO4_Knn_LDA\02_LDA_Circulos_Triangulos\DatosGenerados\';
nombreArchivoLDA='LDA.mat';

load([rutaKnn nombreArchivoKnn]);
codifClases=unique(YoI);
k=5;

Xtest=Z(:,espacioCCas);
YtestKnn=funcion_knn(XoI,YoI,Xtest,k);

for i=1:N
    YtestKnn_i=YtestKnn(i);
    posClaseOi=find(codifClases==YtestKnn_i);
    if posClaseOi==2
        claseOi=nombresProblemaOI.clases{posClaseOi};
        r=['Reconocimiento Objeto: ' claseOi];
    else
        load([rutaLDA nombreArchivoLDA]);
        Xtest_i=Z(i,espacioCCas);
        x1=Xtest_i(1);  x2=Xtest_i(2);  x3=Xtest_i(3);
        valoresCircuT=eval(d12);
        if valoresCircuT > 0
            claseOi=nombresProblemaOI.clases{1};
            r=['Reconocimiento Objeto: ' claseOi];
        else
             claseOi=nombresProblemaOI.clases{3};
            r=['Reconocimiento Objeto: ' claseOi];
        end
    end
end