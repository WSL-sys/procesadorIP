function H=Z2H(Z,f_muestreo,n_muestras)
%H=Z2H(Z,f_muestreo,n_muestras)
%Devuelve el espectro de Z (impedancia) en un arreglo con n_muestras y de acuerdo a f_muestreo.
%Z esta definido como un objeto con:
%Z.frecuencia().
%Z.real().
%Z.imag(). (radianes)
%usa interpolación lineal (alguna mejor idea??). 
'hola esoy aqui3'
%si Z no esta definido entonces, devuelve un espectro plano. 
H(1:n_muestras) =  0;
    %la frecuencia de i=1 tiene que ser mayor que 0. La impedancia en 0
    %devería ser (0 + j*0), aqui se esta usando (1 + j*0) para probar....

    Fstep = f_muestreo/(n_muestras); %paso minimo de frecuencias.
    ini = 1;
    fin = n_muestras;
    frec_ini = 0;
    real_ini = Z.real(1);
    im_ini = Z.imag(1);
    
    %calcula si es par o impar
    par = 0;
    if mod(n_muestras,2) > 0
        par = 1;
    end
        %ajusta la definicion de espectro si no esta completa.
    largo = length(Z.frecuencia);
    if Z.frecuencia(largo) < f_muestreo/2
        Z.frecuencia(largo+1) = f_muestreo/2;
        Z.real(largo+1)=Z.real(largo);
        Z.imag(largo+1)=Z.imag(largo);
    end

    %calcula el ruido
    for i = 1:length(Z.frecuencia)
        
        %limites de la interpolación lineal en la interación i
        fin = round(Z.frecuencia(i)/Fstep) + 1;
        frec_fin = Z.frecuencia(i);
        real_fin = Z.real(i);
        im_fin = Z.imag(i);
        
        %parámetros de ecuacion de la recta para interpolación 
        if(ini==fin)
            pend_R =0;
            pend_I =0;
        else
            pend_R = (real_fin - real_ini)/(fin-ini);
            pend_I = (im_fin - im_ini)/(fin-ini);
        end
        const_R = real_ini;
        const_I =  im_ini;
                    
        
        %asigna la interpolacion lineal del espectro
        for j = ini:fin
            if j <= (n_muestras + par)/2 +1 
                H(j) = ((j-ini)*pend_R + const_R) + (-1)^(1/2)*((j-ini)*pend_I + const_I);  
            end
            
        end 
        
        ini = fin + 1;
        frec_ini = Z.frecuencia(i);
        real_ini = Z.real(i);
        im_ini = Z.imag(i);
    end
  
    %calcula el espectro inverso.
    indices = (n_muestras + par)/2:-1:2;    
    H((n_muestras+ par)/2 + 2 - par: n_muestras) = conj(H(indices));
    


%Enredo con loa arreglos pares e impares en fft....
%
%ARREGLOS PARES...
%En los arreglo pares la correspondencia entre frecuencias y muestras en la
%fft es:
% dF = frec_muestreo/n_muestras
% frec 0 = indice 1
% frec dF = indice 2
% frec 2*dF = indice 3
%    .  
%    .
% frec N*dF = indice N+1
%
% indice/(N+1)*dF = frec
% frec/dF + 1 = indice 
% limite entre espectro directo e inverso = n_muestras/2 + 1.
% ambos espectros comparten este valor que corresponde a f_muestreo/2.
%
%
%ARREGLOS IMPARES...
%En los arreglo pares la correspondencia entre frecuencias y muestras en la
%fft es:
% dF = frec_muestreo/n_muestras
% frec 0 = indice 1
% frec dF = indice 2
% frec 2*dF = indice 3
%    .  
%    .
% frec N*dF = indice N+1
%
% indice/(N+1)*dF = frec
% frec/dF + 1 = indice 
% la mitad de la frecuencia de muestro no tiene indice, por lo que el espectro directo se define hasta:
% espectro directo = FFT(1:(n_muestras+1)/2)
% espectro inverso = FFT( (n_muestras+1)/2 + 1:n_muestras)
% el espectro inverso tiene (n_muestras+1)/2 (la muestra en 0, indice 1)
% el espectro directo tiene (n_muestras+1)/2


