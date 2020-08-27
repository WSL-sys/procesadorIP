function objEstacion = calcular_IP(objEstacion)
%objEstacion = calcular_IP(X,objEstacion,objTransmisor)p
%Calcula la cargabilidad y restistividad a partir del stack definido en
%objEstacion.
%La frecuencia de la señal transmitida se extrae de objTransmisor.

%obtiene el stack
stack = get(objEstacion,'senalStackeada');
stack=fasestack(stack);%/max(stack);
%info. para calcular cargabilidad y resistividad.
corriente = get(objEstacion,'corriente'); %corriente transmitida durante la medicion.
frecuencia = get(objEstacion,'frecuencia'); %frecuencia de la señal transmitida durante la medicion.
ganancia = get(objEstacion,'ganancia');
Xr1 = get(objEstacion,'Xr1');
Xr2 = get(objEstacion,'Xr2');
corte = get(objEstacion,'corte');
Xt1 = get(objEstacion,'Xt1');
Xt2 = get(objEstacion,'Xt2');

datos = get(objEstacion,'X');
datos_header = datos.header;
f_muestreo = datos_header.f_muestreo; %frecuencia de muestreo.

% Parámetros nuevos definidos
W= 0.24:0.08:2;
perVmax=0.1;

%Imprime los parametros usados para calcular...
% disp('Calculo de Cargabilidad y Resistividad');
% disp('======================================');
% disp(['corriente transmistida: ' num2str(corriente)]);
% disp(['frecuencia transmistida: ' num2str(frecuencia)]);
% disp(['ganancia receptor: ' num2str(ganancia)]);
% disp(['f_muestreo: ' num2str(f_muestreo)]);

%% Función calcIP - Modificación PIA
%Calcula cosas IP
size(stack)
[decayW,decayT,NMIP,R,V]=calcIPx(stack,W,f_muestreo,corriente,perVmax);
cargabilidad=NMIP;

%Calcula la resistividad
%[resultado,sum_data,datos_IP]=calculo_IP(stack,f_muestreo,frecuencia,corriente,ganancia,corte);
resistividad = R;% resultado(2) %resistividad (V/I) sin factor geometrico!.

%Polo dipolo
%a = abs(Xr2-Xr1);
%b = min(abs(Xr1-Xt2),abs(Xr2-Xt2));
%factor_geometrico = 2*pi*b*(a+b)/a;
%'Xt2'
%Xt2 
%Xt1
if Xt1 == Xt2
    factor_geometrico = abs(1/((1/(2*pi))*(1/abs(Xr1-Xt2)-1/abs(Xr2-Xt2))));
else
    factor_geometrico = abs(1/((1/(2*pi))*(1/abs(Xr1-Xt1)-1/abs(Xr1-Xt2)-1/abs(Xr2-Xt1)+1/abs(Xr2-Xt2))));
end
resistividad = resistividad*factor_geometrico;

N=[round(0.45*f_muestreo):round(1.1*f_muestreo)];

%Se copian los datos anteriores
objEstacion = set(objEstacion,'cargAnt',get(objEstacion,'carg'));
objEstacion = set(objEstacion,'resAnt',get(objEstacion,'res'));
objEstacion = set(objEstacion,'curva_IPAnt',get(objEstacion,'curva_IP'));
objEstacion = set(objEstacion,'mini_stackAnt',get(objEstacion,'mini_stack'));

%Se guardan los resultados actuales
objEstacion = set(objEstacion,'carg',cargabilidad);
objEstacion = set(objEstacion,'res',resistividad);
objEstacion = set(objEstacion,'V',V);

dW=(W(1:(end-1))+W(2:end))/2;
objEstacion = set(objEstacion,'curva_IP',[dW' decayW']);
T = (1:length(decayT))/f_muestreo;
objEstacion = set(objEstacion,'mini_stack',[T' decayT']);
%objEstacion

