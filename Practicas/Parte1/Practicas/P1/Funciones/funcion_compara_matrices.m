function R=funcion_compara_matrices(m1,m2)

[numFilas_m1 , numColumas_m1] = size(m1);
    [numFilas_m2 , numColumas_m2] = size(m2);
    
    if (numFilas_m1 ~= numFilas_m2) || (numColumas_m1 ~= numColumas_m2)
        clc
        disp('Las matrices no son iguales')
        R = []; % por devolver algo en este caso
        
    else % sólo entra si las matrices  son iguales
        
        clc

        m1 = double(m1); % para asegurar que hacemos la diferencia en el  formato adecuado
        m2 = double(m2);

        dif = m1-m2;

        vMin = min(dif(:));
        vMax = max(dif(:));

        if vMin==vMax && vMin==0
            R = true;
            disp ('matrices iguales')
        else
            R = false;
            disp ('matrices diferentes')            
        end
        
    end
end