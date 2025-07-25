function X = funcion_calcula_ExtentIR_HU_DF(Ietiq,N)
  X=zeros(N,1+7+10);% 1->IR,7->HU,10->Df

for i=1:N
   Ib=Ietiq==i;
   EIR=funcion_Calcula_Extent_Inv_Rot(Ib);
   Hu=Funcion_Calcula_Hu(Ib)';
   DF=Funcion_Calcula_DF(Ib,10)';
   X(i,:)=[EIR, Hu, DF];
end
end

