function h=funcion_histograma(I)
     
 [nf nc] = size(I)
  h=zeros(256,1)
 for i=1:nf
     for j=1:nc
         pos= double(I(i,j))+1;  %como empieza en el 0 cada pixel, no se puede hacer en el uint8 ya que en la pos 255 se pasa.
         h(pos)=h(pos)+1; 
     end
 end
  
end