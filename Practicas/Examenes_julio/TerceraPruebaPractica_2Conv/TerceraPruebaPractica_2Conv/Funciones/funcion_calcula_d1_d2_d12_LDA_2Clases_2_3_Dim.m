function [d1, d2, d12,coef_d12] = funcion_calcula_d1_d2_d12_LDA_2Clases_2_3_Dim(X, Y)
  valores=unique(Y);
   C1=X(Y==valores(1),:);
   C2=X(Y==valores(2),:);
   N1=size(C1,1);
   N2=size(C2,1);
   M1=mean(C1)';
   M2=mean(C2)';
   E1=cov(C1);
   E2=cov(C2);
   E=((N1-1)*E1+(N2-1)*E2)/((N1+N2)-2);
   PP1=N1/size(X,1);
   PP2=N2/size(X,2);
   x1=sym('x1','real');
   x2=sym('x2','real');
   numAtributos = size(X,2);
   X=[x1; x2];
   if numAtributos == 3
       x3=sym('x3','real');
       X=[X; x3];
   end
   d1=expand(-(1/2)*(X-M1)'*pinv(E)*(X-M1)+log(PP1));
   d2=expand(-(1/2)*(X-M2)'*pinv(E)*(X-M2)+log(PP2));
   d12=d1-d2;
 % Calculo de coeicientes: d12 = A*x1+B*x2+C*x3+D
if(numAtributos == 3) 
 x1 = 0; x2 = 0; x3 = 0; D = eval(d12);
 x1 = 1; x2 = 0; x3 = 0; A = eval(d12)-D;
 x1 = 0; x2 = 1; x3 = 0; B = eval(d12)-D;
 x1 = 0; x2 = 0; x3 = 1; C = eval(d12)-D;
 coef_d12=[A B C D];
else
 x1 = 0; x2 = 0;  C = eval(d12);
 x1 = 1; x2 = 0;  A = eval(d12)-C;
 x1 = 0; x2 = 1;  B = eval(d12)-C;
 coef_d12=[A B C];
end
end

