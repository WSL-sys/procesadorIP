function objEst=filtro_nivel(objEst,lim_superior,lim_inferior,orientacion,tipoCorte)
%Limita la señal entre lim_inferior y lim_superior de forma 
%horizontal y vertical. si orientacion es 1 es de forma horizontal
%si orientacion es 2 es de forma vertical.
objX = get(objEst,'X');
X = objX.datos;
largo = length(X);
Y=X;
tiempo = objX.tiempo;
n_pag = objX.n_paginas;
if orientacion == 1
    header = objX.header;
    n_muestras = header.n_muestras;
    freq_m = header.f_muestreo;
    lim_sup = lim_superior*freq_m;
    lim_inf = lim_inferior*freq_m;
    sup = (floor(lim_sup/n_muestras))*(n_muestras);
    inf = ((ceil(lim_inf/n_muestras))*(n_muestras)) + 1;
    if tipoCorte == 1
        Y(inf:sup)=0; % rellena con ceros
    else
        Y = Y(inf:sup); % corta la señal
        tiempo = tiempo(inf:sup); % corta el tiempo
        n_pag =(sup-inf+1)/n_muestras;
    end
else   
    for i = 1:largo
        Y(i) = X(i);
        if X(i)>lim_superior
            Y(i)=lim_superior;
        end

        if X(i)<lim_inferior
            Y(i)=lim_inferior;
        end
    end
end
objX.datos = Y;
objX.tiempo = tiempo;
objX.n_paginas = n_pag;
objEst = set(objEst,'X',objX);
