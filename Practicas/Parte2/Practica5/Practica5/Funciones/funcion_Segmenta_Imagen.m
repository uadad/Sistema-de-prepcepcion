function [Ietiq,N] = funcion_Segmenta_Imagen(I)
% binarizar la imagen
Ibin= I <255*graythresh(I);

%Eliminar posibles componenetes conectadas ruidosas
% componenets de menos del 0.1´´´´´´´´´´´´´´´´´´´´´´´´5 del numero total de
% pixeles de la imagen  o numero de pixeles menor al area del objeto
% mayor /5. 


IbinFilt=funcion_elimina_regiones_ruidosas(Ibin);
[Ietiq,N]=bwlabel(IbinFilt);
end

