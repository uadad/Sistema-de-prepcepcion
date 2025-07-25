function [YQDA,d] = funcion_aplica_QDA(X, vectorMedias,matricesCovarianza,probabilidadApriori,valoresY)
   N=size(X,1);
   K=length(unique(valoresY));
   d=zeros(N,K);
   YQDA=zeros(N,1);
   for i=1:N
       X_i=X(i,:)';
       for j=1:K
           M=vectorMedias(:,j);
           E=matricesCovarianza(:,:,j);
           PP=probabilidadApriori(1,j);
           d(i,j)=-(1/2)*(X_i-M)'*pinv(E)*(X_i-M)-(1/2)*log(det(E))+log(PP);
       end  
       [v,ind]=max(d(i,:));
       YQDA(i,1)=valoresY(ind);
   end 
end

