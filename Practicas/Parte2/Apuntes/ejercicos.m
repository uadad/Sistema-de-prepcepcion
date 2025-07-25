%% Determinar la separabilidad del espacio de CCAS dado por: [1 4 10]
%% Solo de las muestras de las circulos y triangulos.

X 
Y
% como hemos creado los datos con circulos codicfican con el valor 1 y
% triangulos vale 3
codifClases=unique(Y);
clasesOi=[1 3];
codifClasesOI=codifClases(clasesOi);
XoI=[]; YoI=[];
numClasesOI=length(clasesOi);

for i=1:numClasesOI
    fOI= Y==codifClasesOI(i);
    X_i = X(fOI,:);
    Y_i = Y(fOI);
    XoI = [XoI; X_i];
    YoI = [YoI; Y_i];
end
espacioCC=[1 4 10];
XoI=XoI(:,espacioCC);

XoI,YoI
nombresProblemaOI=[];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCC);
nombresProblemaOI.clases = nombresProblema.clases(clasesOi);
nombresProblemaOI.simbolos = nombresProblema.simbolos(clasesOi);

% para la representacion ya que XoI YoI tiene solo 3 columnas
espacioCCas_Representacion = 1:length(espacioCC);
figure,
funcion_representa_datos(XoI,YoI,espacioCCas,nombresProblemaOI);

idSeparabilidad=indiceJ(XoI,YoI);


%% Determinar la separabilidad del espacio de CCAS dado por: [1 4 10]
%%  de las muestras de las circulos-triangulos vs Cuadrados.

% YoI(YoI==3)=1;

XoI=[]; YoI=[];

codifClases=unique(Y);
%Clase 1
XoIClase=[]; YoIClase=[];
clasesOi_C1=[1 3];
codifClasesOI_C1=codifClases(clasesOi);
numClasesOI=length(clasesOi);

for i=1:numClasesOI
    fOI= Y==codifClasesOI_C1(i);
    X_i = X(fOI,:);
    XoIClase = [XoIClase; X_i];
    YoIClase = [ YoIClase; ones(size(X_i,1))];
end
XoIClase1=XoIClase;
YoIClase1=YoIClase;

%Clase 2
XoIClase=[]; YoIClase=[];
clasesOi_C2=[2];
codifClasesOI_C2=codifClases(clasesOi);
numClasesOI=length(clasesOi);

for i=1:numClasesOI
    fOI= Y==codifClasesOI_C2(i);
    X_i = X(fOI,:);
    XoIClase = [XoIClase; X_i];
    YoIClase = [YoIClase; 2*ones(size(X_i,1))];
end
XoIClase2=XoIClase;
YoIClase2=YoIClase;

XoI=[XoIClase1; XoIClase2];
YoI=[YoIClase1; YoIClase2];

espacioCC=[1 4 10];
XoI=XoI(:,espacioCC);

XoI,YoI
nombresProblemaOI=[];
nombresProblemaOI.descriptores = nombresProblema.descriptores(espacioCC);
nombresProblemaOI.clases = {'Circulo-Triangulo','Cuadrado'};
nombresProblemaOI.simbolos = {'*r','*b'};


espacioCCas_Representacion = 1:length(espacioCC);
figure,
funcion_representa_datos(XoI,YoI,espacioCCas,nombresProblemaOI);

idSeparabilidad=indiceJ(XoI,YoI);

