function [Ietiq,N] = funcion_Segmenta_Imagen(I)
% binarizar la imagen
Ibin= I > 250*graythresh(I);

[Ietiq,N]=bwlabel(Ibin);
end

