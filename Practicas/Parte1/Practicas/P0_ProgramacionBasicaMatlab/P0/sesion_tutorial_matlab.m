%% TUTORIAL MATLAB

%% ORGANIZACION: CURRENT DIRECTORY, COMMAND WINDOW, WORKSPACE, COMMAND HISTORY

% Ejemplo Suma y resta de dos numeros
a =1  
A = 2
suma = a+A; resta = a-A % Realiza la suma y la resta
suma = a+A, resta = a-A; % Realiza la suma y la resta

% OBSERVACIONES:
% el carácter “,” para separar comandos
% el símbolo “%” para introducir comentarios en el código
% % si no ponemos “;” el resultado se muestra en pantalla


%% Workspace: consultar tipo de variable, generar y cargar archivos .mat

whos A  % para ver el tipo de variable
% double ; real de punto flotante con 8 bytes
% empleado por Matlab por defecto en la definición de variables

save variables A a suma resta 
save('datos/variables','A','a','suma','resta')
% Guarda las variables en fichero matlab variables.mat

clear  % elimina las variables del workspace

load variables.mat 
% carga en el Workspace las variables almacenadas en el fichero .mat
clear
ruta = 'datos/variables';
load(ruta,'suma','resta')  
% carga en el Workspace variables específicas del fichero .mat
clear

clc % borra pantalla del command window.


%% Ayuda matlab
help save  % te ofrece ayuda respecto la función  por el command window
doc load % abre la ayuda Matlab para dar la información
type unique % edita el contenido de la función por command window
edit mat2gray  % abre fichero .m con la función


%% DEFINICIÓN DE MATRICES

% LAS VARIBLES EN MATLAB SON MATRICES. CASOS PARTICULARES:
% NUMERO: MATRIZ DE UNA FILA Y UNA COLUMNA
% VECTORES: VECTOR FILA (MATRIZ DE 1 FILA) O VECTOR COLUMNA (MATRIZ DE UNA
% COLUMNA)

% []: Para concatenar informacion       A(fila,columna)
% Definición con corchetes 
% Los corchetes se usan para concatenar informacion
% Si la información va separada por espacios o comas, se añade horizontalmente
% Si va seperada por "puntos y coma" se añade verticalmente

% EJEMPLOS:

% NÚMERO
a = 1
whos a

% VECTORES

b = [2 2], whos b; % concatenar horiziontalmente
b = [2; 2], whos b  % concatener verticalmente
b = [2, 2]

  b=cat(1,2,2)  % el 1 correponde a la fila de manera q b es igual q la linea 69
  b=cat(2,2,2)  % el 1 correponde a la fila de manera q b es igual q la linea 68

c = [a b 3] ; d = [2; 2]; e = [a; d]; f = [e; d; 3]; cTras = c'; % cTras es la matriz trans de c

% Operador : para la definición de vectores filas con los valores indicados
valorInicio = 1; valorFinal = 6; paso = 1;
A = valorInicio:paso:valorFinal

% Ejemplos
A = 1:6      % A=[1 2 3 4 5 6]
B = 1:2:5    % B=[1 3 5]
C = 5:-1:1   % C=[5 4 3 2 1]
G = 1:2:4    % G=[1 3]


% MATRICES: 
g = [1 2 3; 4 5 6 ]
whos g

% Crea h: resultado de añadir a a g una última columna con valores 7 y 8


h = [g [7;8]]


% Crea i: añdiendo a h una última fila con los valores del vector c


i = [h; c]


%% Inicializacion de matrices
A = []
B = ones(2)    %crear una matriz de 2x2 con unos
C = ones(2,3)  %crear una matriz de 2x3 con unos
D = zeros(3,1)
F = true(3)    % crear F de 3x3 de unos(true)
G = false(2,4) % crear G de 2x4 de zeros(false)    

H = eye(4) % matriz identidad 4x4

I = rand(4,3) % matriz 4x3 de números distribución probabilidad uniforme entre 0-1

J = randn(100,1)  % vector columna de 100 elementos
% generados según distribución gaussiana de media cero y desviación típica 1


%% ACCESO A LOS ELEMENTOS DE UNA MATRIZ: 

% Con paréntesis: (fila/s , columna/s) , las posiciones de filas y columnas
% se indican mediante vectores

clear

