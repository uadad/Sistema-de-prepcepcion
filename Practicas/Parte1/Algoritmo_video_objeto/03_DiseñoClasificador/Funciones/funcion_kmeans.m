function [idx, centroides] = funcion_kmeans(X,k)

numDatos=size(X,1);
numDim=size(X,2);

centroides=zeros(k,numDim);

indSemillas=randsample(1:numDatos,k);
C_ini=X(indSemillas,:);

idx_ini=genera_nueva_agrupacion(X,C_ini);

hayCambio=true;

  while hayCambio
    hayCambio=false;
    
    centroides=calcula_centroides(X,idx_ini);

    idx=genera_nueva_agrupacion(X,centroides);

    cambio=compara_matrices(idx,idx_ini);
    hayCambio=not(cambio);

    if(hayCambio)
       idx_ini=idx;
    end

  end

end


function idx=genera_nueva_agrupacion(X,C)

   numDatos=size(X,1);
   numAgrup=size(C,1);

   idx=zeros(numDatos,1);

   MD=zeros(numAgrup,numDatos);
   NP=double(X');

   for i=1:numAgrup
      P=double(C(i,:)');
      %MD(i,:)=calcula_distancia_punto_a_nube_puntos(P,NP);

      PAmp=repmat(P,1,numDatos); 
      MD(i,:)= sqrt(sum((NP - PAmp).^2,1)); 
   end

   for i=1:numDatos
    v=MD(:,i);
    [Vmin, ind]=min(v);
    idx(i)=ind;
   end
end 


function C= calcula_centroides(X,idx)
  
  numAgrup=max(idx);
  numDim=size(X,2);

  C=zeros(numAgrup,numDim);

  for i=1:numAgrup
      X_i=X(idx==i,:);
      C(i,:)=mean(X_i);
  end 
end


function R=compara_matrices(m1,m2)

    [numFilas_m1 , numColumas_m1] = size(m1);
    [numFilas_m2 , numColumas_m2] = size(m2);
    
    if (numFilas_m1 ~= numFilas_m2) || (numColumas_m1 ~= numColumas_m2)
        R = []; % por devolver algo en este caso
        
    else % sólo entra si las matrices  son iguales
        
        clc

        m1 = double(m1); % para asegurar que hacemos la diferencia en el  formato adecuado
        m2 = double(m2);

        dif = m1-m2;

        vMin = min(dif(:));
        vMax = max(dif(:));

        if vMin==vMax && vMin==0
            R = true;
        else
            R = false;         
        end
        
    end
end