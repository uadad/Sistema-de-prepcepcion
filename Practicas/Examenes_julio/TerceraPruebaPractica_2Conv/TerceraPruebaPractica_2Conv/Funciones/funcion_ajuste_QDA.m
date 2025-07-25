function [vectorMedias, matricesCovarianzas, probabilidadPriori] = funcion_ajuste_QDA(X,Y)
      valoresY=unique(Y);
      K=length(valoresY);
      numDatos=size(X,1);
      p=size(X,2);
      probabilidadPriori=zeros(1,K);
      vectorMedias=zeros(p,K);
      matricesCovarianzas=zeros(p,p,K);
      for i=1:K
          clase_i=X(Y==valoresY(i),:);
          probabilidadPriori(1,i)=(size(clase_i,1)/numDatos);
          vectorMedias(:,i)=mean(clase_i)';
          matricesCovarianzas(:,:,i)=cov(clase_i);
      end
end