a = [1 4 6 9 -1 ; 2 4 9 11 5 ; 1 3 5 7 2 ; 3 -2 4 7 2]

a11 = a(1,1)
a23 = a(2,3)
a
UltimoElementoSegundaFila = a(2,end)
UltimoElementoTerceraColumna = a(end,3)

% : hace referencia a todos los elementos (de una fila, de una columna, de
% una matriz)
a
SegundafilaCompleta = a(2,:)
UltimaColumnaCompleta = a(:,end)

% Para acceder a todos los elementos de una matriz y almacenarlos en un
% vector columna
a
b = a(:) 

% EJEMPLOS:
clc, clear
A = [1 4 6 9 -1 ; 2 4 9 11 5 ; 1 3 5 7 2 ; 3 -2 4 7 2]

% Cuatro Primeros valores de la segunda fila
A(2,[1 2 3 4])
A(2,1:4)
f = 2; numElem = 1:4; A(f,numElem)

% ¿Qué obtenemos en estas llamadas a elemento de A?
A
f = [2 1]; A(f,:) % la fila 2 y 1  con todos sus elementos
c = [1 4], A(end,c) % la ultimna fila y la columna 1 y 4
A(2:3,1:2:5) % la fila 2 y 3 y los elementos 1,3,5

% CREAR UNA MATRIZ B DONDE SE INTERCAMBIEN LAS DOS PRIMERAS FILAS DE A
B = A([2 1 3:end],:)


% Guardar en B, la segunda fila de A



B = A(2,:)

% Eliminar de B el número de la segunda columna: 
B = B(1,[1 3:end])
B = B([1 3:end]) % al ser un vector no hay que indicar filas y columnas,
                 % sólo el número de elemento
B(2) = []

% Eliminar de A la segunda y cuarta fila de A



A([2 4],:) = []

% Añadir el contenido de B debajo de A




A = [A ; B]

% Hacer que las matrices encajen


B = [B 1 2 3]
A = [A ; B]

% Añadir una nueva columna a A con valores 5, 10 y 15



A = [A [5; 10; 15]]

% Modificar A y poner el contenido de las tres últimas columnas,
% debajo de las tres primeras




A1 = A(:,1:3)
A2 = A(:,4:end)
A = [A1; A2]


%% Ejercicios para practicar:

% Sea a = [1 4 6 9 -1 ; 2 4 9 11 5 ; 1 3 5 7 2 ; 3 -2 4 7 2]

% Accede a los dos primeros elementos de la tercera columna

% Accede a al primer y tercer elemento de la segunda fila    

% Accede a los elementos 1, 2 y 4 de la última fila      

% Accede a la matriz 3x3 centrada en el elemento de la fila 2, columna 3

% Elimina la segunda columna de a

% Intercambia segunda y tercera columna de a



%% OPERACIONES CON ELEMENTOS Y MATRICES

clear

A = round(5*rand(2))   %matriz de 2x2
B = round(10*rand(3,2))

[A B] ; [A;B]

% Operaciones con constantes
A
A+1
2*A
A/2
(3+2*A)/23*ones(2)

A
A^2   % AxA
A.^2  % cada elemento de la matriz de A elevarlo al cuadrado


% Operaciones entre matrices
A+B
B(3,:) = [];
A
B
A+B

A = [1 0 5]; B = [2 4 1];
A*B  % PRODUCTO MATRICIAL
A, B'
PMatric = A*B'  
A, B
PPunto_a_Punto = A.*B
A.^B

%% TIPO DE DATOS: LÓGICO
% logical ; un bit

%% TIPOS DE DATOS: NUMÉRICOS
% int8 ; entero con signo de 8 bits
% int16 ; entero con signo de 16 bits
% int32 ; entero con signo de 32 bits
% int64 ; entero con signo de 64 bits
% uint8 ; entero sin signo de 8 bits
% uint16 ; entero sin signo de 16 bits
% uint32 ; entero sin signo de 32 bits
% uint64 ; entero sin signo de 64 bits
% single ; real de punto flotante con 4 bytes
% double ; real de punto flotante

A = uint8(200); whos A
B = A+55
C = A+200  
% Las variables de salida se generan con el mismo formato de las de entrada



%% DEFINICION DE VARIABLES TIPO CARÁCTER Y CADENAS DE TEXTO

A = 'Hola' % A es matriz 1x4
whos A
PrimerCaracter = A(1)

