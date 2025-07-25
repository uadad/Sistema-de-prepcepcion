function h=funcion_histograma2(I)

   h=zeros(256,1);

  for g=0:255
      Ib= I==g;
      h(g+1) =sum(Ib(:));
  end

end