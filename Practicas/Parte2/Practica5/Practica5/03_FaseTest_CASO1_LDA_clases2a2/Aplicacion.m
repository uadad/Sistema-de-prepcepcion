
clc, clear, close all

addpath('..\Funciones\');
ruta='../ImagenesPractica5/Test/';
nombreImage='Test1.JPG';
[I,Z,Ietiq,N]=estandarizar([ruta nombreImage]);

rutaCircCuad='..\02_FaseEntrenamiento_CASO1_LDA_clases2a2\Circulo-Cuadrado\DatosGenerados\';
rutaCircTrian='..\02_FaseEntrenamiento_CASO1_LDA_clases2a2\Circulo-Triangulo\DatosGenerados\';
rutaCuadTrian='..\02_FaseEntrenamiento_CASO1_LDA_clases2a2\Cuadrado-Triangulo\DatosGenerados\';
nombreArchivo='LDA.mat';

for i=1:N
    % circulo - cuadrado
    load([rutaCircCuad nombreArchivo])
    Xi=Z(i,espacioCCas);
    x1=Xi(1);  x2=Xi(2);  x3=Xi(3);
    valorCircCuad=eval(d12);
% circulo - triangulo
    load([rutaCircTrian nombreArchivo])
    Xi=Z(i,espacioCCas);
    x1=Xi(1);  x2=Xi(2);  x3=Xi(3);
    valorCircTrian=eval(d12);
% Cuadrado - triangulo
    load([rutaCuadTrian nombreArchivo])
    Xi=Z(i,espacioCCas);
    x1=Xi(1);  x2=Xi(2);  x3=Xi(3);
    valorCuadTrian=eval(d12);

    if valorCuadTrian>0 & valorCircCuad<0
        r='Objeto Cuadrado.';
    elseif valorCircTrian>0 & valorCircCuad>0
            r='Objeto Circular';
    else
        r='Objeto Triangular';
    end

    figure,
    Ib=Ietiq==i;
    subplot(2,2,1),
    Io=funcion_visualiza(I,Ib,[0 255 255],false);
    imshow(Io)
    title(r)

    subplot(2,2,2)
    load([rutaCircCuad nombreArchivo])
    funcion_representa_datos(XoI,YoI,1:3,nombresProblemaOI);
    hold on,
    funcion_representa_hiperplano_separacion_2_3_Dim(coeficente,XoI);
    Xi=Z(i,espacioCCas);
    x1=Xi(1);  x2=Xi(2);  x3=Xi(3);
    plot3(x1,x2,x3,'*y')

    subplot(2,2,3)
    load([rutaCircTrian nombreArchivo])
    funcion_representa_datos(XoI,YoI,1:3,nombresProblemaOI);
    hold on,
    funcion_representa_hiperplano_separacion_2_3_Dim(coeficente,XoI);
    Xi=Z(i,espacioCCas);
    x1=Xi(1);  x2=Xi(2);  x3=Xi(3);
    plot3(x1,x2,x3,'*y')

    subplot(2,2,4)
    load([rutaCuadTrian nombreArchivo])
    funcion_representa_datos(XoI,YoI,1:3,nombresProblemaOI);
    hold on,
    funcion_representa_hiperplano_separacion_2_3_Dim(coeficente,XoI);
    Xi=Z(i,espacioCCas);
    x1=Xi(1);  x2=Xi(2);  x3=Xi(3);
    plot3(x1,x2,x3,'*y')
end