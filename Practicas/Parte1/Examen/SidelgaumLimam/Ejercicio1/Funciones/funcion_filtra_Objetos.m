function IbFilt = funcion_filtra_Objetos(Ib, numPix)
    [Ietiq, N] = funcion_etiquetar(Ib);
    area = funcion_calcula_area(Ietiq, N);
    IbFilt = Ib;  % Mantener las agrupaciones que nos interesan
    posEliminar = find(area < numPix);  % Posiciones de los objetos con área menor que numPix

    for i = 1:length(posEliminar)
        etiqOI = posEliminar(i);
        IbFilt(Ietiq == etiqOI) = false;  % Poner a 0 los píxeles correspondientes
    end
end

