function datosF=pasa_banda(arr,fm,f0,f1,f2,f3,g0,g1,g2,g3)

%obtiene los parámetros de la estacion.
%X = get(objEst,'X');
%header = X.header;
%canal = get(objEst,'canal');
%ruido = get(objEst,'ruidoTelurico');
datos = arr;%X.datos;
%datos = datos;
f_muestreo = fm;%header.f_muestreo;

%señal refleja para corregir Gibbs
l = length(datos);
datos = [datos(:);datos(end:-1:1)];

%crea la impedancia.
largo = length(datos);
Z.frecuencia = [f0,f1,f2,f3]; %la mitad de la frecuencia debido a la corrección refleja de Gibbs
Z.real = [g0 g1 g2 g3];
Z.imag = [0 0 0 0 ];


%funcion de transferencia del filtro (con interpolacion lineal).
H = Z2Hall(Z,f_muestreo,largo);
%filtrado con fft (convolución es lento para arreglos largos).
H(1)=1;
datosF = real(ifft(H'.*fft(datos)));

%hold off
%plot(stackear(datos,150,0.125));


%coloca el resto como ruido telurico.
datosF = datosF(1:l);
%datos = datos(1:l);


%if restar
%    X.datos = datosF;
%else
%    if length(ruido)==0
%        ruido = datos - datosF;
%    else
%        ruido = ruido + datos -datosF;
%    end
%    X.datos = datos;%F;
%end
%objEst = set(objEst,'X',X);
%objEst = set(objEst,'ruidoTelurico',ruido);
%arr=datosF;
