function res = crearShotRemota(dirShot)
%try
directorios = dir(dirShot);

objLstShot = ListShot;

for i=1:length(directorios)
    if directorios(i).isdir & (directorios(i).name ~= '.')
        shotFile = [dirShot,'\',directorios(i).name,'\',strtok(directorios(i).name,'('),'_sync.sht'];
        objLstEst = abrirShot(shotFile);
        Temp = ListEstaciones;
        Temp = setTransmisor(Temp,getTransmisor(objLstEst));
        Temp = setEstRemota(Temp,getEstRemota(objLstEst));
        for j=1:6
            X = getEstRemota(objLstEst);
            X = set(X,'canal',j);
            Temp = Agregar(Temp,X,3);
        end
        shotRem = [dirShot,'\',directorios(i).name,'\',directorios(i).name,'_rem_sync.sht'];
        Temp = toFile(Temp,shotRem);
        objS = crearObjShot(shotRem);
        objLstShot.agregar = objS;
    end
end
objLstShot = Filtros(objLstShot);
objLstShot = Stacks(objLstShot);
objLstShot = ProcesarRem(dirShot,objLstShot);

shots = objLstShot.Shots;
for indiceShot=1:length(shots)
    shot = shots{indiceShot};
    ests = shot.objLstEst;
    for i=1:length(ests)
        est = get(ests,i);
        X = TSNfiles;
        X = open_TSN(X,get(est,'fileFiltrada'),1);
        est = set(est,'senalFiltrada',X);
        lstRemotas{i} = est
    end
    est = get(ests,i);
    frem = get(est,'file');
    movefile(frem,[frem,'.bak']);
    guardarRemota(lstRemotas,frem);
end
%catch
%    res = 0;
%    return;
%end
res = 1;

%%%Aplicamos Filtros
function objLstShot = Filtros(objLstShot)
func = 1;
params = num2str(func); %recupera el nombre del filtro a partir de un indice
shots = objLstShot.Shots;
for indice=1:length(shots)
    shot = shots{indice};
    ests = shot.objLstEst;
    for i=1:length(ests)
        est = get(ests,i);
        est = agregarFiltro(est,'50 hz',params);
        ests = set(ests,est,i);
    end
    est = getEstRemota(ests);
    est = agregarFiltro(est,'50 hz',params);
    ests = setEstRemota(ests,est);
    shot.objLstEst = ests;
    shots{indice}=shot;
end
objLstShot.Shots = shots;

%%%Aplicamos Stacks
function objLstShot = Stacks(objLstShot)
params = 0;
shots = objLstShot.Shots;
for indice=1:length(shots)
    shot = shots{indice};
    ests = shot.objLstEst;
    for i=1:length(ests)
        est = get(ests,i);
        est = setStack(est,'Normal',params);
        ests = set(ests,est,i);
    end
    shot.objLstEst = ests;
    shots{indice}=shot;
end
objLstShot.Shots = shots;

%%% PROCESAMOS
function objLstShot = ProcesarRem(path,objLstShot)
file = 'estaciones_remotas_post.pro';
objLstShot.filename = file;
%Comienza Proceso *****************************
h = waitbar(0,'Procesando...');
algo = [path,'\'];
objLstShot = procesar(objLstShot,algo);
close(h);
crearProceso(objLstShot,[path,'\',file]);
