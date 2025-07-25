function representa_datos_color_seguimiento_fondo(X,Y)
XColor=X(Y==1,:);
OtrosColor=X(Y==0,:);
plot3(XColor(:,2),XColor(:,2),XColor(:,3),'*b'), hold on

plot3(OtrosColor(:,1),OtrosColor(:,2),OtrosColor(:,3),'*r')

axis([0 255 0 255 0 255])

legend('Datos Color','Datos Fondo')
end

