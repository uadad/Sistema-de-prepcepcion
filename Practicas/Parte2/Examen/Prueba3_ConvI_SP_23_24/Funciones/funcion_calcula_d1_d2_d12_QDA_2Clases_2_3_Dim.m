function [d1, d2, d12]  = funcion_calcula_d1_d2_d12_QDA_2Clases_2_3_Dim(X, Y)
   valores=unique(Y);
   C1=X(Y==valores(1),:);
   C2=X(Y==valores(2),:);
   M1=mean(C1)';
   M2=mean(C2)';
   E1=cov(C1);
   E2=cov(C2);
   PP1=size(C1,1)/size(X,1);
   PP2=size(C1,1)/size(X,2);
   x1=sym('x1','real');
   x2=sym('x2','real');
   numAtributos = size(X,2);
   X=[x1; x2];
   if numAtributos == 3
       x3=sym('x3','real');
       X=[X; x3];
   end
   d1=expand(-(1/2)*(X-M1)'*pinv(E1)*(X-M1)-(1/2)*log(det(E1))+log(PP1));
   d2=expand(-(1/2)*(X-M2)'*pinv(E2)*(X-M2)-(1/2)*log(det(E2))+log(PP2));
   d12=d1-d2;
end

