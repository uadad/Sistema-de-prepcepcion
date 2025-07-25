function Io = funcion_visualiza(I,Ib,color, flagRepresenta, varargin) 

 [nf, nc, numComp]=size(I); % si la matriz es de intensidad numComp vale 1 
  % el if para definir el rgb de la salida
 if numComp == 1  % en escala de grises o intensidad
     R=I;
     G=I;
     B=I;
 else          % en color
      R=I(:,:,1);    %uint8 no double porq voy a generar una imagen no operar
      G=I(:,:,2);
      B=I(:,:,3);
 end
 R(Ib)=color(1);
 G(Ib)=color(2);
 B(Ib)=color(3);
 
 Io=cat(3,R,G,B);

 if nargin == 4 & flagRepresenta    % si el numero de argumento de entrada es igual 4 significa y flagRepresenta esta a true
     figure, imshow(Io)
 end
end