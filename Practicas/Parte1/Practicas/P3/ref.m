clear all
clc

datos=imaqhwinfo('winvideo'); %

video=videoinput('winvideo',1,'YUY2_320x240'); %

video.ReturnedColorSpace='grayscale';  % en escala de gris
video.ReturnedColorSpace='rgb';  % 3n color
% CAPTURAMOS UNA IMAGEN PARA EXTRAER LA PLANTILLA

preview(video) % se abra una pantalla gráfica que muestra lo que visualiza la cámara (1fps)
I = getsnapshot(video); %hacer una foto
I=imresize(I,0.5) %disminuir la resolucion de la imagen a la mitad
% pasar de yuy  RGB
imshow(ycbcr2rgb(I));
% De forma manual 
imtool(I) % para mostrar la imagen por imtool y sacar las coordenadas de la plantilla
imtool, close all

fila1=50; fila2=75; columna1=155; columna2=180;
Plantilla=I(fila1:fila2,columna1:columna2);
imshow(Plantilla)
% De forma automatizada
% Utilizamos la instrucción roipoly para seleccionar un área de interés
% Pinchamos cuatro veces crear el polígono de interés y doble click.
roi = roipoly(I); % Matriz lógica, donde a 1 se marcan
%los píxeles de interés
[filas columnas]=find(roi==1); % Coordenadas de los pixeles que integran
% la region de interés
fila1=min(filas); fila2=max(filas);
columna1=min(columnas); columna2=max(columnas);
Plantilla=I(fila1:fila2,columna1:columna2);
imshow(Plantilla)
[NT MT]=size(Plantilla);

% Para capturar una secuencia de frames:
video.TriggerRepeat=inf; % infinito disparos 
video.FrameGrabInterval=5; % de todos los frames que se capturan, sólo se van grabando de 5 en 5.


start(video) % el dispositivo de video empieza a funcionar con la configuración almacenada en el objeto.

while (video.FramesAcquired<150) % se sale cunado se graben 150 frame
I=getdata(video,1); % captura un frame guardado en memoria. 
ncc = normxcorr2(Plantilla,I);
[Nncc Mncc]=size(ncc);
ncc=ncc(1+floor(NT/2):Nncc-floor(NT/2),1+floor(MT/2):Mncc-floor(MT/2));
[i j]=find(ncc==max(ncc(:)));
imshow(I),hold on, plot(j,i,'R*'),hold off
end
stop(video)
delete(video);
clear(video);


%% Ejercico:
% visualiza 100 frames a una tasa de 10 frames 
% por segundo donde se visualiza una marca roja (caja 5x5)
% moviendoser de forma aleatortio por la imagen

video=videoinput('winvideo',1,'YUY2_320x240');
video.FrameInetrval=3; % 10 fps
video.ReturnedColorSpace='rgb';
video.TiggerRepeat=inf;

numFrmes=100;
wh=video.Resultion; % vector indicando la imagen con la altura y la anchura
numFilas=wh(2); numColumnas=wh(1);


W=5; %ancho y alto de la caja
vMin=1+floor(W/2);

vMax=numFilas-floor(W/2);


for i=1:numFrames
    I=getdata(bideo,1);

    x=valoresX(i); y=valoresY(i);

    subplot(2,1,1), imshow(I), hold on, plot(x,y,'*r'),hold off

end 