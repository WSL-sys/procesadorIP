function X = ToEstacionesTrans(ObjEst,str)
%objEstacion = ToEstacion(str)
%crea un objEstacion a partir de un string creado por el m�todo ToString. 
%
%String:
%<

X = objEstaciones();
c = X.caracter_separacion; %caracter de separacion

%asigna FILENAME
[str_tmp,str] = strtok(str,c);
X.filename = str_tmp;

%asigna FILE 
[str_tmp,str] = strtok(str,c);
X.file = str_tmp;

%asigna SERIE
[str_tmp,str] = strtok(str,c);
X.serie = round(str2num(str_tmp));

%asigna CANAL
[str_tmp,str] = strtok(str,c);
X.canal = round(str2num(str_tmp));

%asigna AZIMUT
[str_tmp,str] = strtok(str,c);
X.azimut = str2num(str_tmp);

%asigna GANANCIA
[str_tmp,str] = strtok(str,c);
X.ganancia = str2num(str_tmp);

%asigna Xr1
[str_tmp,str] = strtok(str,c);
X.Xr1 = str2num(str_tmp);

%asigna Xr2
[str_tmp,str] = strtok(str,c);
X.Xr2 = str2num(str_tmp);

%asigna delta_e
[str_tmp,str] = strtok(str,c);
X.delta_e = str2num(str_tmp);

%asigna XT1
[str_tmp,str] = strtok(str,c);
X.Xt1 = str2num(str_tmp);

%asigna XT2
[str_tmp,str] = strtok(str,c);
X.Xt2 = str2num(str_tmp);

%asigna FRECUENCIA
[str_tmp,str] = strtok(str,c);
X.frecuencia = str2num(str_tmp);

%asigna CORRIENTE
[str_tmp,str] = strtok(str,c);
X.corriente = str2num(str_tmp);

%asigna CALIBRACION
[str_tmp,str] = strtok(str,c);
X.calibracion = str_tmp;

%asigna CALIBRACION HX
[str_tmp,str] = strtok(str,c);
X.calibracionHx = str_tmp;

%asigna CALIBRACION HY
[str_tmp,str] = strtok(str,c);
X.calibracionHy = str_tmp;

%asigna resistividad
[str_tmp,str] = strtok(str,c);
X.res = str_tmp;

%asigna cargabilidad
[str_tmp,str] = strtok(str,c);
X.carg = str_tmp;

%asigna Tiempo de corte
[str_tmp,str] = strtok(str,c);
X.corte = str2num(str_tmp);

%asigna el archivo de se�al filtrada
[str_tmp,str] = strtok(str,c);
X.fileFiltrada = str_tmp;
fid = fopen(X.fileFiltrada,'rb');
if isequal(fid,-1)
else
    fclose(fid);
    senal = TSNfiles;
    X.senalFiltrada = open_TSN(senal,X.fileFiltrada,X.canal);
end

%asigna el archivo de se�al stackeada
[str_tmp,str] = strtok(str,c);
X.fileStackeada = str_tmp;
fid = fopen(X.fileStackeada,'rt');
if isequal(fid,-1)
else
    i = 1;
    str = fgetl(fid);
    while(ischar(str))
        datos(i) = str2num(str);
        i = i + 1;
        str = fgetl(fid);
    end
    X.senalStackeada = datos;
    fclose(fid);
end

