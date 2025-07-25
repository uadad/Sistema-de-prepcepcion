function [YLDA,d] = funcion_aplica_LDA(X, vectorMedias,matricesCovarianza,propabilidadApriori,valoresY)
   N=size(X,1);
   K=length(unique(valoresY));
   d=zeros(N,K);
   YLDA=zeros(N,1);
   E=matricesCovarianza;
   for i=1:N
       X_i=X(i,:)';
       for j=1:K
           M=vectorMedias(:,j);
           PP=propabilidadApriori(1,j);
           d(i,j)=expand(-(1/2)*(X_i-M)'*pinv(E)*(X_i-M)+log(PP));
       end  
       [v,ind]=max(d(i,:));
       YLDA(i,1)=valoresClase(ind);
   end 
end

