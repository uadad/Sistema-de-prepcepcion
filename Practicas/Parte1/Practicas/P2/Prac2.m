    %%%%% Apuntes de clase %%%%%%%%%%
   addpath('Funciones')

    Ic = imread("P1_1.jpg");
    Icd=double(Ic);
    I = (Icd(:,:,1)+Icd(:,:,2)+Icd(:,:,3))/3;
    Ib = I < 100;  
    imshow(Ib)

    figure, imhist(uint8(I))
    umbral = 100;
    Ib = I <= 100;
    color=[255,255,0]; flagRepresenta = true;
    funcion_visualiza(I,Ib,color,flagRepresenta);

 % generar en rojo los pixeles entre 100 y 200
    % primero generamos la imagen de intensidad I ( escala de grises)
     Ic = imread("P1_1.jpg");
     Icd=double(Ic);
     I = (Icd(:,:,1)+Icd(:,:,2)+Icd(:,:,3))/3;
     imshow(uint8(I));

     % generar en rojo los pixeles entre 100 y 200
        Ib = I > 100 & I < 200;
        color = [255,0,0];
        Io=funcion_visualiza(Ic,Ib,color)

        % generar una magen de los pixeles cuya intensidad menor de 75 en color verde y
        % mayor q 150 en azul
        Ib= I < 75;
        color = [0,255,0];
        Io1=funcion_visualiza(Ic,Ib,color);

        Ib= I > 150;
        color=[0,0,255];
        funcion_visualiza(Io1,Ib,color,true)


         %%%%%%%% Ejercico Calcular el Area de circulo : numero de pixeles
       
        I= imread("Circulo.jpg")
        Ib= I < 100; figure,imshow(Ib) 
        area=sum(Ib(:));
        funcion_visualiza(I,Ib,[0,255,255],true)
        title([' El numero de pixeles del circulo es : ' num2str(area)])  % convertir en numnero un string
        
        %%Calcular centroide de circulo: numero de pixeles
        
        I = 5*rand(3,3);
        Ib=I<3;        
        %Calculo del centroide
        [f, c] = find(Ib);
        xc = mean(c(:));
        yc = mean(f(:));
        
        color = [255, 255, 0];
        funcion_visualiza(I, Ib, color, true);
        hold on

        %calcular el centroide
        %opcion 1
        color = [255, 255, 0];
        Io = funcion_visualiza(I, Ib, color);
        Io(round(yc)-5:round(yc)+5,round(xc)-5:round(xc)+5,:)= 0; %0 para el color negro y 5 pa pintyar mas grnade l centroide
        
        %opcion 2  
        color = [255, 255, 0];
        Io = funcion_visualiza(I, Ib, color, true);
        hold on
        plot(yc, xc, '*r')

        %Ejercicio: calcualr el centroide de cada Objeto X de la imagen
        numObj = max(Ietiq(:));  % cada X tiene un valor de izq a drch y de arriba va abajo (1,2....10)
        for i=1:numObj

            Ibi=Ietiq==i;  % cada objeto X todos sus pixeles a 1
            area_i=sum(Ib(:));  
            % calcular el centroide
            [f,c]=find(Ibi(:));
            xc = mean(c(:)) ; yc= mean(f(:));
            funcion_visualiza(I, Ibi, [0 255 255], true)
            hold on
            plot(yc, xc, '*r')
            title(['El numero de pixeles del objeto de la etiqueta' num2str(i) 'es: ' num2str(sum(Ibi(:)))])
        end

        %vecindad tipo 8
        f=3; c=2;
        v8=I(f-1:f+1, c-1:c+1) %Establece los pixeles de conectividad 8
        Ib = v8>0
        v8(Ib)   % para obtener los valores

        %vecindad tipo 4
        f=3; c=2;
        v4=[I(f, c-1:2:c+1) I(f-1:2:f+1,c)'] %Establece los pixeles de conectividad 4 si pner el pixel del centro por eso va de 2 en dos
        v4IO=v4(V4>0)


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%                                   EJERCICOS
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
         %% Ejercico 1
         clear, clc
      I=imread("ImagenBinaria.tif");

        figure, imshow(I), imtool(I)

  %% Ejercico 2
  clc,close
  Ib= I>0;
  %% Ejercico 3

   addpath('Funciones');
   [Ietiq,numObj]=funcion_etiquetar(Ib);
   colores=round(255*rand(numObj,3));
   Icolor=uint8(Ib);  %falla la funcion visualiza sino pones el uint8 ya que es binaria
   for i=1:numObj
        Io= Ietiq==i;
        color=colores(i,:);
        Icolor=funcion_visualiza(Icolor, Io,color);

   end 
   figure,imshow(Icolor);
   rmpath('Funciones');

   Io=bwlabel(Ib);
   
   a=[0 1 1 0 1 1 0; 0 1 1 0 1 1 0; 0 1 1 1 1 1 0]


  %% Ejercico 4
  Areas=funcion_calcula_area(Ietiq,numObj);
  Centroides=funcion_calcula_centroides(Ietiq,numObj);
  [AreaOrd, index]=sort(Areas,'descend'); %devulve posiciones donde estaban los valores
  indicesOI=index(1);
  CIo=Centroides(indicesOI,:);
  imshow(I), hold on
  plot(CIo(:,1),CIo(:,2),'*r'), hold on
  indicesOI=index(end);
  CIo=Centroides(indicesOI,:);
  plot(CIo(:,1),CIo(:,2),'*g')


   %%Ejercico 5

   Areas=funcion_calcula_area(Ietiq,numObj);
   Aord=sort(Areas,'descend');
   numPix=Aord(2);
   IbFilt=funcion_filtra_Objetos(Ib,numPix);
  
   close all,
   figure, imshow(IbFilt)

   Ibfilt=bwareaopen(Ib,numPix);
   imshow(Ibfilt)

   % Ibfilt es lo mismo bwareaopen
   % Ietiq es igual que bwlabel
   stats=regionprops(Ietiq,'Area','Centroid'). % stats tiene 
   areas=cat(1,stats.Area);
   centroides=cat(1,stats.Centroid);

















