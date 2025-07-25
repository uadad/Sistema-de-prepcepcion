

clc, clear, close all

addpath('Funciones\')

video=VideoReader('..\01_Generación de material\MaterialGenerado\Video.avi');

save('.\VariablesRequeridas\Video_entrada.avi',"video")

load('..\04_AjusteClasificador_ImgCalib\VariablesGeneradas\parametros_clasificador.mat');

save('.\VariablesRequeridas\parametros_clasificador','datosMultiplesEsferas_clasificador','numPix')

 numFrames=video.NumFrames; 

FPS = video.FrameRate; 

aviobjO = VideoWriter('Video_salida.avi'); 
aviobjO.FrameRate = FPS; % El video tendra la misma tasa de frames 
open(aviobjO) 
aviobjI.CurrentTime=0; % Ponemos a 0
for i=1:numFrames 
   I = readFrame(video); 
   Ib=calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas_clasificador);
   Io=bwareaopen(Ib,numPix);

   [Ietiq N]=bwlabel(Io);

 if N>0
    stats=regionprops(Ietiq,'Centroid');
    centroides=cat(1,stats.Centroid);

    xc=centroides(:,2);
    yc=centroides(:,1);

    W=3;
    vmin=1+floor(W/2);
    vmax=size(I,1)-floor(W/2);

    Ibx=(xc< vmin | xc>vmax);
    xc(Ibx)=[];
    yc(Ibx)=[];

    vmax2=size(I,2)-floor(W/2);
    Iby=(yc< vmin | yc>vmax2);
    xc(Iby)=[];
    yc(Iby)=[];

    for j=1:size(xc,1)
           indx1=round(xc(j))-floor(W/2):round(xc(j))+floor(W/2);
           indy1=round(yc(j))-floor(W/2):round(yc(j))+floor(W/2);
           I(indx1,indy1,1)=255;
           I(indx1,indy1,2:3)=0;       
       end 
     end  
   writeVideo(aviobjO,I);
end 

close(aviobjO);





%{
           indx1=round(xc(i))-1;
           indx2=round(xc(i))+1;
           indy1=round(yc(i))-1;
           indy2=round(yc(i))+1;
            % por si se pasa del tamaño
           if(indx1==0) 
               indx1=1;
           end
           if(indy1==0)
               indy1=1;
           end
           if(indx2>size(I,1))
                indx2=size(I,1);
           end 
           if(indy2>size(I,2))
                indy2=size(I,2);
           end 
         I_cen(indx1:indx2,indy1:indy2) = 1; 
         %}
