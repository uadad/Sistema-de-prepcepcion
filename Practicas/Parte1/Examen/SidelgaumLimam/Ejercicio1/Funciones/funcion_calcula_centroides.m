function C = funcion_calcula_centroides (IEtiq, N)
C=zeros(N,2);

  for i=1:N
    Ib= IEtiq==i;
    [f c]=find(Ib);
    x=mean(c(:));
    y=mean(f(:));
    C(i,1)=x;
    C(i,2)=y;
  end 
end