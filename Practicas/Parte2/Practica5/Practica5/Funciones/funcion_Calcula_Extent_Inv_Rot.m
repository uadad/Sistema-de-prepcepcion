function Extent = funcion_Calcula_Extent_Inv_Rot(Ib)

angulo=0:5:355;
BoudingBox=zeros(length(angulo),1);
for i=1:length(angulo)
a=angulo(i);
Ib_r=imrotate(Ib,a);
[f,c]= find(Ib_r);
fmin=min(f)-0.5;
fmax=max(f)+0.5;
cmin=min(c)-0.5;
cmax=max(c)+0.5;
ABB=(cmax-cmin)*(fmax-fmin);
numPixObjeto=sum(Ib_r(:));
BoudingBox(i,1)=numPixObjeto/ABB;
end
Extent=max(BoudingBox);
end

