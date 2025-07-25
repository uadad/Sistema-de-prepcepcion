clear 
addpath('Funciones')

% Lectura de imagenes y extraccion de datos

ruta = '../01_Generación de material/MaterialGenerado/';

%leemos imagenes de calibracion

load([ruta 'ImagenesEntrenamiento_Calibracion.mat']);

[N, M, NumComp, NumImg]= size(imagenes);

%vemos las imasgenes y seleccionamos las regiones de los pixeles del objeto
DatosColor=[];
for i=2:NumImg
    I=imagenes(:,:,:,i);
    R=I(:,:,1,:);
    G=I(:,:,2,:);
    B=I(:,:,3,:);
    ROI=roipoly(I)
    DatosColor=[DatosColor; (i-1)*ones(sum(ROI(:)),1) R(ROI) G(ROI) B(ROI)];
end

%vemos las imasgenes y seleccionamos las regiones de los pixeles del fondo
DatosFondo=[];
for i=1:NumImg
    I=imagenes(:,:,:,i);
    R=I(:,:,1,:);
    G=I(:,:,2,:);
    B=I(:,:,3,:);
    ROI=roipoly(I)
    DatosFondo=[DatosFondo; (i)*ones(sum(ROI(:)),1) R(ROI) G(ROI) B(ROI)];
end


% Genracion de X y Y

X=[DatosColor(:,2:4); DatosFondo(:,2:4)];

Y=[ones(size(DatosColor,1),1); zeros(size(DatosFondo,1),1)];

save('.\VariableGeneradas\Datos_Generados_Original','X','Y')


% Representacion
load("./VariableGeneradas/Datos_Generados.mat")

  representa_datos_color_seguimiento_fondo(X,Y);

  %%% calcular los outliers de los datos de color de seguimiento
  posClaseInteres= 2;    % se refiere a la posicion de los datos unicos de Y en este caso son datos color
  pos_outliers=funcion_detecta_outliers_clase_interes(X,Y,posClaseInteres); % devulve las posiciones de los outliers 
  
  %%% Eliminacion de los pixeles que estan fuera del rango y representacion
  X(pos_outliers,:)=[];
  Y(pos_outliers)=[];
  
  save('.\VariableGeneradas\Datos_Generados','X','Y')
  representa_datos_color_seguimiento_fondo(X,Y);
  

  %%% otra posible solucion es con desviacion tipica sin calcular el rango.
  m=mean(x);
  desv=std(x);
  vMinAceptada=m-2.7*desv;
  vMaxAceptado=m+2.7*desv;
  outliers= X(:,2) < vMinAceptada | X(:,2)>vMaxAceptado

  outliers= outliers & Y==1;
  filas_outilers=find(outliers) % las posiciones de x donde hay un outliers

  
