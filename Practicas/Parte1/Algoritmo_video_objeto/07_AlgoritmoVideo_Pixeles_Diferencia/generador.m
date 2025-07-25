clc, clear, close all

video=VideoReader('../01_Generación de material/MaterialGenerado/Video.avi');
save('Variables Requeridas\video.avi',"video");

load('../04_AjusteClasificador_ImgCalib/VariablesGeneradas/parametros_clasificador.mat');

save('Variables Requeridas\parametros_clasificador.mat','datosMultiplesEsferas_clasificador','numPix');

addpath('Funciones\')
nf=video.NumFrames;

salida=VideoWriter('Video_Salida.avi');
salida.FrameRate=video.FrameRate;

I_ant=video.readFrame;

umbral=20;
open(salida)
for i=1:nf-1
    I=video.readFrame;
    
    Ib=calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas_clasificador);
    %Io=bwareaopen(Ib,numPix);
    
 
   Io1=funcion_visualiza(I,Ib,[255 0 0]);

    I_dif=uint8((double(I(:,:,1))+double(I(:,:,2))+double(I(:,:,3))/3));
    I_ant_dif=uint8((double(I_ant(:,:,1))+double(I_ant(:,:,2))+double(I_ant(:,:,3))/3));
    Img_dif=imabsdiff(I_ant_dif,I_dif);
    Ib_dif=Img_dif>umbral;

   Io2=funcion_visualiza(Io1,Ib_dif,[255 255 0]);
 
    Ib3=Ib & Ib_dif;
    I_salida=funcion_visualiza(Io2,Ib3,[0 0 255]);
    writeVideo(salida,I_salida);
   Iant=I;
end 
close(salida);






clc, clear
video=VideoReader("Video_Salida.avi");
numFrames=video.NumFrames;
for i=1:numFrames
    I=readFrame(video);
    imshow(I)
end
