clear, close all, clc;
% PRIMERA PARTE: Procesamiento básico de imágenes en el dominio espacial
%Determinar el brillo y el contraste de la imagen “P4.jpg”.

%para calcular esto primeo las imagenes tiene que estar en esaclas de rises

Imagen = imread("P4.jpg");
%calcular brillo de una imagen
%brillo = valor medio de la intensidad de los pixeles d euna imagen
%para buscar en toda la imagen convertimos la matriz en un vector columna con'(:)'

brillo=mean(Imagen(:));

%calcular contraste de una imagen
%contraste = a la diferencia entre la intensidad maxima y minima de los
%pixeles de una imagen

intensidad_maxima = max(Imagen(:));
intensidad_minima = min(Imagen(:));
contraste = intensidad_maxima-intensidad_minima;

%Genere nuevas imágenes de mayor y menor brillo que la original y mida, para cada
%imagen generada, el nuevo valor de brillo
%% desplazamiento
Imagen_mas_brillo = Imagen+50;
Imagen_menos_brillo = Imagen-50;

figure; hold on;
subplot(1,3,1)
imshow(Imagen);
subplot(1,3,2);
imshow(Imagen_mas_brillo);
subplot(1,3,3);
imshow(Imagen_menos_brillo);
%% CONTRACCIÓN Y EXPANSIÓN DEL HISTOGRAMA
% Obtener los valores mínimo y máximo de la imagen
pMIN = double(min(Imagen(:)));
pMAX = double(max(Imagen(:)));

% Definir los valores mínimo y máximo deseados para la imagen transformada
qMIN = 0;
qMAX = 255;

% Calcular el factor de escala
m = (qMAX - qMIN) / (pMAX - pMIN);

% Calcular la imagen transformada
img_transformada = qMIN + m * (double(Imagen) - pMIN) ;

imagen_mayor_contraste = uint8(img_transformada);
%%%menor contraste
qMIN = 50;
qMAX = 200;
m = (qMAX - qMIN) / (pMAX - pMIN);
img_transformada = qMIN + m * (double(Imagen) - pMIN) ;
imagen_menor_contraste = uint8(img_transformada);

imhist(Imagen)
imhist(imagen_mayor_contraste)

subplot(1,3,1)
imshow(Imagen);
subplot(1,3,2);
imshow(imagen_mayor_contraste);
subplot(1,3,3);
imshow(imagen_menor_contraste);


hist = imhist(Imagen);
maxi = max(Imagen(:));
mini = min(Imagen(:));

nuevo_minimo = (maximo+mini) / 2 - (maxi - mini) / 4;
nuevo_maximo = (maxi + mini) / 2 + (maxi - mini) / 4;

factor_escala = (nuevo_maximo - nuevo_minimo) / (maximo - minimo);
factor_desplazamiento = nuevo_minimo - minimo * factor_escala;
imagen_expandida = imadjust(imagen, [minimo; maximo], [factor_desplazamiento; factor_desplazamiento + factor_escala*(maximo - minimo)]);





