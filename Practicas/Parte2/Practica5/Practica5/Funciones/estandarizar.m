function [I,Z,Ietiq,N] = estandarizar(ruta)
I=imread(ruta);
[Ietiq,N]=funcion_Segmenta_Imagen(I);

         if N>0
              Y=ones(N,1);
              X=funcion_calcula_descriptores_imagen(Ietiq,N);
         else
             X=[];
             Y=[];
         end

medias=mean(X);
desv=std(X);
desv(desv==0)=eps;
Z=X;
for i=1:size(X,1)
    for j=1:22
        Z(i,j)=(X(i,j)-medias(j))/desv(j); % quitamos el primer for Z(:,j)=(X(:,j)-medias(j))/desv(j);
    end
end
end

