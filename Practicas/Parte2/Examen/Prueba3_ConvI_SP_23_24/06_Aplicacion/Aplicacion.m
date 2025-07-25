clc, clear, close all

addpath('..\Funciones\');
ruta='../Imagenes/Test/';
nombreImage='Test01.bmp';
[I,Z,Ietiq,N]=estandarizar([ruta nombreImage]);

rutaKnn='..\04_AlcayataLisa_AlcayataRosca_KNN\DatosGenerados\';
nombreArchivoKnn='Knn.mat';
rutaLDA1='..\02_ArandelaTuerca_Alcayatas_Tornillos_LDA\DatosGenerados\';
nombreArchivo_LDA='LDA.mat';
rutaLDA2='..\03_Arandela_Tuerca_LDA\DatosGenerados\';
rutaQDA='..\05_TornilloRosca_TornilloCabHex_QDA\DatosGenerados\';
nombreArchivo_QDA='QDA.mat';


for i=1:N
        load([rutaLDA1 nombreArchivo_LDA]);
         valoresC=unique(YoI);
      Xi=Z(i,espacioCCas);
      Yi=funcion_aplica_LDA(Xi,vectorMedias,matrizCovarianza,probabilidadPriori,valoresC);
      pos=find(valoresC==Yi);
       if pos==1
           load([rutaLDA2 nombreArchivo_LDA])
           Xi=Z(i,espacioCCas);
           x1=Xi(1);  x2=Xi(2);  x3=Xi(3);
           valor1=eval(d12);
           if valor1 > 0
               r=['Arandela'];
           else
               r=['Tuerca'];
           end
       elseif pos==2
           load([rutaKnn nombreArchivoKnn])
           K=5;
           Xi=Z(i,espacioCCas);
           valoresC=unique(YoI);
           Yi=funcion_knn(XoI,YoI,Xi,K);
           posClase=find(valoresC==Yi);
           if posClase==4
                r=['AlcayataLisa'];
           else
                r=['AlcayataRosca'];
           end
       else
           load([rutaQDA nombreArchivo_QDA])
            Xi=Z(i,espacioCCas);
            x1=Xi(1);  x2=Xi(2);  x3=Xi(3);
            valor1=eval(d12);
           if valor1>0
                r=['TornilloRosca'];
           else
                r=['TornilloCabHex'];
           end
       end

    figure,
    subplot(1,2,1),
    Ib=Ietiq==i;
    IO=funcion_visualiza(I,Ib,[0 255 0],false);
    imshow(IO)
    title(r)

    load([rutaLDA1 nombreArchivo_LDA])
    subplot(1,2,2),
    funcion_representa_datos(XoI,YoI,1:3,nombresProblemaOI);
    hold on
    Xi=Z(i,espacioCCas);
    x1=Xi(1); x2=Xi(2); x3=Xi(3);
    plot3(x1,x2,x3,'*k');
end
