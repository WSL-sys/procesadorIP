function X=stackear(objEst)
%X=stackear(Y,fmuestreo,frecT)
%stackea las mediciones de una estacion IP

%fmuestreo = obj_IP.X.header.f_muestreo; %frecuencia de muestreo
objX = get(objEst,'X');
headerX = objX.header;
fmuestreo = headerX.f_muestreo;
frecT = get(objEst,'frecuencia');
Y = objX.datos;
%frecT = obj_IP.freqT; %frecuencia del transmisor
%Y = stack_sync(Y,150,0.125,'nssy'); %sincronizar la senal de IP para stackeo. 

canales = 1; %frecuencia del transmisor
delta = round(fmuestreo/frecT);
N = floor(length(Y)/delta);

X(1:delta)=0;

    for i = 2:N
        %ignora el primer stack para evitar el filtrado
    X(:) = X(:) + Y(delta*(i-1)+1:delta*(i));
    end
    X(:) = X(:)/(N-1);
    %X(:) = X(:)-mean(X(:));


  X=fasestack(X);
    
    
    