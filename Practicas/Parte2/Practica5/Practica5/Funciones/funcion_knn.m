function YTestKNN = funcion_knn(XTrain,YTrain,XTest,k)
valores_Clases=unique(YTrain); % me hace falta para asignar un valor a YTest
numClases=length(valores_Clases);

nTrain=size(XTrain,1);
nTest=size(XTest,1);

YTestKNN=zeros(nTest,1);

NP=XTrain';  % la funcion lo requiere como vector columna

for i=1:nTest

    P=XTest(i,:)'; % la funcion lo requiere como vector columna
    P_amp=repmat(P,1,nTrain); 
    
    d=sqrt(sum((P_amp-NP).^2));
    [dOrd,indices]=sort(d);
    indicesK=indices(1:k); % obtengo los indices de las clases mas cercanas egun el numero de K
    clasesK=YTrain(indicesK); % lasa clases ordenada de menor a mayor por la distancia
    
    valores_clasesK=unique(clasesK);
    numClasesK=length(valores_clasesK);
    if numClasesK==1
        YTestKNN(i)=valores_clasesK(1);
    else
        conteoClases= zeros(1,numClasesk);
        for j=1:numClasesK
               valor=valores_clasesK(j);
               conteoClases(j)=sum(clasesk==valor);
        end
         
        posClasesKNN = find(conteoClases==max(conteoClases)); % max me da solo el primeer maximo y con el find devulve lña posiciones que son y la clase esta almacenada en valores_ClaseK 
       
        if length(posClasesKNN)==1
             YTestKNN(i)=valores_clasesK(posClasesKNN);
        else

            for w=1:K % length(clasesK)
                clasesK_w=clasdesK(w);
                ClasesKNN=valores_clasesK(posClasesKNN);
                if ismember(clasesK_w,ClasesKNN); % es miembro 
                    break;
                end 
            end
             YTestKNN(i)=valores_clasesK(clasesK_w);
             
        end
    end
end
end

