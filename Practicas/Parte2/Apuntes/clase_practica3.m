

%%parte 1 de caso 1

%1. Cargamos Z-Y  --> X=Z;
%2. Generar XoI, YoI (seleccionams los valores de las clases del problema o
%sea circulos y cuadrados.
%3.  LLamo a la funcion seleccion Descriptor (me devuelve el esacio de
%carateristicas).
%4.Guardo EspacioCcas.


%% Generacion XoI, YoI

clasesOI=[1 2];


%%parte 2 de caso 1

%1. Cargo Z-Y
%2. Cargo espacioCC.
%3. Generar XoI, YoI es el mismo que la parte anterior (lo q modifico es
%XoI   XoI=XoI(:,espacioCCas)), nombresProblemaOI;
%4. llamar a la funcion clacula d1 d2 d12


%CAso 2 parte 1
% para XOi=X(:,1:end-1); YOI=Y;
% dim=4;

% el segunfo script QDA:
% copiar la Xoi y YOi del anterior
% llamar a funcion_ajuste_QDAnombresProblemasOI=nombresProblema y cambio
% los descriptores , y cargo en una carpeta QDA.mat que contiene
% (XoI,YoI,vectorMedias,ProbabilidadPriori,matricesCovarianza,espacioCCas).

% para la aplicacion del diseño se genera Xtest y Ztest y se calcula
% XtestO=Ztest(:,espacioCCas).
% y se llama a la funcion aplica_QDA con numClases unique(Yoi).


% caso 3 de Knn
% solo se cambia dim en el primer script a 5
% y en el segundo se quita el ultimo paso de llamar a alguna funcion solo
% guardo XoI,YoI,espacioCCas

% caso 4 para el diseño se crean dos carpetas la primera es la de lda q es
% la misma q un caso de la primera.
%en el segundo script se modifica el YoI=Y; oi(YoI==3)=1;



%Funcion_Reconoce_Formas
%1.cargo I=Itest.
%2.[Ietiq,N]=funcion_Segmenta(I);      
for i=1:N
  figure,
    Ib=Ietiq==i;
    Io=funcion_visualiza(I,Ib,color);
   imshow(Io);
   title(Reconocimento);
end
%3. Xtest=funcion_calcula_descriptores(Ietiq,N);
%4.Ztest.
%5. si Knn,QDA,LDA con todas las clases se llama a la funcion quitandole
%los descriptores.
% si


% el lda se puede preguntar distinguir dos clases como el caso o utilizando
% el lda como el caso 2 con Qda llamar a la funcion aplica.
% N es el numero de objeto de la imagen que hay.

for i=1:N 
    %LDA: Circ-Cuad
    load([rutaCircCuad 'LDA.mat']);
    Xi=ZImagen(i,espacioCcas);
    x1=Xi(1); x2=Xi(2); x3=Xi(3);
    valorCircCuad=eval(d12);

    %LDA: Circ-Trian
    load([rutaCircTrian 'LDA.mat']);
    Xi=ZImagen(i,espacioCcas);
    x1=Xi(1); x2=Xi(2); x3=Xi(3);
    valorCircTrian=eval(d12);

    %LDA: Cuad-Trian
    load([rutaCuadTrian 'LDA.mat']);
    Xi=ZImagen(i,espacioCcas);
    x1=Xi(1); x2=Xi(2); x3=Xi(3);
    valorCuadTrian=eval(d12);

    variableReconcimento
 if valorCircTrian>0 & valorCircCuad>0
           r='Objeto Circular';
 else if valorCircCuad<0 & valorCuadTrian>0
          r='Objeto Cuadrado';
 else
          r='Objeto Triangular';
 end

 figure,
 Ib=Ietiq==i;
  subplot(2,2,1)
 Io=funcion_visualiza(I,Ib,color,false)
 imshow(Io)
 title(r)

 subplot(2,2,2)
 % hace falta cargar otra vez  load([rutaCircCuad 'LDA.mat']); ya que se
 % sobrescribe.
 load([rutaCircCuad 'LDA.mat']);
 funcion_representa_datos(XoI,YoI,1:3,nombresProblemasOI);
 hold on,
 funcion_representa_hiperplano_separacion_2_3_Dim(ccoef12,XoI)
  Xi=ZImagen(i,espacioCcas);
   x1=Xi(1); x2=Xi(2); x3=Xi(3);
  plot3(x1,x2,x3,'*b');

subplot(2,2,3)
  load([rutaCircTrian 'LDA.mat']);
 funcion_representa_datos(XoI,YoI,1:3,nombresProblemasOI);
 hold on,
 funcion_representa_hiperplano_separacion_2_3_Dim(ccoef12,XoI)
  Xi=ZImagen(i,espacioCcas);
  x1=Xi(1); x2=Xi(2); x3=Xi(3);
  plot3(x1,x2,x3,'*b');

  subplot(2,2,3)
  load([rutaCuadTrian 'LDA.mat']);
 funcion_representa_datos(XoI,YoI,1:3,nombresProblemasOI);
 hold on,
 funcion_representa_hiperplano_separacion_2_3_Dim(ccoef12,XoI)
  Xi=ZImagen(i,espacioCcas);
  x1=Xi(1); x2=Xi(2); x3=Xi(3);
  plot3(x1,x2,x3,'*b');
end 


%% Caso 2 QDA aplicacion

ZImagen
Xtest=ZImagen(:,espacioCCas);
Ytest=funcion_aplica_QDA(Xtest........);





