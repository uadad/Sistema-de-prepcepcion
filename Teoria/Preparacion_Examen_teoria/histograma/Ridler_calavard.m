%%Método de Ridler y Calvard (1978) - ISODATA: 
Imagen =imread('P4.jpg');
InicialT = mean(Imagen(:));
UmbralT = 100000000000000;
Tnuevo=0;
while (InicialT-UmbralT<2)

%%agrupaciones
Img1= Imagen<InicialT;
Img2= Imagen>InicialT;
%%medias
mean1= mean(Imagen(Img1));
mean2= mean(Imagen(Img2));

UmbralT= (0.5)*(mean1+mean2)
InicialT = UmbralT;

end



