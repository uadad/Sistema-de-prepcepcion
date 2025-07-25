clear,clc, close all
load('./DatosGenerados/conjunto_datos','X','Y','nombresProblema');

% justificacion estandarizacion de datos
mean(X);
std(X);

% estandarizacion de datos
medias=mean(X);
desv=std(X);
desv(desv==0)=eps;
Z=X;
for i=1:size(X,1)
    for j=1:22
        Z(i,j)=(X(i,j)-medias(j))/desv(j); % quitamos el primer for Z(:,j)=(X(:,j)-medias(j))/desv(j);
    end
end

save('./DatosGenerados/conjunto_datos_estandarizados.mat','Z','Y','nombresProblema');

save('./DatosGenerados/medias_desviaciones_estandarizacion.mat','medias','desv','nombresProblema');
