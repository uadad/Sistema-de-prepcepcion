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
open(salida);
for i=1:nf-1
       I=video.readFrame;
    
    Ib=calcula_deteccion_multiples_esferas_en_imagen(I,datosMultiplesEsferas_clasificador);
    %Io=bwareaopen(Ib,numPix);
    
 [Ietiq N]=bwlabel(Ib);
 if N>0
   stats=regionprops(Ietiq,'Area','Centroid');
   centroides=cat(1,stats.Centroid);
   areas=cat(1,stats.Area);
   
   W=3;
   vmin=floor(W/2)+1;
   vmax=size(I,1)-floor(W/2);
   vmax2=size(I,2)-floor(W/2);
   pos=find(centroides(:,2)<vmin | centroides(:,2)>vmax);
   centroides(pos,:)=[];
   areas(pos,:)=[];
   pos=find(centroides(:,1)<vmin | centroides(:,1)>vmax2);
   centroides(pos,:)=[];
   areas(pos,:)=[];

   [area_Ord indice]=sort(areas,'descend');
   xc=centroides(indice(1),2);
   yc=centroides(indice(1),1);
  
    I(round(xc)-floor(W/2):round(xc)+floor(W/2),round(yc)-floor(W/2):round(yc)+floor(W/2),1)=255;
    I(round(xc)-floor(W/2):round(xc)+floor(W/2),round(yc)-floor(W/2):round(yc)+floor(W/2),2:3)=0;

 end


    I_dif=uint8((double(I(:,:,1))+double(I(:,:,2))+double(I(:,:,3))/3));
    I_ant_dif=uint8((double(I_ant(:,:,1))+double(I_ant(:,:,2))+double(I_ant(:,:,3))/3));
    Img_dif=imabsdiff(I_ant_dif,I_dif);
    Ib_dif=Img_dif>0;

    [Idif_etiq N]=bwlabel(Ib_dif);
 if N>0
    stats=regionprops(Idif_etiq,'Area','Centroid');
    centroides2=cat(1,stats.Centroid);
    areas2=cat(1,stats.Area);
   W=3;
   vmin=floor(W/2)+1;
   vmax=size(I,1)-floor(W/2);
   vmax2=size(I,2)-floor(W/2);
   pos=find(centroides2(:,2)<vmin | centroides2(:,2)>vmax);
   centroides2(pos,:)=[];
   areas2(pos,:)=[];
   pos=find(centroides2(:,1)<vmin | centroides2(:,1)>vmax2);
   centroides2(pos,:)=[];
   areas2(pos,:)=[];
   
   [area_Ord indice]=sort(areas2,'descend');
   xc2=centroides2(indice(1),2);
   yc2=centroides2(indice(1),1);
  
    I(round(xc2)-floor(W/2):round(xc2)+floor(W/2),round(yc2)-floor(W/2):round(yc2)+floor(W/2),1:2)=255;
    I(round(xc2)-floor(W/2):round(xc2)+floor(W/2),round(yc2)-floor(W/2):round(yc2)+floor(W/2),3)=0;

 end
    writeVideo(salida,I);
   Iant=I;
end 
close(salida);