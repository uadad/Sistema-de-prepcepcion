function funcion_representa_datos(X,Y, espacioCcas, nombresProblema)
   % espacioCcas=[1,5];m ejemplo
   % espacioCcas=[2 6 13];

  nD=nombresProblema.descriptores;
   nC=nombresProblema.clases;
   Simb=nombresProblema.simbolos;

   dim= length(espacioCcas);

   codif=unique(Y);
   numClases=length(codif);

for i = 1:numClases
      X_i=X(Y==codif(i),espacioCcas);
      if(dim==2)
          plot(X_i(:,1),X_i(:,2),Simb{i});
      else
          plot3(X_i(:,1),X_i(:,2),X_i(:,3),Simb{i});
      end
        hold on
end

  legend(nC);
  xlabel(nD{espacioCcas(1)})
  ylabel(nD{espacioCcas(2)});
  if dim == 3
      zlabel(nD{espacioCcas(3)});
  end
  
end

