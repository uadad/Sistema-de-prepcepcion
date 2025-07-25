
   %%%%%%%%%%%% Estructura Basica %%%%%%%%%%%%%%%%%%%%%%%%%%
clear all, clear, clc

video=videoinput('winvideo',1,'YUY2_320x240'); 

video.ReturnedColorSpace = 'rgb'; %Ejercico 3
%%%%%%%%%%%%%%%% = 'grayscale' %Rersto de ejercicos

video.TriggerRepeat=inf; % disparos continuos

video.FrameGrabInterval=2; % Valor necesario para fps entre 5 y 10, mejor 10
                           %Mirar fps maximo con preview


                          % ......
                           %%%%%%%%%%%%%%%%%%%%%
                           start(video)
                          %....

                           numFrames=...;

                           for i=1:numFrames  % TAMBIEN while(video.FrameAcquired<numFrames)
                           I=getdata(video,1); %captura un frame guardado en mnemoria
                           I=imresize(I,0,5);   % solo capturando 640x480
                           % PROCESO IMAGEN
                           % VISUALIZA IMAGEN
                           end
     stop(video)



   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Ejercicos

   % Ejercico 1
clear all, clear, clc

video=videoinput('winvideo',1,'YUY2_320x240'); 

video.ReturnedColorSpace = 'rgb'; 

video.TriggerRepeat=inf; 

video.FrameGrabInterval=3;

start(video)

umbral=[70 140 210];
captura=getdata(video,1);

I=(double(captura(:,:,1))+double(captura(:,:,2))+double(captura(:,:,1)))/3;

subplot(2,2,1), imshow(captura);

for i=1:3
    Io=I>umbral(i);
    subplot(2,2,i+1), imshow(Io)
end

stop(video)

%Ejercico 2

clear all, clear, clc
addpath('Funciones')

video=videoinput('winvideo',1,'YUY2_320x240'); 

video.ReturnedColorSpace = 'rgb'; 

video.TriggerRepeat=inf; 

video.FrameGrabInterval=3;

start(video)
preview(video)

umbral=[70 140 210];
captura=getdata(video,1);

I=(double(captura(:,:,1))+double(captura(:,:,2))+double(captura(:,:,1)))/3;

for i=1:3
    Io=I>umbral(i);
    [Ietiq numObj]=bwlabel(Io);
    state=regionprops(Ietiq,'Area','Centroid');
    areas=cat(1,state.Area);
    centroides=cat(1,state.Centroid);
    
    [area_Ord indiceA]=sort(areas,'descend');
    FiltraO=bwareaopen(Io,area_Ord(5));

    funcion_visualiza(captura,FiltraO,[255 255 0],true)

    centroides_Ord=centroides(indiceA(1:5),:);
    for i=2:5
          hold on, plot(centroides_Ord(i,1),centroides_Ord(i,2),'G*')
    end
    hold on, plot(centroides_Ord(1,1),centroides_Ord(1,2),'R*')
end

stop(video)


%Ejercico3

      clear all, clear, clc

video=videoinput('winvideo',1,'YUY2_320x240'); 

video.ReturnedColorSpace = 'rgb';

video.TriggerRepeat=inf; % disparos continuos

video.FrameGrabInterval=3; % Valor necesario para fps entre 5 y 10, mejor 10
                           %Mirar fps maximo con preview
  start(video)
  gamma=4:-0.05:0;    % de oscuro a claro si fuera al reves de claro a oscuro  de 0 a 4
  numFrames=length(gamma);

                           for i=1:numFrames  % TAMBIEN while(video.FrameAcquired<numFrames)
                           I=getdata(video,1); %captura un frame guardado en mnemoria
                           % PROCESO IMAGEN
                           I=imadjust(I,[],[],gamma(i));
                           % VISUALIZA IMAGEN
                           imshow(I)
                           end
     stop(video)


     %Ejercico4
clear all, clear, clc

video=videoinput('winvideo',1,'YUY2_320x240'); 

video.ReturnedColorSpace = 'grayscale'; 

video.TriggerRepeat=inf; % disparos continuos

