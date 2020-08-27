function X = stackear_robusto(objEst,tol)%[X,coef,Ndatos]=stackear_robusto(Y,fmuestreo,frecT,tol)
%[X,coef,Ndatos]=stackear_robusto(Y,fmuestreo,frecT,tol)
%stackea las mediciones de una estacion IP

%Adquisicion de datos
objX = get(objEst,'X');
objX = get(objEst,'X');

Y = objX.datos;
header = objX.header;
frecT = get(objEst,'frecuencia');
fmuestreo = header.f_muestreo;

%********************************
%Y=get(objEst,'ruidoTelurico');
%********************************

%sincroniza.
% Y = stack_sync(Y,150,0.125,'nosync'); %sincronizar la senal de IP para stackeo. 

%fmuestreo = obj_IP.X.header.f_muestreo; %frecuencia de muestreo
%frecT = obj_IP.freqT; %frecuencia del transmisor
%canales = 1; %frecuencia del transmisor
delta = round(fmuestreo/frecT);
N = floor(length(Y)/delta);

%genera la señal cuadrada de referencia del transmisor.
largo=delta;
senal_aux(largo)=0;
freq=round(largo/8);
senal_aux(1:2*freq)=1;
senal_aux(2*freq+1:4*freq)=0;
senal_aux(4*freq+1:freq*6)=-1;
senal_aux(6*freq+1:freq*8)=0;
p_senal_aux = dot(senal_aux,senal_aux)^(1/2); 
%


X(1:delta)=0;
coef(1:N)=0;
coef_n(1:N)=0;
    for i = 2:N
        %ignora el primer stack para evitar el filtrado
        senal = Y(delta*(i-1)+1:delta*(i));
        mod = dot(senal-mean(senal),senal-mean(senal))^(1/2);
        if mod == 0 | p_senal_aux == 0
            coef(i) = 0;
        else
            coef(i) = (max(abs(xcorr(senal-mean(senal),senal_aux)))/mod/p_senal_aux); 
        end
        %X(:) = X(:) + senal*coef(i);%Y(delta*(i-1)+1:delta*(i));
    end

    coef = coef;
    coef_prom = mean(coef);
    Ndatos=0;
    for i = 2:N
        %ignora el primer stack para evitar el filtrado
        senal = Y(delta*(i-1)+1:delta*(i));
        if coef(i) < tol %coef_prom*tol
        %    X(:) = X(:) + senal*coef(i);%Y(delta*(i-1)+1:delta*(i));
            coef_n(i) = 0;
        else
            X(:) = X(:) + senal*coef(i);%Y(delta*(i-1)+1:delta*(i));       
            coef_n(i)=coef(i);
            Ndatos = Ndatos + 1;
        end
    end
    Ndatos=Ndatos/N;
    if sum(coef_n) == 0
        X = X*0;
    else
        X = X/sum(coef_n);
    end
    %objX.datos = X;
    %objEst = set(objEst,'X',objX);
%'hola'
X=fasestack(X);
