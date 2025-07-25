function   R= funcion_compara_matrices(A, B)
    if(size(A)==size(B))
       Dife=A-B;
       maximo= Dife(1,1);
       minimo = Dife(1,1);
       for i=1:size(Dife)
           for j=1:size(Dife,2)
               if(maximo < Dife(i,j))
                   maximo = Dife(i,j);
               end
                if(minimo > Dife(i,j))
                   minimo = Dife(i,j);
               end
           end
       end
       if(maximo == minimo && (maximo==0 || minimo == 0))
           R=true;
       else
           R=false;
       end
    else
        disp('las dos matrices no tienen la misma dimensión.');
    end
end