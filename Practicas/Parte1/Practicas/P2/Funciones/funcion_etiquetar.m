function   [IEtiq, N]= funcion_etiquetar(Ib)
 [N M]=size(Ib);
 IEtiq=zeros(N+2,M+2);

 % PASO INICIALIZACION

 Contador=0;
 for i=1:N
     for j=1:M
         if Ib(i,j)==1
             Contador=Contador+1;
             IEtiq(i+1,j+1)=Contador;
         end
     end 
 end 

 
 Cambio=true;
 while (Cambio)
     Cambio=false;
     %Primera pasada de arriba abajo
     for i=2:N+1
         for j=2:M+1

           if IEtiq(i,j)>0

             Vector=[IEtiq(i-1,j) IEtiq(i,j-1:j)];  %%conectividad 8  IEtiq(i-1,j-1:j+1) IEtiq(i,j-1:j)];
             Vector=Vector(Vector>0);
             Vmin=min(Vector);

             if IEtiq(i,j) > Vmin
                 IEtiq(i,j)=Vmin;
                 Cambio=true;
             end 

           end 

         end
     end 
   % Primera pasada de abajo a arriba
      for i=N+1:-1:2
         for j=M+1:-1:2

           if IEtiq(i,j)>0

             Vector=[IEtiq(i+1,j) IEtiq(i,j:j+1)];
             Vector=Vector(Vector>0);
             Vmin=min(Vector);

             if IEtiq(i,j) > Vmin

                 IEtiq(i,j)=Vmin;
                 Cambio=true;

             end

           end
         end
     end
 end 

  IEtiq=IEtiq(2:N+1,2:M+1);

  valores=unique(IEtiq(:));
  valores=valores(valores>0);

  N=length(valores);

  for i=1:N
      Ibin= IEtiq==valores(i);

      IEtiq(Ibin)= i;
  end 
  %bwlabel(Ib);
end