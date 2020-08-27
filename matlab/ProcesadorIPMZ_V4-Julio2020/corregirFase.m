function corte = corregirFace(objEst)
%muestrea la primera señal del transmisor.
corte = 0;

%senal = stackear(objEst);
%X = get(objEst,'X');
%header = X.header;
%f_m= header.f_muestreo;
%f_t=get(objEst,'frecuencia');
%delta = round(f_m/f_t);
%senal de referencia
%freq=round(delta/8);
%senal_aux(1:freq)=1;
%senal_aux(freq+1:3*freq)=0;
%senal_aux(3*freq+1:5*freq)=-1;
%senal_aux(5*freq+1:freq*7)=0;
%senal_aux(7*freq+1:delta)=1;

%calcula el punto de máxima correlación
% corr(1:8)=0;
% for i = 1:8
%     ind =delta*(i-1)/8;
%     m=rotar(senal_aux ,ind)';
%     corr(i) = dot(m,senal-mean(senal));
% end
% [a,maximo] = max((corr));
% d=(maximo-1)*delta/8+1;
% corte = d + 29;
%Y=X(corte:length(X));    