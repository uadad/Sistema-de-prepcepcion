function [ccasOi,Jmax] = funcion_selecciona_vector_ccas(XoI,YoI,dim)
numDescriptores=size(XoI,2);

ind=[];

for i=1:numDescriptores
    valor=indiceJ(XoI(:,i),YoI);
    if valor > 0.1
        ind=[ind; i];
    end
end
comb=combnk(ind,dim);
numComb=size(comb,1);
J=[];
for i=1:numComb
      J=[J; indiceJ(XoI(:,comb(i,:)),YoI)];
end 

[Jmax,ind]=max(J);
ccasOi=comb(ind,:);

%combnk(ccasOI,dim).
end

