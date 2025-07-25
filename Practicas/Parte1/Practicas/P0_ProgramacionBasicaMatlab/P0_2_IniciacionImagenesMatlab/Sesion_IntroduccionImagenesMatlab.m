% GUARDA EN LA VARIABLE I1, UNA MATRIZ DE 40 FILAS Y 80 COLUMNAS
% CON N�MEROS ALEATORIOS ENTEROS ENTRE 0 Y 255, TIPO UINT8 

I1 = uint8(255*rand(40,80))

% MUESTRA LA INFORMACI�N COMO UNA IMAGEN
imshow(I1)

I11 = I1/255; % matriz normalizada entre 0-1
figure, imshow(I11)

I111 = double(I1)/255;
figure, imshow(I111)


% GUARDA EN LA VARIABLE I2, TRES MATRICES DE 40 FILAS Y 80 COLUMNAS 
% CON N�MEROS ALEATORIOS ENTEROS
% ENTRE 0 Y 255, TIPO UINT8 
I2 = uint8(255*rand(40,80,3));

% MUESTRA LA INFORMACI�N COMO UNA IMAGEN
figure, imshow(I2)


clear, clc, close all

% Leer imagenes
I=imread('X.jpg'); % Imagen en escala de grises - ver variable en workspace
Ic = imread('P1_1.jpg'); % Imagen en color

% GUARDA EN VARIABLES LA DIMENSION DE LAS VARIABLES I, Ic



[NumFilas NumColumnas NumComp] = size (I);
[NumFilas NumColumnas NumComp] = size (Ic);

% Visualizar variables
imshow(I),figure,imshow(Ic)
imtool(I),imtool(Ic) % inspect pixel values y coordenadas

% Acceder al valor de intensidad de coordenadas
close all, imshow(Ic) % MARCAR CUALQUIER PUNTO PARA VER SU INFORMACI�N
I(3,5) % Fila 3, columna 5
Ic(3,5) % Comprobar que solo hay un valor, �que representa ese valor?

Ic(3,5,1) % componente roja
Ic(3,5,2) % componente verde
Ic(3,5,3) % componente azul

% Con imtool(I), obtenemos Pixel info: (141,200) 147
I(200,141)

% Modificar valores

% Poner rectangulo blanco en imagen intensidad





Imod = I;
Imod(100:150,200:400) = 255; 
imshow(I),figure,imshow(Imod)
close all;

% Poner rectangulo azul en imagen color
Ic_mod = Ic;
Ic_mod(100:150,200:400,1:2) = 0;
Ic_mod(100:150,200:400,3) = 255;
imshow(Ic),figure, imshow(Ic_mod)

% Seleccionar una componente de color
Ir = Ic(:,:,1);
Ig = Ic(:,:,2);
Ib = Ic(:,:,3);
imshow(Ic),figure,imshow(Ir),figure,imshow(Ig),figure,imshow(Ib)
close all;


% Operando con imagenes
I(200,300) % Valor 151

% Guarda en una variable el valor de intensidad de ese pixel +10
A = I(200,300) + 10

% Guarda en otra variable el valor de intensidad de ese pixel +105
B = I(200,300) + 105

% �Que observas?

% IMPORTANTE: ANTES DE OPERAR CON VALORES DE IMAGENES HAY QUE HACER UNA
% CONVERSION DEL FORMATO DE LOS DATOS - DE UINT8 A DOUBLE

I = double (I);
B = I(200,300) + 105


% Histogramas
I=imread('X.jpg'); % Imagen en escala de grises - ver variable en workspace

imtool(I)

% �C�antos p�xeles hay con nivel de gris 50 ?

ng = 50;
pOI = I == ng;
numPixelesNg = sum(pOI(:))


% �Cu�les son los posibles valores que puede tener un elemento de la
% matriz?

valores_posibles = 0:255;

% Representacion histograma con imhist
imshow(I), figure,imhist(I)

% Guarda en las posiciones de un vector llamado  conteoValores
% el n�mero de veces que aparece en I cada uno de sus posiles valores.
% Para ello utiliza la funci�n de matlab imhist
% Representa con stem la informaci�n de conteoValores


conteoValores = imhist(I);

% Accede al numero de pixeles que hay en I con el ng anterior 150
conteoValores(ng+1)

% Representaci�n histograma con stem

stem (valores_posibles, conteoValores, '.r'), hold on, imhist(I)



% EJEMPLO BASICO DE PROCESAMIENTO: SEGMENTAR TODOS LOS PIXELES
% PERTENECIENTES A LETRAS X EN IMAGEN I
% CREAR UNA IMAGEN BINARIA QUE LOCALICE 


[N M] = size(I);

Ibin = zeros(N,M);

for i=1:N
    for j=1:M
        if I(i,j) < 100
            Ibin(i,j) = 1;
        end
    end
end

% PROGRAMACION MAS EFICAZ: 
Ibin = I < 100; % datos tipo logico
Ibin = double(I<100); % para tenerlos tipo double como antes

% Visualiza la informacion
imshow(uint8(Ibin));

imshow(uint8(255*Ibin));

% GUARDAR LA INFORMACION
save(".\ImagenSegmentada", "I","Ibin")
imwrite(uint8(255*Ibin),'ImagenBinaria.tif');



