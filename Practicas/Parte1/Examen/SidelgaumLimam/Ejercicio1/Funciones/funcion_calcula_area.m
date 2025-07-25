function A = funcion__calcula_area (IEtiq, N)
 A=zeros(N,1);
 for i=1:N
     Ib=IEtiq==i;
     area=sum(Ib(:));
     A(i)=area;
 end 
   
end 