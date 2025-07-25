function funcion_representa_hiperplano_separacion_2_3_Dim(coef12,X)

A=coef12(1); B=coef12(2); C=coef12(3); D=coef12(4);
x1min=min(X(:,1)); x1max=max(X(:,1));
x2min=min(X(:,2)); x2max=max(X(:,2));
paso1=(x1max-x1min)/100;
paso2=(x2max-x2min)/100;
[x1Plano, x2Plano]=meshgrid(x1min:paso1:x1max,x2min:paso2:x2max);
x3Plano=-(A*x1Plano +B*x2Plano +D)/(C+eps);

surf(x1Plano,x2Plano,x3Plano);

end

