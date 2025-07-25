clc, clear, close all

addpath('..\Funciones\');
ruta='../Imagenes/Test/';
nombreImage='Test01.bmp';
[I,Z,Ietiq,N]=estandarizar([ruta nombreImage]);

nombreArchivoKnn='KNN.mat';
rutaLDA='..\02_Arandela_Tuerca_LDA\DatosGenerados\';
nombreArchivo_LDA='LDA.mat';
rutaKNN_QDA='..\03_Alcayata_TornilloRosca_TornilloCabHex_KNN_QDA\DatosGenerados\';


for i=1:N
        euler=Z(i,end);
       if euler==0
           load([rutaLDA nombreArchivo_LDA])
           Xi=Z(i,espacioCCas);
           x1=Xi(1);  x2=Xi(2);  x3=Xi(3);
           valor1=eval(d12);
           if valor1 > 0
               r=['Arandela'];
           else
               r=['Tuerca'];
           end
       else
          K=5;
          load([rutaKNN_QDA 'KNN.mat']);
          Xi=Z(i,espacioCCas);
          valoresC=unique(YoI);
          Yi=funcion_knn(XoI,YoI,Xi,K);
          pos=find(valoresC==Yi);
          if pos==3
               r=['Alcayata'];
          elseif pos==4
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
 
    if euler==0
    load([rutaLDA nombreArchivo_LDA])
    else 
      load([rutaKNN_QDA 'KNN.mat']);  
    end
    subplot(1,2,2),
    funcion_representa_datos(XoI,YoI,1:3,nombresProblemaOI);
    hold on
    Xi=Z(i,espacioCCas);
    x1=Xi(1); x2=Xi(2); x3=Xi(3);
    plot3(x1,x2,x3,'*k'), hold on
    if euler==0
    funcion_representa_hiperplano_separacion_2_3_Dim(coef,XoI), hold on
    end
end