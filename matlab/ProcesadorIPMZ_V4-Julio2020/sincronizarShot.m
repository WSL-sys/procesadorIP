function objLstEst = sincronizarShot(objLstEst,path)
objLstEst_tmp = objLstEst;
hs = waitbar(0,'Sincronizando archivos tsn...');
%Define el intervalo de tiempo de las series.
%********************************************
%lee el intervalo de tiempo del transmisor.
%Estacion = getTransmisor(objLstEst_tmp);
%fileTransmisor = get(Estacion,'file');

% str=strread(fileTransmisor,'%s','delimiter','\\');
% destino = [path,char(str(length(str)))]
% Estacion = set(Estacion,'file',destino);
% objLstEst_tmp=setTransmisor(objLstEst_tmp,Estacion);
% [header,tini,tfin]= leer_header(fileTransmisor);
% tiempoTransmisor(1) = datenum(tini);
% tiempoTransmisor(2) = datenum(tfin);

%lee el intervalo de tiempo de la estacion remota.
Estacion = getEstRemota(objLstEst_tmp);
fileEstRemota = get(Estacion,'file');
str=strread(fileEstRemota,'%s','delimiter','\\');
destino = [path,char(str(length(str)))];
Estacion = set(Estacion,'file',destino);
objLstEst_tmp=setEstRemota(objLstEst_tmp,Estacion);
[header,tini,tfin]= leer_header(fileEstRemota);
tiempoEstRemota(1) = datenum(tini);
tiempoEstRemota(2) = datenum(tfin);
%TRUCO: para que el transmisor no intervenga...
tiempoTransmisor(1) = datenum(tini);
tiempoTransmisor(2) = datenum(tfin);

%lee el intervalo de tiempo de todos las estaciones IP.
largoEstTmp = length(objLstEst_tmp);
for i = 1:largoEstTmp
    Estacion = get(objLstEst_tmp,i);
    fileEstacion(i) = cellstr(get(Estacion,'file'));
    
    str=strread(char(fileEstacion(i)),'%s','delimiter','\\');
    destino = [path,char(str(length(str)))];
    Estacion = set(Estacion,'file',destino);
    objLstEst_tmp=set(objLstEst_tmp,Estacion,i);
    
    [header,tini,tfin]= leer_header(char(fileEstacion(i)));
    tiempoEstacion(i,1) = datenum(tini);
    tiempoEstacion(i,2) = datenum(tfin);
    
end

%calcula el menor intervalo de tiempo .
inicio = max([tiempoTransmisor(1) tiempoEstRemota(1) tiempoEstacion(:,1)']);
final = min([tiempoTransmisor(2) tiempoEstRemota(2) tiempoEstacion(:,2)']);
msgbox(strcat('intervalo de tiempo entre:',datestr(inicio),' a  ',datestr(final))); 

if (final < inicio)
    msgbox('las series de tiempo no se intersectan!!!');
    return
end
%*****************************************************
%corta el transmisor (!!pendiente??).

%*****************************************************
%corta la estacione remota.
str=strread(fileEstRemota,'%s','delimiter','\\');
destino = [path,'\',char(str(length(str)))];
copy_TSN(fileEstRemota,destino,datestr(inicio),datestr(final));


%*****************************************************
%corta las estaciones IP.
largoEstTmp = length(objLstEst_tmp);
for i = 1:largoEstTmp
    str=strread(char(fileEstacion(i)),'%s','delimiter','\\');
    destino = [path,'\',char(str(length(str)))];
    disp(destino);
    copy_TSN(char(fileEstacion(i)),destino,datestr(inicio),datestr(final));
    waitbar(i/largoEstTmp,hs);
end


%actualiza la lista de estaciones
objLstEst = objLstEst_tmp; 
%toFile(objLstEst,archivo);
%actualizarListaEstaciones(objLstEst,handle);
%set(handles.ListaEstaciones,'String',ToString(objLstEst));
close(hs)