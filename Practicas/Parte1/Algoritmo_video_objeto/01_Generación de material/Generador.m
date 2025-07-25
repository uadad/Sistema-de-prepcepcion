
clc,clear
clear 
video=videoinput('winvideo',1,'YUY2_320x240'); % 
video.ReturnedColorSpace = 'rgb'; 
video.TriggerRepeat=inf; % disparos continuados 
% Se debe trabajar entorno a 10 fps 
fpsMaximoWebCam = 15; % Decidir los fps de trabajo de la WebCam 
video.FrameGrabInterval=2;  
fpsTrabajoWebCam = round(fpsMaximoWebCam/video.FrameGrabInterval); 
set(video, 'LoggingMode', 'memory')

addpath('MaterialGenerado');
aviobj=VideoWriter("MaterialGenerado/Video.avi");

aviobj.FrameRate = fpsTrabajoWebCam;  
duracionGrabacion = 15; % duracion en segundos 
numFramesGrabacion = duracionGrabacion*aviobj.FrameRate; 
open(aviobj); 
start(video)

for i=1:numFramesGrabacion 
preview(video)
I=getdata(video,1); % captura un frame guardado en memoria.   
writeVideo(aviobj,I); 
end 
stop(video) 
close(aviobj); 

%%%% capturar las imagenes

start(video)

numImg=5;
imagenes=uint8(zeros(240,320,3,numImg));
for i=1:numImg
    preview(video)
    disp('pause')
    pause
    I=getsnapshot(video);
    imagenes(:,:,:,i)=I;
end
stop(video)

for i=1:numImg
   I=imagenes(:,:,:,i);
    imshow(I)
    pause
end

save("./MaterialGenerado/ImagenesEntrenamiento_Calibracion.mat","imagenes")

aviobjI=VideoReader("MaterialGenerado/Video.avi");
numFrame=aviobjI.Duration*aviobjI.FrameRate;
for i=1:numFrame
    I=readFrame(aviobjI);
    imshow(I)
end
