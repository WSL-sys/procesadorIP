function SP = calcular_IP(objEstacion,stack)
%objEstacion = calcular_IP(X,objEstacion,objTransmisor)p
%Calcula la cargabilidad y restistividad a partir del stack definido en
%objEstacion.
%La frecuencia de la señal transmitida se extrae de objTransmisor.

%obtiene el stack
%stack = get(objEstacion,'senalStackeada');
stack=fasestack(stack);%/max(stack);
%info. para calcular cargabilidad y resistividad.
%corriente = get(objEstacion,'corriente'); %corriente transmitida durante la medicion.
%frecuencia = get(objEstacion,'frecuencia'); %frecuencia de la señal transmitida durante la medicion.
ganancia = get(objEstacion,'ganancia');
%Xr1 = get(objEstacion,'Xr1');
%Xr2 = get(objEstacion,'Xr2');
corte = get(objEstacion,'corte');
%Xt1 = get(objEstacion,'Xt1');
%Xt2 = get(objEstacion,'Xt2');
datos = get(objEstacion,'X');
datos_header = datos.header;
f_muestreo = datos_header.f_muestreo; %frecuencia de muestreo.
perVmax=0.1;

[SP]=calcSPx(stack,f_muestreo,perVmax);

%Se guardan los resultados actuales
objEstacion = set(objEstacion,'SP',SP);



    