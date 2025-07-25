%% metodos de minimo
%1)encontrar los dos picos mas altos
%1.1)Nivel de gris del primer pico: corresponde al nivel de gris 
% en el que el histograma alcanza el mayor valor

Imagen=imread('P4.jpg');
%ImagenGris = rgb2gray(Imagen);
hist=imhist(Imagen);
[pos pico1] = max(hist);

%1.2 Nivel de gris del segundo pico: multiplicar los valores del histograma por el cuadrado de la
%distancia al primer pico y tomar el máximo: max [(k - f)2 * h(k) ], 0 ≤ k ≤ 255
g = zeros(256, 1); % Vector para almacenar los valores de la función
for k = 0:255
    g(k+1) = (k - pico1)^2 * hist(k+1);
end
[g_max pico2 ]= max(g);

umbralt=(pico1+pico2)/2;

subplot(1,3,1)
imshow(Imagen);
subplot(1,3,2)
img=Imagen >umbralt;
imshow(img)
subplot(1,3,3)
imgp2=Imagen <umbralt;
imshow(imgp2)
