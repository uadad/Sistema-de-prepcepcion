function [vectorMedias, matrizCovarianza, probabilidadPriori] = funcion_ajuste_LDA(X,Y)
      valoresY=unique(Y);
      K=length(valoresY);
      numDatos=size(X,1);
      p=size(X,2);
      probabilidadPriori=zeros(1,K);
      vectorMedias=zeros(p,K);
      matrizCovarianza=zeros(p,p);
      for i=1:K
          clase_i=X(Y==valoresY(i),:);
          N_i=size(clase_i,1);
          probabilidadPriori(1,i)=(size(clase_i,1)/numDatos);
          vectorMedias(i,:)=mean(clase_i)';
          matrizCovarianza=matrizCovarianza+((N_i-1)*cov(clase_i));
      end
      matrizCovarianza=matrizCovarianza/(numDatos-K);
end

