function representa_esfera(centro,radio)

Rc=centro(:,1);
Gc=centro(:,2);
Bc=centro(:,3);

[R,G,B] = sphere(100);  

x=radio*R(:)+Rc;
y=radio*G(:)+Gc;
z=radio*B(:)+Bc;

plot3(x,y,z,'*g')
end

