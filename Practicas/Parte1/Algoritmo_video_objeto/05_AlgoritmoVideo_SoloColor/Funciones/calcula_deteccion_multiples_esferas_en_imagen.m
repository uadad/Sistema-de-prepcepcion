function Ib = calcula_deteccion_multiples_esferas_en_imagen(I,centroide_radio)

   [nF, nC, Comp]=size(I);
   numEsferas=size(centroide_radio,1);
   Ib=zeros(nF,nC);
   for i=1:numEsferas
      Ib_i=calcula_deteccion_1esfera_en_imagen(I,centroide_radio(i,:));
      Ib= Ib | Ib_i;
   end 
end

function  Ib_deteccion_por_distancia= calcula_deteccion_1esfera_en_imagen(I, centro_radio)

Rc=centro_radio(:,1);
Gc=centro_radio(:,2);
Bc=centro_radio(:,3);

R=double(I(:,:,1));
G=double(I(:,:,2));
B=double(I(:,:,3));

MD = sqrt((R-Rc).^2 + (G-Gc).^2 + (B-Bc).^2);
Ib_deteccion_por_distancia= MD < centro_radio(:,4);

end