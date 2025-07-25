%% Minimo entre maximos

h=imhist(I);
[num, max1]=max(h);
metrica=zeros(size(h));
for g=2:255
    metrica(g)=h(g)*(g-max1)^2;
end

[num2,max2]=max(metrica);
if(max1> max2)
    g1=max2;
    max2=max1;
else 
    g1=max1;
end
h(1:g1)=num;
h(max2:end)=num;

[valor, pos]=min(h);
pos=pos-1;


%% IsoData

k=umbral_Ini;

g1=h(h<=k);
g2=h(h>k);
T=mean(g1);

cambio=true;
while cambio
    gIni=1;
    gFin=round(T);
    gMean1=mean(h(gIni:gFin));
    gIni=round(T)+1;
    gFin=256;
    gMean2=mean(h(gIni:gFin));
    Tnueva=mean([gMean1 gMean2]);
    if(abs(T-Tnueva)<=0)
        cambio=false;
    end
    T=Tnueva;
end


%% OTSU

K=...

c1=h(h<=k);
c2=h(h>k);

g1=mean(c1(:));
g2=mean(c2(:));
w1=sum(c1(:))/sum(h(:));
w2=sum(c2(:))/sum(h(:));
var=zeros(size(h));
for i=2:255
    var(i)=w1*(g1-mean(h(:)))^2+w2*(g2-mean(h(:)))^2;
end
[valor,pos]=max(var);
pos=pos-1;