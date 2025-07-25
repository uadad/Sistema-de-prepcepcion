%% Ejercicio 2 - apartado Extracción de datos- Representacion de datos
clc,clear

I=imread('VariablesRequeridas\ImTrain.jpg');

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

ROI=roipoly(I);
DatosColor=[(1)*ones(sum(ROI(:)),1) R(ROI) G(ROI) B(ROI)];

ROI=roipoly(I);
DatosColor=[DatosColor; (2)*ones(sum(ROI(:)),1) R(ROI) G(ROI) B(ROI)];


ROI=roipoly(I);
DatosFondo=[(1)*ones(sum(ROI(:)),1) R(ROI) G(ROI) B(ROI)];


X=[DatosColor(:,2:4); DatosFondo(:,2:4)];

Y=[ones(size(DatosColor,1),1); zeros(size(DatosFondo,1),1)];


save('conjunto_datos_original.mat','X','Y');

%%Ejercico2

valoresY=unique(Y);

XColor=X(Y==valoresY(2),:);

x3=XColor(:,3);

xOrd3=sort(x3);
numValoresA=length(x3);

vMaxAceptado=120;
outliers= X(:,1) < vMaxAceptado;

outliers= outliers & Y==1;  % coge los q estan en color de seguimiento
posOutliersA=find(outliers);

posOutliers=unique(posOutliersA);


X(posOutliers,:)=[];
Y(posOutliers)=[];


save('conjunto_datos.mat','X','Y');


%%Ejercico3

clc, clear
%representacion 1:
load('conjunto_datos_original.mat');
XColor=X(Y==1,:);
OtrosColor=X(Y==0,:);
plot3(XColor(:,2),XColor(:,2),XColor(:,3),'*b'), hold on

plot3(OtrosColor(:,1),OtrosColor(:,2),OtrosColor(:,3),'*r')

axis([0 255 0 255 0 255])

legend('Datos Color','Datos Fondo')


%representacion 2:
clc, clear
load('conjunto_datos.mat');
XColor=X(Y==1,:);
OtrosColor=X(Y==0,:);
plot3(XColor(:,2),XColor(:,2),XColor(:,3),'*b'), hold on

plot3(OtrosColor(:,1),OtrosColor(:,2),OtrosColor(:,3),'*r')

axis([0 255 0 255 0 255])

legend('Datos Color','Datos Fondo')
