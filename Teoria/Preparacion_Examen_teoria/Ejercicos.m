% Ejercico1

x1=[1;2;2;2;2;3;3;4;5;1];
x2=[3;1;2;3;4;2;3;3;2;2];
datos_C1=[x1 x2];

x1=[4;5;5;4;6;6;6;7;4;8];
x2=[5;5;6;7;5;6;7;6;6;7];
datos_C2=[x1 x2];

M1=mean(datos_C1)';   M2=mean(datos_C2)';

x1=sym('x1','real');
x2=sym('x2','real');
X=[x1;x2];

d1=expand(-(X-M1)'*(X-M1)); vpa(d1,2);
d2=expand(-(X-M2)'*(X-M2)); vpa(d2,2);
d12=d1-d2; vpa(d12,2)


%Ejercico2 no es clasificador lda no se considera desvalanceo osea q te
%queda con la formula de mahalanobis tal cual no sumamos un temino de
%desbalanceo al ser las dos clases no son balanceadas 

C1=[ 2 1
    3 2
    3 3
    4 2
    ];

C2=[ 6 1
    5 2
    7 3
    ];

numDatosClase1=4;
numDatosClase2=3;
numDatos=numDatosClase2+numDatosClase1;

M1=mean(C1)'; M2=mean(C2)';
mCov1=cov(C1); mCov2=cov(C2);
mCov=((numDatosClase1-1)*mCov1+(numDatosClase2-1)*mCov2)/(numDatos-2); % matriz de covarianza comun

x1=sym('x1','real');
x2=sym('x2','real');
X=[x1;x2];

d1=expand(-(X-M1)'*pinv(mCov)*(X-M1)); vpa(d1,2);
d2=expand(-(X-M2)'*pinv(mCov)*(X-M2)); vpa(d2,2);
d12=d1-d2; vpa(d12,2)


%Ejercico3


M1=[0;3]; M2=[5;2]; M3=[1;0];
mCov=[0.5 0; 0 0.25];


x1=sym('x1','real');
x2=sym('x2','real');
X=[x1;x2];

d1=expand(-(X-M1)'*pinv(mCov)*(X-M1)); 
d2=expand(-(X-M2)'*pinv(mCov)*(X-M2));
d3=expand(-(X-M3)'*pinv(mCov)*(X-M3));

d12=d1-d2;
d13=d1-d3;
d23=d2-d3;