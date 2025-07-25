load('DatosGenerados\KNN.mat');
[vectorMedias,matricesCovarianza,probabilidadPriori]=funcion_ajuste_QDA(XoI,YoI);
save('DatosGenerados\QDA.mat','nombresProblemaOI','espacioCCas','XoI','YoI',"probabilidadPriori","vectorMedias","matricesCovarianza");