% Tratar tipo char de caracteres, es a todos los efectos tratar números
% (códigos ascii)
double(A)

B = 'Como estas'; % B es matriz 1x10

C = [A; B] % error no se puede tiene q ser un string 


%% PARA COMBINAR CADENAS DE DISTINTA LONGITUD O VARIABLES DE DISTINTO TIPO

% USAR UN ARRAY DE STRINGS
A = "Hola"  % A es matriz 1x1
whos A
B = "Como estas"; % B es matriz 1x1
C = [A; B]

% USAR CELDAS, VARIABLES FORMATO TIPO CELL (MATRICES DE CELDAS, CADA CELDA
% PUEDE CONTENER DISTINTO TIPO DE INFORMACIÓN)

% Para crear variables tipo celdas, se utilizan las llaves {}, no los
% corchetes
C = cell('');   whos C
C{1,1} = A;
C{1,2} = B;
whos C
C
C = {A, B}
C

C = [C ; {'Estoy bien', 'Gracias'}];

C  

C(1,2) % con () nos referimos a la celda de la primera fila, segunda columna
C{1,2} % al utilizar llaves, accedemos al contenido de la celda

% Podemos mezclar en las celdas distintos tipos de datos
D = cell('');  %D = cell(3,1);
D{1,1} = 'Hola';
D{2,1} = true;
D{3,1} = 2*eye(3);
D
D'

% Los arrays de celdas permiten almacenar conjuntos de datos heterogéneos,
% de distinto tipo
D = cell('');
numDatos = 200;
D{1,1} = rand(numDatos,1);  % una matriz de 200x1 y como esw rand desde 0 a 1 
D{1,2} = round(2*rand(numDatos,1));
datos = categorical();
datos(1:2:numDatos,1) = categorical("hombre");
datos(2:2:numDatos,1) = "mujer";
D{1,3} = datos;



%% DEFINICIÓN VARIABLES TIPO ESTRUCTURAS

Campos = [];
Campos.opciones = [];
Campos.valores = [];
Campos.opciones{1} = 'Escalado';
Campos.opciones{2} = 'Normalizacion';
Campos.valores{1,1} = true;
Campos.valores{1,2} = false;
Campos.valores{2,1} = [3 2];
Campos.valores{2,2} = ones(2);


%% VENTANAS TIPO FIGURE Y REPRESENTACIONES CON PLOT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% EJEMPLO REPRESENTACIONES CON PLOT
figure
figure('Name', 'Esta es la Figura Numero 2')
figure(4), set(4, 'Name', 'Esta es la figura 4')

close all % Cierra todas las ventanas tipo figure

% REPRESENTAR UN SENO ENTRE 0 Y 2PI
clear

 x=0:2*pi/1000:2*pi;
 y=sin(x);
 
 figure % crea una ventana gráfica y es la actual
 plot(x,y); % dibuja gráfico en ventana actual (y frente a x)
 
 xlabel('Grados en radii') % texto para el eje x
 ylabel('Seno') % texto para el eje y
 title ('Ejemplo') % texto para el título
 XMIN = 0; XMAX = 7; YMIN = -1.2; YMAX = 1.2;
 axis([XMIN XMAX YMIN YMAX])  % rango de la dimension de la imagen de representacion
 
 
 % REPRESENTAR EN EL MISMO GRÁFICO DOS SENOS DESPLAZADOS DEL ANTERIOR
 
 y1=sin(x-0.25); % otra función
 y2=sin(x-0.5); % otra función
 hold on % mantiene la ventana anterior para que se dibuje en ella el próximo gráfico sin borrar dicha ventana
 plot(x,y1,'.r', x,y2,'g') % dos curvas  .r se refiere a puntos rojos y la g con color verde
 legend('sen(x)','sen(x-0.25)','sen(x-0.5)') % leyendas con el mismo orden que se han representado
 grid on % para dibujar
 
 
 % EJEMPLO DE REPRESENTACIÓN EN 3D
 valores = -4*pi:0.1:4*pi;
 xnew = sin(valores);
 ynew = cos(valores);
 znew = valores;
 figure,
 plot3(xnew,ynew,znew)
 
 % Varias gráficas en una misma ventana
 figure,
 subplot(1,2,1),   % en una figura representa las dos gaficas en una fila con la primera grafica a la izq
 plot(x,y, 'b', x,y1,'.r', x,y2,'g')
 legend('sen(x)','sen(x-0.25)','sen(x-0.5)') % leyendas
 subplot(1,2,2), plot3(xnew,ynew,znew), grid on
 
 close all
 
 %% FAMILIARIZARSE CON ALGUNAS FUNCIONES MATLAB GENÉRICAS
 
