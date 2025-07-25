function posOutliers = funcion_detecta_outliers_clase_interes(X,Y,posClaseInteres)
valoresY=unique(Y);

XColor=X(Y==valoresY(posClaseInteres),:);

%primera solucion
%for i=1:3

x=XColor(:,1);
x2=XColor(:,2);
x3=XColor(:,3);

xOrd=sort(x);
xOrd2=sort(x2);
xOrd3=sort(x3);

numValoresR=length(x);
numValoresV=length(x2);
numValoresA=length(x3);

%calcular los precentiles en el digrama de caja
posQ1=round(0.25*numValoresR); % dividir en el primer cuartil 
posQ3=round(0.75*numValoresR);% tercer cuartil

Q1=xOrd(posQ1);
Q3=xOrd(posQ3);
RI=Q3-Q1;  %rango de la caja

vMinAceptado=Q1-1.5*RI;
vMaxAceptado=Q3+1.5*RI;
outliers= X(:,1) < vMinAceptado | X(:,1) > vMaxAceptado;

outliersRojo= outliers & Y==1;  % coge los q estan en color de seguimiento
posOutliersR=find(outliersRojo);

%%Color Verde
posQ1=round(0.25*numValoresV); % dividir en el primer cuartil 
posQ3=round(0.75*numValoresV);% tercer cuartil

Q1=xOrd2(posQ1);
Q3=xOrd2(posQ3);
RI=Q3-Q1;  %rango de la caja

vMinAceptado=Q1-1.5*RI;
vMaxAceptado=Q3+1.5*RI;
outliers= X(:,2) < vMinAceptado | X(:,2) > vMaxAceptado;

outliersVerde= outliers & Y==1;  % coge los q estan en color de seguimiento
posOutliersV=find(outliersVerde);

%% Color Azul

posQ1=round(0.25*numValoresA); % dividir en el primer cuartil 
posQ3=round(0.75*numValoresA);% tercer cuartil

Q1=xOrd3(posQ1);
Q3=xOrd3(posQ3);
RI=Q3-Q1;  %rango de la caja

vMinAceptado=Q1-1.5*RI;
vMaxAceptado=Q3+1.5*RI;
outliers= X(:,1) < vMinAceptado | X(:,1) > vMaxAceptado;

outliersAzul= outliers & Y==1;  % coge los q estan en color de seguimiento
posOutliersA=find(outliersAzul);

%% concatenar y quitar los pixele repetidos entre los colores
posOutliers=[posOutliersR; posOutliersV; posOutliersA];
posOutliers=unique(posOutliers);



%%%%%%% referencia %%%%%%%%%%%%%%%%%%%%%%%%55
 % valores=unique(Y);
 % foI= Y==valores(posClaseInteres); %de todos las filas de Y caracterizamos todas las filas donde Y tiene el segundo valor
   
 % ind=1; % el color
 % x=X(foI,ind); xCompleto=X(:,ind);
  %calculamos vMin y vMax aceptados para el valor de x
 %calcular outliers de Y
 % out= xCompleto<vMinAceptado | xCompleto>vMAxAceptado;
 
end