video.FrameGrabInterval=2; % Valor necesario para fps entre 5 y 10, mejor 10
                           %Mirar fps maximo con preview


                          % ......
                           %%%%%%%%%%%%%%%%%%%%%
                           start(video)
                          %....
                          umbral=0:255;
                           numFrames=length(umbral);

                           for i=1:numFrames  % TAMBIEN while(video.FramesAcquired<numFrames)
                           I=getdata(video,1); %captura un frame guardado en mnemoria
                           Ib=(I > umbral(i));
                           funcion_visualiza(I,Ib,[255 0 0],true);
                           end
     stop(video)


     %Ejercico5.1

      clear all, clear, clc

video=videoinput('winvideo',1,'YUY2_320x240'); 

video.ReturnedColorSpace = 'rgb';

video.TriggerRepeat=inf; % disparos continuos

video.FrameGrabInterval=3; % Valor necesario para fps entre 5 y 10, mejor 10
                           %Mirar fps maximo con preview
  start(video)
  frame_ant= getdata(video,1);
  frame_ant=uint8((double(frame_ant(:,:,1))+double(frame_ant(:,:,2))+double(frame_ant(:,:,3)))/3);
  while(video.FramesAcquired<100)
     frame=getdata(video,1);
     frame=uint8((double(frame(:,:,1))+double(frame(:,:,2))+double(frame(:,:,3)))/3);
     I=imabsdiff(frame_ant,frame);
     frame_ant=frame;
     imshow(I)
  end
  stop(video)
      

  %Ejercico5.2

      clear all, clear, clc

video=videoinput('winvideo',1,'YUY2_320x240'); 

video.ReturnedColorSpace = 'rgb';

video.TriggerRepeat=inf; % disparos continuos

video.FrameGrabInterval=3; % Valor necesario para fps entre 5 y 10, mejor 10
                         %Mirar fps maximo con preview
  start(video)
  umbral=100;  
  frame_ant= getdata(video,1);
  frame_ant=uint8((double(frame_ant(:,:,1))+double(frame_ant(:,:,2))+double(frame_ant(:,:,3)))/3);
  while(video.FramesAcquired<100)
     frame=getdata(video,1);
     frame=uint8((double(frame(:,:,1))+double(frame(:,:,2))+double(frame(:,:,3)))/3);
     Img_dif=imabsdiff(frame_ant,frame);
     Mov_sig=(Img_dif>umbral);
     frame_ant=frame;
     subplot(1,3,1),imshow(frame);
     subplot(1,3,2),imshow(Img_dif);
     subplot(1,3,3),imshow(uint8(Mov_sig));
  end
  stop(video)



  % Ejercico 5.3  el objeto de mayor pixel A rojo


  clear all, clear, clc

video=videoinput('winvideo',1,'YUY2_320x240'); 

video.ReturnedColorSpace = 'rgb';

video.TriggerRepeat=inf; % disparos continuos

video.FrameGrabInterval=3; % Valor necesario para fps entre 5 y 10, mejor 10
                         %Mirar fps maximo con preview
  start(video)
  umbral=100;  
  frame_ant= getdata(video,1);
  frame_ant=uint8((double(frame_ant(:,:,1))+double(frame_ant(:,:,2))+double(frame_ant(:,:,3)))/3);
  while(video.FramesAcquired<100)
     frame=getdata(video,1);
     frame=uint8((double(frame(:,:,1))+double(frame(:,:,2))+double(frame(:,:,3)))/3);
     Img_dif=imabsdiff(frame_ant,frame);
     Mov_sig=(Img_dif>umbral);
     
     [Ietiq N]=bwlabel(Mov_sig);
    
     if N>0  

         stats= regionprops( Ietiq,'Area','Centroid');
          
         areas=cat(1,stats.Area); % vector columna con laas areas de cada objeto
         centroides=cat(1,stats.Centroid);

         [areas_ord indices]=sort(areas,'descend'); % maximo de area

         cord_x=centroides(indices(1),1);
         cord_y=centroides(indices(1),2);

     else
           cord_x=1;
           cord_y=1;
     end

     frame_ant=frame;
     subplot(1,2,1),imshow(frame),hold on , plot(cord_x,cord_y,'R*'), hold off;
     subplot(1,2,2),imshow(uint8(Mov_sig)),hold on , plot(cord_x,cord_y,'R*'), hold off;
  end
  stop(video)

  