% addpath  
% Lee el fichero .mat del directorio datos
load variables.mat

addpath('datos')
load variables.mat
clear, rmpath('datos')

addpath('./datos')
load variables.mat
clear, rmpath('./datos')


%  ceil, floor, round

% unique
A = round(10*rand(1,10))
unique(A) % vector fila, A es vector fila y devulve los valores de A sin repeticion
B = round(10*rand(3))
unique(B) % vector columna, hace la operación con B(:), que es vector columna


%  sum, prod, max, min, mean, std, median

% Crea una matriz 2x3 y calcula: 
% Vector fila que contenga la suma de cada columna
% Vector columna que contenga el producto de cada fila
% Media de todos elmentos

clear
A = round(10*rand(2,3))
sum(A)      % suma columna x columna el resultado es una matriz 1*3
sum(A,2)    % suma fila x fila horizontalmente el resultado es una matriz 2*1
sum(sum(A))  % suma total de todos los elementos
sum(A(:))   % sumar todos los elementos

A
prod(A,2) % producto total  el resultado es 2*1

A
mean(A)  % media de cada columna
mean(A(:)) % media de toda la matriz

%  length (para vectores sólo), size
A = round(10*rand(1,10))
length(A) % num de elementos de un vector solo para vectores

A = round(10*rand(2,3))
[numFilas, numColumnas] = size(A) % para saber la dimensiones
size(A,1) % número de filas
size(A,2) % número de columnas

A = round(10*rand(2,3,3))  %crear una variable con tres  matrices de 2*3 para acceder a cada una A(:,:,i) --> i=1,2,3
whos A



% Guardar en B, la segunda matriz de A
B = A(:,:,2);



%%  SENTENCIAS DE CONTROL DE FLUJO: if, switch, for, while 
% Funciones de modificación/interrupción de flujo en bucles: continue,
% break

% Consultar sintaxis en material facilitado


%% OPERADORES RELACIONALES 
% eq - Equal = =
% ne - Not equal ~ =
% lt - Less than <
% gt - Greater than >
% le - Less than or equal < =
% ge - Greater than or equal > =
 

%% OPERADORES LÓGICOS 
% and - Logical AND &
% or - Logical OR |
% not - Logical NOT ~
% xor - Logical EXCLUSIVE OR
% any - True if any element of vector is nonzero
% all - True if all elements of vector are nonzero

%% SCRIPTS Y FUNCIONES

% CREAR FUNCION SUMA DE TRES ELEMENTOS, TIPO UINT8, Y COMPROBAR SU
% FUNCIONAMIENTO. GUARDA LA FUNCION EN UN DIRECTORIO LLAMADO funciones, y
% añade el path de este directorio para llamarla

addpath('Funciones')  % cargar la carpeta con esa ruta
A = funcion_suma(2,3,4)

A = funcion_suma(200,300,400)
rmpath('Funciones')   % hay q hacerlo elimina la ruta del directorio 


%% EJERCICIOS PROPUESTOS

% Ejercicio1: 
% a) Crea un vector V de 10 elementos con números aleatorios enteros entre 0 y 10.
V = round(10*rand(1,10))
% b) Genera un vector binario donde el 1 binario señala a los elementos
% del vector que son menores o iguales a 5.
[nF,nC] = size(V)

B = false(nF,nC)
for i=1:nC

    if V(1,i)<=5
        B(1,i) = true;
    end

end 

 % otra solucion
 B= V <= 5;

% c) Encuentra con la función find las posiciones en el vector de esos elementos
find(B) % o find(V<=5)
V(find(B))

% d) Encuentra la posición del valor máximo de V
[Vmax, posVmax] = max(V)  %devulve el valor maximo y la posicion pero solo uno
  %o
find(V == max(V))  % devuelve  todas las posiciones del valor maximo

% e) Ordena los elmentos del vector, de mayor a menor, obteniendo las
% posiciones donde se encuentran en V
Vord = sort(V,'descend') % ordenar en orden descendente
[Vord, posVord] = sort(V,'descend') % devulve las posiciones de los elementos
V(posVord(2)) % saber el elemento q esta en esa posicion ordenado

