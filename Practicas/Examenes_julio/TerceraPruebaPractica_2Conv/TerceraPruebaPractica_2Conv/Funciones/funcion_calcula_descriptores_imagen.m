function XImagen = funcion_calcula_descriptores_imagen(Ietiq,N)
XImagen=zeros(N,23);
stats=regionprops(Ietiq,'Circularity','Eccentricity','Solidity','EulerNumber');
Circ=cat(1,stats.Circularity);
Ecc=cat(1,stats.Eccentricity);
Sol=cat(1,stats.Solidity);
numEulier=cat(1,stats.EulerNumber);
if N > 0
    BoudingBox=zeros(N,1);
for i=1:N
etiq=i;
Ib_etiq=Ietiq==etiq;
[f,c]= find(Ib_etiq);

fmin=min(f)-0.5;
fmax=max(f)+0.5;
cmin=min(c)-0.5;
cmax=max(c)+0.5;
ABB=(cmax-cmin)*(fmax-fmin);
numPixObjeto=sum(Ib_etiq(:));
BoudingBox(i,1)=numPixObjeto/ABB;
end
end
 X=funcion_calcula_ExtentIR_HU_DF(Ietiq,N);
XImagen= [Circ Ecc Sol BoudingBox X numEulier];
end

