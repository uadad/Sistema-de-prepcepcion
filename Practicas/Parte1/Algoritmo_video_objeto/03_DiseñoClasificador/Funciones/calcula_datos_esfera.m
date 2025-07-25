function  datos_esfera= calcula_datos_esfera(XColor, XFondo)
%calculamos Rc,Gc,Bc de los datos de color
   centroide=mean(XColor);
%calculamos el radio entre el punto de color mas lejano y punto de fondo
%mas cercano y dsp la media q es el radio de compremiso

   VDistanciasColor=calcula_distancia_punto_a_nube_puntos(centroide,XColor);
   VDistanciasFondo=calcula_distancia_punto_a_nube_puntos(centroide,XFondo);

   r1=max(VDistanciasColor);
   r2=min(VDistanciasFondo);

   r12=(r1+r2)/2;

   datos_esfera=[centroide r1 r2 r12];
end

