function  v_Distancias = calcula_distancia_punto_a_nube_puntos(P,NP)

numDatos=size(NP,1);
%%% primera solucion
v_Distancias=zeros(1,numDatos);

 for i=1:numDatos
     N=double(NP(i,:));
     v_Distancias(1,i)= sqrt( sum((P - N).^2 ) );
 end
  
 %%% segunda solucion
 %PAmp=repmat(P,numDatos,1); %P ampliado o sea el punto repetido tantas veces como numDatos
 %N=double(NP);
 %v_Distancias= sqrt(sum((PAmp - N).^2)); 
end

