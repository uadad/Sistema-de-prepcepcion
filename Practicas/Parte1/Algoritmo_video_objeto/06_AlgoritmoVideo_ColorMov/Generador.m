clc, clear, close all

video=VideoReader('../01_Generación de material/MaterialGenerado/Video.avi');
save('VariablesRequeridas\video.avi',"video");

load('../04_AjusteClasificador_ImgCalib/VariablesGeneradas/parametros_clasificador.mat');

save('VariablesRequeridas\parametros_clasificador.mat','datosMultiplesEsferas_clasificador','numPix');

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
    
 [Ietiq N]=bwlabel(Ib);
 if N>0
   stats=regionprops(Ietiq,'Centroid');
   centroides=cat(1,stats.Centroid);

   xc=centroides(:,2);
   yc=centroides(:,1);

   W=3;
   vmin=floor(W/2)+1;
   vmax=size(I,1)-floor(W/2);
   vmax2=size(I,2)-floor(W/2);
   pos=find(xc<vmin | xc>vmax);
   xc(pos)=[];
   yc(pos)=[];
   pos=find(yc<vmin | yc>vmax2);
   xc(pos)=[];
   yc(pos)=[];

       for j=1:size(xc,1)
           indx1=round(xc(j))-floor(W/2):round(xc(j))+floor(W/2);
           indy1=round(yc(j))-floor(W/2):round(yc(j))+floor(W/2);
           I(indx1,indy1,1:2)=0;
           I(indx1,indy1,3)=255;
       end  
 end

    I_dif=uint8((double(I(:,:,1))+double(I(:,:,2))+double(I(:,:,3))/3));
    I_ant_dif=uint8((double(I_ant(:,:,1))+double(I_ant(:,:,2))+double(I_ant(:,:,3))/3));
    Img_dif=imabsdiff(I_ant_dif,I_dif);
    Ib_dif=Img_dif>umbral;

    [Idif_etiq N]=bwlabel(Ib_dif);
 if N>0
    stats=regionprops(Idif_etiq,'Centroid');
    centroides2=cat(1,stats.Centroid);
   W=3;
   vmin=floor(W/2)+1;
   vmax=size(I,1)-floor(W/2);
   vmax2=size(I,2)-floor(W/2);
   pos=find(centroides2(:,2)<vmin | centroides2(:,2)>vmax);
   centroides2(pos,:)=[];
   pos=find(centroides2(:,1)<vmin | centroides2(:,1)>vmax2);
   centroides2(pos,:)=[];
   xc2=centroides2(:,2);
   yc2=centroides2(:,1);
   for j=1:size(yc2,1)
           indx1=round(xc2(j))-floor(W/2):round(xc2(j))+floor(W/2);
           indy1=round(yc2(j))-floor(W/2):round(yc2(j))+floor(W/2);
           I(indx1,indy1,1:2)=255;
           I(indx1,indy1,3)=0;    
   end  
 end
    writeVideo(salida,I);
   Iant=I;
end 
close(salida);