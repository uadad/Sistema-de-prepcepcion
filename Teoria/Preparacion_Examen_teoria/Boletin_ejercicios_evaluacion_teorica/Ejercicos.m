%% Ejercico1 
datos_C1_x1=[1;2;2;2;2;3;3;4;5;1];
datos_C1_x2=[3;1;2;3;4;2;3;3;2;2];
Clase1=[datos_C1_x1 datos_C1_x2];

datos_C2_x1=[4;5;5;4;6;6;6;7;4;8];
datos_C2_x2=[5;5;6;7;5;6;7;6;6;7];
Clase2=[datos_C2_x1 datos_C2_x2];

m1=mean(Clase1)';
m2=mean(Clase2)';

x1=sym('x1','real');
x2=sym('x2','real');
X=[x1; x2];

d1=expand(-(X-m1)'*(X-m1));
d2=expand(-(X-m2)'*(X-m2));
d12=d1-d2;
vpa(d12,2)

p1=[0,53.75/7];
p2=[53.75/6,0]
figure, plot(datos_C1_x1,datos_C1_x2,'*r'), hold on
plot(datos_C2_x1,datos_C2_x2,'*b'), hold on
plot(p1,p2);

% es hiperplano si dij=0 que un punto ahi tiene la misma distancia euclidea desde el punto medio
% de la clase 1 y el punto medio de la clase 2


%% Ejercico2

clear, clc
c1_x1=[2;3;3;4]; c1_x2=[1;2;3;2];
c2_x1=[6;5;7]; c2_x2=[1;2;3];
C1=[c1_x1 c1_x2];
C2=[c2_x1 c2_x2];

x1=sym('x1','real');
x2=sym('x2','real');
X=[x1; x2];
m1=mean(C1)';
m2=mean(C2)';
cov1=cov(C1);
var1=((6-6)^2+(5-6)^2+(7-6)^2)/(3-1);
var2=((1-2)^2+(2-2)^2+(3-2)^2)/(3-1);
sigma1=((6-6)*(1-2)+(5-6)*(2-2)+(7-6)*(3-2))/2;
cov2=[var1 sigma1;sigma1 var2];
cov=((3*cov1)+(2*cov2))/5;
d1=expand(-(X-m1)'*pinv(cov)*(X-m1));
d2=expand(-(X-m2)'*pinv(cov)*(X-m2));

d12=d1-d2;
vpa(d12,2)

%% Ejercico 3
clc, clear

m1=[0; 3]; 
m2=[5; 2];
m3=[1; 0];

cova=[0.5 0; 0 0.25];
x1=sym('x1','real');
x2=sym('x2','real');
X=[x1; x2];
d1=expand(-(X-m1)'*pinv(cova)*(X-m1));
d2=expand(-(X-m2)'*pinv(cova)*(X-m2));
d3=expand(-(X-m3)'*pinv(cova)*(X-m3));
d12=d1-d2;
d13=d1-d3;
d23=d2-d3;

% si d12>0, d13>0--> pertence a clase 1
% si d12<0, d23>0 --> pertence a clase 2
% si d13<0,d23<0 --> pertence a clase 3

x1=2; x2=0; eval(d12),eval(d13),eval(d23)


%% Ejercico 4
clear, clc
load('./Datos/datos_ejercicio4/datos_biomarcadores_exp1.mat')
C1=X(Y==1,:);
C2=X(Y==2,:);
plot(C1(:,1),C1(:,2),'*r'),hold on
plot(C2(:,1),C2(:,2),'*b')

% si ya que son independiente osea no tienen una dependencia lineal entre
% las clases
x1=sym('x1','real');
x2=sym('x2','real');
X=[x1; x2];
cov1=cov(C1);
cov2=cov(C2);
N1=size(C1,1);
N2=size(C2,1);
cov12=(((N1-1)*cov1)+((N2-1)*cov2))/((N1+N2)-2);
m1=mean(C1)';
m2=mean(C2)';
d1=expand(-(X-m1)'*pinv(cov12)*(X-m1));
d2=expand(-(X-m2)'*pinv(cov12)*(X-m2));
d12=d1-d2;
x1=0.5; x2=-1; eval(d12)
p1=[0,-78.2/72.6];
p2=[78.2/40.5,0];


plot(C1(:,1),C1(:,2),'*r'),hold on
plot(C2(:,1),C2(:,2),'*b')
plot(p2,p1);

clear,clc
load('./Datos/datos_ejercicio4/datos_biomarcadores_exp2.mat')
C1=X(Y==1,:);
C2=X(Y==2,:);
plot3(C1(:,1),C1(:,2),C1(:,3),'*r'),hold on
plot3(C2(:,1),C2(:,2),C2(:,3),'*b')

x1=sym('x1','real');
x2=sym('x2','real');
x3=sym('x3','real');
X=[x1; x2; x3];
m1=mean(C1)';
m2=mean(C2)';
N1=size(C1,1);
N2=size(C2,1);
mCov=((N1-1)*cov(C1)+(N2-1)*cov(C2))/((N1+N2)-2);
d1=expand(-(X-m1)'*pinv(mCov)*(X-m1));
d2=expand(-(X-m2)'*pinv(mCov)*(X-m2));
d12=d1-d2;
x1=-1; x2=1.6;x3=1.5; eval(d12)


%% Ejercico 5
clear, clc
load('./Datos/datos_ejercicio5.mat');
numDatos=size(X,1);
porcentajeTrain = 0.7; 
numDatosTrain = round(porcentajeTrain*numDatos); 
numerosMuestrasTrain = randsample(numDatos,numDatosTrain); 
numerosMuestrasTest = find(not(ismember(1:numDatos,numerosMuestrasTrain))); 
% Conjunto de Train 
XTrain = X(numerosMuestrasTrain,:); 
YTrain = Y(numerosMuestrasTrain); 
% Conjunto de Test 
XTest = X(numerosMuestrasTest,:); 
YTest = Y(numerosMuestrasTest);

figure,plot3(XTrain(:,1),XTrain(:,2),XTrain(:,3),'*r');
title("Datos de Entrenamiento.");
figure,plot3(XTest(:,1),XTest(:,2),XTest(:,3),'*b');
title("Datos de Test.");

%LDA
x1=sym('x1','real');
x2=sym('x2','real');
x3=sym('x3','real');
X=[x1; x2; x3];
C1=XTrain(YTrain==1,:);
C2=XTrain(YTrain==2,:);
m1=mean(C1)';
m2=mean(C2)';
N1=size(C1,1);
N2=size(C2,1);
num=N1+N2;
mCov=((N1-1)*cov(C1)+(N2-1)*cov(C2))/(num-2);
d1=expand(-(1/2)*(X-m1)'*pinv(mCov)+(X-m1)+log((N1/num)));
d2=expand(-(1/2)*(X-m2)'*pinv(mCov)+(X-m2)+log((N2/num)));
d12=d1-d2;

figure,plot3(XTrain(:,1),XTrain(:,2),XTrain(:,3),'*r');
title("Datos de Entrenamiento."), hold on ,fimplicit3(d12)
%QDA
cov1=cov(C1);
cov2=cov(C2);
d1=expand(-(1/2)*(X-m1)'*pinv(cov1)*(X-m1)-(1/2)+og(det(cov1))+log(N1/num));
d2=expand(-(1/2)*(X-m2)'*pinv(cov2)*(X-m2)-(1/2)+log(det(cov2))+log(N2/num));
d12=d1-d2;

figure,plot3(XTrain(:,1),XTrain(:,2),XTrain(:,3),'*r');
title("Datos de Entrenamiento."), hold on ,fimplicit3(d12);


