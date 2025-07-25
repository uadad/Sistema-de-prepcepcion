
% Ejercico 1
info=imfinfo("P1_1.jpg")
% profundidad=24, altura=338, anchura=500 , tipo: jpg
info.BitDepth, info.Width, info.Height, info.Format

% Ejercico 2
Imagen1=imread("P1_1.jpg")

% Ejercico 3
imtool(Imagen1)
figure
imshow(Imagen1)

% Ejercico 4
whos Imagen1  %tipo: uint8 , rango: 0:255

% Ejercico 5   
 max(Imagen1(:))   % max= 255

 % Ejercico 6
 %% otra solucion: Imagen2=255-Imagen1
 %calculamos la matriz co,mplementaria de cada matriz RGB y la concatenamos
 Imagen21=255-Imagen1(:,:,1)  % si hubiera otra operacion hay q meter casting double pero como sabemos q el rango no va a salir de 0-255 no lo hacemos
 Imagen22=255-Imagen1(:,:,2)
 Imagen23=255-Imagen1(:,:,3)

 [nF nC nComp]=size(Imagen1);

 Imagen2=uint8(zeros(nF,nC,nComp))  %creamos una matriz tridimenmsional y concatenamos
 Imagen2(:,:,1) = Imagen21, Imagen2(:,:,2) = Imagen22, Imagen2(:,:,3) = Imagen23
 %o   
 Imagen2 = cat(3,Imagen21,imagen22,imagen23)
 figure, imshow(Imagen2)

 imwrite(Imagen2,"P1_2.jpg")

 % Ejercico 7
 Imagen3= Imagen1(:,:,1)
 figure, imshow(Imagen3)  % como es una unica matriz matlab la genera en niveles gris entre blanco y negro, ya si se la añade las otras dos matrices se genera los colores

 % Ejercico 8

 Imagen4=imadjust(Imagen1,[],[],0.5)
 Imagen5=imadjust(Imagen1,[],[],1.5)
 
 imshow(Imagen4), imshow(Imagen5)
 imhist(Imagen4), imhist(Imagen5)
 % Ejercico 9
 Imagen6=imabsdiff(Imagen5,Imagen4)
 figure, imshow(Imagen6)

 Imagen61=double(Imagen4-Imagen5)
 Imagen7=abs(Imagen61)
  figure, imshow(uint8(Imagen7))
  
   addpath("Funciones")
   R=funcion_compara_matrices(Imagen6,Imagen61)

   rmpath("Funciones")

   % Ejercico 10
   addpath("Funciones")
   h=funcion_histograma(Imagen1)
   h2=imhist(Imagen1)
   R=funcion_compara_matrices(h,h2)
   rmpath("Funciones")
   

 