objEstacion = set(objEstacion,'senalStackeada',stack);

cargabilidad
resistividad


%%

% %Calcula la resistividad y la cargabilidad.
% [resultado,sum_data,datos_IP]=calculo_IP(stack,f_muestreo,frecuencia,corriente,ganancia,corte);
% 
% cargabilidad = resultado(1); %cargabilidad de Newport.
% resistividad = resultado(2); %resistividad (V/I) sin factor geometrico!.
% 
% %Polo dipolo
% a = abs(Xr2-Xr1);
% b = abs(Xr1-Xt2);
% factor_geometrico = 2*pi*b*(a+b)/a;
% resistividad = resistividad*factor_geometrico;

%Se copian los datos anteriores
% objEstacion = set(objEstacion,'cargAnt',get(objEstacion,'carg'));
% objEstacion = set(objEstacion,'resAnt',get(objEstacion,'res'));
% objEstacion = set(objEstacion,'curva_IPAnt',get(objEstacion,'curva_IP'));
% objEstacion = set(objEstacion,'mini_stackAnt',get(objEstacion,'mini_stack'));
% 
% %Se guardan los resultados actuales
% objEstacion = set(objEstacion,'carg',cargabilidad);
% objEstacion = set(objEstacion,'res',resistividad);
% objEstacion = set(objEstacion,'curva_IP',datos_IP);
% objEstacion = set(objEstacion,'mini_stack',sum_data);
% cargabilidad
% resistividad
% disp('Resultados');
% disp('======================================');
% disp(['cargabilidad: ' num2str(cargabilidad)]);
% disp(['resistividad: ' num2str(resistividad)]);



%% 
function [resultado,sum_data2,datos_IP]=calculo_IP(datos,f_muestreo,f_trans,corrienteT,gain,corte)
%function [resultado,sum_data,datos_IP]=calculo_IP(datos,freq,corrienteT)
%Calcula la cargabilidad y la resistividad.

    freq = round(f_muestreo/(8*f_trans)); %OJO!!!
    corte = freq*2;
    N=round(freq/10);
    sum_data = (datos)/gain*2.45/2^23;
    prom = abs(mean(sum_data((corte-2*N):(corte-N))));
    
    ini_IP = round(0.45*f_muestreo+corte);
    fin_IP = round(1.1*f_muestreo+corte);
    F=240:80:2000;   
    
    %calcula la curva de cargabilidad.
    vent(length(F)-1)=0;
    datos_IP(length(F)-1,2)=0;
    for i = 1:(length(F)-1)
        ini_ = round(F(i)*f_muestreo/1000);%*f_muestreo/1000)+corte;
        fin_ = round(F(i+1)*f_muestreo/1000);%*f_muestreo/1000)+corte;
        datos_IP(i,1) =(F(i)+F(i+1))/2;
        datos_IP(i,2) =median((sum_data(ini_:fin_)))/prom*1000; %/f_muestreo/prom*1000;
        vent(i) =  (-F(i)+F(i+1));

    end

    %calcula la resistividad y el IP-
    iniRi_ = round(0.20*freq);
    finRi_ = round(0.80*freq);
    
    %resultado(1) = sum(datos_IP(:,2).*(round(inter(:,2)-inter(:,1))))/(inter(end,2)-inter(1,1));
    factor_magico = 1/(sum(vent)); %Factor para el estandar de Newmont (Ref. Manual de Time Domain Induced Polarization Program Zonge. Pag. 17. sec. 9)
    resultado(1) = median(sum_data(ini_IP:fin_IP))/(prom)*1000; %mseg cargabilidad Newmont
    resultado(2) = abs(mean(sum_data(iniRi_:finRi_))/corrienteT); %Resistividad.
    
    %Le agrega el tiempo a ministack.
    sum_data2(:,1) = (1:(length(sum_data)))/f_muestreo; %en milisegudos..
    size(sum_data)
    sum_data2(:,2) = sum_data;
    