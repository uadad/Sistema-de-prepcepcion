function IbinF=funcion_elimina_regiones_ruidosas(Ibin)
porc= 0.1;
[N,M]=size(Ibin);
numPix=N*M;

length(Ibin(:));
numPixMin=round((porc/100)*numPix);
IbinF=bwareaopen(Ibin,numPixMin);

[Ietiq,N]=bwlabel(IbinF);
if N>0
    stats=regionprops(Ietiq,'Area');
    areas=cat(1,stats.Area);
    numPixMinimo=round(max(areas)/5);

    IbinF= bwareaopen(IbinF,numPixMinimo);
end
end

