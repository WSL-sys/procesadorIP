function datosStackeados = execute(X,objEst)
% Aplica el stack a la medicion correspondiente segun el stack asignado
objEst = sincro_senal(objEst);
gain = get(objEst,'ganancia');
%headerX = objX.header;
%gain = headerX.gain;
'hola'
switch X.nombre
    case 'Normal'
        % funcion para el stack normal
        It = str2num(X.params{2});
        objX = get(objEst,'X');
        arr = objX.datos;
        objX.datos=phaseFR(arr,It);
        objEst = set(objEst,'X',objX);
        datosStackeados = stackear(objEst);
        datosStackeados = ToVolt(datosStackeados,gain);
    case 'Robusto'
        % funcion para stack robusto
        X.params
        tol = str2num(X.params{1});
        It = str2num(X.params{2});
        objX = get(objEst,'X');
        arr = objX.datos;
        objX.datos=phaseFR(arr,It);
        objEst = set(objEst,'X',objX);
        
        datosStackeados = stackear_robusto(objEst,tol);
        datosStackeados = ToVolt(datosStackeados,gain);
    case 'Tiempos'
        % funcion para stack por tiempos
    case 'Halvelson'
        % funcion para stack de halvelson
end


function objEst = sincro_senal(objEst)
objX = get(objEst,'X');
headerX = objX.header;
f_m = headerX.f_muestreo;
f_t = get(objEst,'frecuencia');
Y = objX.datos;
d = get(objEst,'corte');
d=1;
delta = round(f_m/f_t);
%senal de referencia
freq=round(delta/8);
largo = floor((length(Y)-d)/delta)*delta;
largo
f_m
f_t
Y=Y(d:largo);
objX.datos = Y;
objEst = set(objEst,'X',objX);