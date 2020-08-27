function autoShot(dirShot, dirCalCaja, dirCalBobina)%, dirDest)

directorios = dir(dirShot);
%calCaja = dir(dirCalCaja);
%calBobina = dir(dirCalBobina);
%destino = dirDest;

for i=1:length(directorios)
    if directorios(i).isdir & (directorios(i).name ~= '.')
        shotFile = [dirShot,'\',directorios(i).name,'\',strtok(directorios(i).name,'('),'_sync.sht'];
        objLstEst = abrirShot(shotFile);
        objLstEst = cambiarShot(objLstEst,dirCalCaja,dirCalBobina,[dirShot,'\',directorios(i).name,'\']);
        objLstEst = toFile(objLstEst,shotFile);
        numEst = determinarSeparacion(objLstEst);
        if numEst > 0
            arreglarShot(shotFile,numEst);
        end
    end
end
        


function objLstEst = cambiarShot(objLstEst,dirCalCaja,dirCalBobina,path)
rem = getEstRemota(objLstEst);
filename = get(rem,'filename');
rem = set(rem,'file',[path,filename]); %% Cambiamos la ruta del archivo TSN a la ruta valida.
serie = get(rem,'serie');
rem = set(rem,'calibracion',[dirCalCaja,'\',num2str(serie),'.txt']);
rem = set(rem,'calibracionHx',[dirCalBobina,'\amtc1419.txt']); %%TODO: cambiar al archivo que corresponde
rem = set(rem,'calibracionHy',[dirCalBobina,'\amtc1375.txt']); %%TODO: cambiar al archivo que corresponde
objLstEst = setEstRemota(objLstEst,rem);

trans = getTransmisor(objLstEst);
filename = get(trans,'filename');
trans = set(trans,'file',[path,filename]); %% Cambiamos la ruta del archivo TSN a la ruta valida.
objLstEst = setTransmisor(objLstEst,trans);

for i=1:length(objLstEst)
    objEst = get(objLstEst,i);
    filename = get(objEst,'filename');
    objEst = set(objEst,'file',[path,filename]); %% Cambiamos la ruta del archivo TSN a la ruta valida.
    serie = get(objEst,'serie');
    objEst = set(objEst,'calibracion',[dirCalCaja,'\',num2str(serie),'.txt']);
    objEst = set(objEst,'calibracionHx',[dirCalBobina,'\amtc',num2str(serie),'.txt']); %%TODO: cambiar al archivo que corresponde
    objEst = set(objEst,'calibracionHy',[dirCalBobina,'\amtc',num2str(serie),'.txt']); %%TODO: cambiar al archivo que corresponde
    objLstEst = set(objLstEst,objEst,i);
end


function numEst = determinarSeparacion(objLstEst)
objEst = get(objLstEst,1);
Xt = get(objEst,'Xt2');

for i=1:length(objLstEst)
    objEst = get(objLstEst,i);
    Xr = get(objEst,'Xr1');
    if Xr > Xt
        numEst = (i-1);
        return
    end
end

numEst = 0;