% Ejercicio2: 
% a) Crea una matriz M de 2 filas y 3 columnas con números enteros aleatorios
% entre 0 y 10.
M = round(10*rand(2,3))
% b) Genera una matriz binaria de las mismas dimensiones, que indique los 
% valores en M que tienen valores entre 3 y 8
Mbin= M <=8 & M>=3 

Mbin=false(size(M))
[nF,nC] = size(M);
for i=1:size(M,1)
    for j=1:size(M,2)
      if and(M(i,j)>=3, M(i,j)<=8)
         Mbin(i,j)=true;
      end
    end
end
[M; Mbin]

% c) Calcula la media de esos elementos
Mbin= M <=8 & M>=3 
mean(M(Mbin))

suma =0;
media =0;
numEle = 0;
for i=1:size(M,1)
    for j=1:size(M,2)
      if and(M(i,j)>=3, M(i,j)<=8)
        suma = suma + M(i,j);
        numEle = numEle + 1;
      end
    end
end
media= suma / numEle;
% d) Reemplaza el valor de esos elementos, asignándoles un valor -1
M(Mbin)= -1

% OBSERVACIÓN: 
% LOS EJERCICIOS 1 Y 2 SE DEBEN HACER DE DOS FORMAS:
% 1.- PRACTICANDO PROGRAMACIÓN BUCLE FOR Y SENTENCIA IF
% 2.- UTILIZANDO PROGRAMACIÓN MATRICIAL DE MATLAB


% Ejercicio3:
% a) Genera dos matrices A y B, 5x5, de números enteros aleatorios entre 0 y 10
% b) Calcula la media de los valores de A en aquellos puntos donde B es > 5
 A= round(10*rand(5));
 B= round(10*rand(5));
  
 valorMedia= mean(A(B>5))

% Ejercicio4:
% a) Generar una matriz A, 10x10, de números enteros aleatorios entre 0 y 5 
% b) Guarda en un vector fila, llamado valoresA, los valores distintos
% que aparecen en A 
% c) Inicializa con ceros un vector fila, llamado conteoValores,
% de tantos elementos como valores distintos haya en A
% d) Guarda en las posiciones de conteoValores el número de veces que
% aparece en A cada uno de sus posiles valores
% e) Representa con stem, valoresA frente a conteoValores

A= round(5*rand(10));

valoresA= unique(A)'

conteoValores= zeros(size(valoresA)) % o conteoValores= zeros(1,length(valoresA))
for i=1:size(A,1)
  for j=1:size(A,2)
      valorInteres = A(i,j);
      conteoValores(valorInteres+1) = conteoValores(valorInteres+1) + 1;
  end
end

stem(valoresA,conteoValores,'.r'), grid on

for i=1:length(conteoValores)
      valorOI = valoresA(i);
      matrizOI = double(A ==valorOI);
      conteoValores(i)=sum(matrizOI(:));
end
stem(valoresA,conteoValores,'.r'), grid on

% Ejercicio5:

% Función: varLogica = funcion_compara_matrices(m1,m2)

% Diseñar una función que reciba como entradas dos matrices de la misma
% dimensión. La función debe devolver una variable lógica, con true si las
% matrices son iguales y false  en caso contrario.
% Para ello la función deberá:
% - Calcular una matriz diferencias (resta de las dos matrices de entrada)
% - Calcula el valor máximo y mínimo de esta matriz diferencias
% - Si el valor máximo es igual al valor mínimo y cualquiera de ellos tiene
% el valor 0, entonces las matrices de entrada son iguales

% Observación: si las matrices no tienen la misma dimensión la función
% únicamente debe advertir por el command window este hecho (para ello,
% puedes utilizar la función display('cadena de texto a mostrar').

% Guardar la función en un directorio llamado funciones, y, añadiendo el
% path a este directorio, llámala en distintas situaciones para comprobar
% su correcto funcionamiento.

addpath('Ejercico5')
v=[1 2 3 4];
A= [v; 2*v; v/2; v+4;];
B= [v; 2*v; v/2; v+4;];
R = funcion_compara_matrices(A,B);
  if(R==false)
       display('la dos matrices no son iguales.')
  else
      display('la dos matrices son iguales.')
  end
rmpath('Ejercico5')
