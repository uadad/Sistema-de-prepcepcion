 %%%%%%% calcular el centroide de la esfera
 valoresY=unique(Y);
 pos=2;
 filasColor=Y== valoresY(pos);
 XColor=X(filasColor,:);

 XFondo=X(not(filasColor),:);

 centroide=mean(XColor);

 %% calcular el radio : primero calculamos las distancias q hay entre el centroide y cada punto del color y el radio es la distancia maxima
 %% y el otro radio es la distancia minima que hay entre el centroide y los puntos del fondo

 P % es un punto
 NP % nube de puntos

 numDatos=size(NP,2);

vectorDistancia=zeros(1,numDatos);

 for i=1:numDatos
   vectorDistancia(i)=sqrt(sum((P-NP(:,i)).^2));
 end
  
 PAmp=repmat(P,1,numDatos); %P ampliado o sea el punto repetido tantas veces como numDatos
 NP

 vectorDistancia= sqrt(sum((PAmp-NP).^2)); 

 radioColor=max(vectorDistancia);




 %%Representacion de las esferas en  el espacoo de caracteristicas
 