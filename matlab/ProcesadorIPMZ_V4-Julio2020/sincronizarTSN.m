function sincronizarTSN(Est1,Est2)
[Est1,path] = uigetfile('*.ts4');
Est1 = [path Est1];
[Est2,path] = uigetfile([path '*.ts4']);
Est2 = [path Est2];




%objLstEst_tmp = objLstEst;
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
%Estacion = getEstRemota(objLstEst_tmp);
%fileEstRemota = get(Estacion,'file');
%str=strread(fileEstRemota,'%s','delimiter','\\');
%destino = [path,char(str(length(str)))];
%Estacion = set(Estacion,'file',destino);
%objLstEst_tmp=setEstRemota(objLstEst_tmp,Estacion);
%[header,tini,tfin]= leer_header(fileEstRemota);
%tiempoEstRemota(1) = datenum(tini);
%tiempoEstRemota(2) = datenum(tfin);
%TRUCO: para que el transmisor no intervenga...
%tiempoTransmisor(1) = datenum(tini);
%tiempoTransmisor(2) = datenum(tfin);

%lee el intervalo de tiempo de todos las estaciones IP.
%largoEstTmp = length(objLstEst_tmp);
%for i = 1:largoEstTmp
%    Estacion = get(objLstEst_tmp,i);
%    fileEstacion(i) = Est1;%cellstr(get(Estacion,'file'));
%    fileEstacion(i) = Est1;%cellstr(get(Estacion,'file'));
    
%    str=strread(char(fileEstacion(i)),'%s','delimiter','\\');
%    destino = [path,char(str(length(str)))];
%    Estacion = set(Estacion,'file',destino);
%    objLstEst_tmp=set(objLstEst_tmp,Estacion,i);

    [header,tini,tfin]= leer_header(Est1);
    tiempoEstacion(1,1) = datenum(tini);
    tiempoEstacion(1,2) = datenum(tfin);

    [header,tini,tfin]= leer_header(Est2);
    tiempoEstacion(2,1) = datenum(tini);
    tiempoEstacion(2,2) = datenum(tfin);
    
%end

%calcula el menor intervalo de tiempo .
inicio = max(tiempoEstacion(:,1)');
final = min(tiempoEstacion(:,2)');
tiempoEstacion(2,1)
datestr(tiempoEstacion(2,1))
tiempoEstacion(2,2)
datestr(tiempoEstacion(2,2))
msgbox(['intervalo de tiempo 1 entre:' ...
    datestr(tiempoEstacion(1,1)) ' a  ' datestr(tiempoEstacion(1,2)), ....
    ' intervalo de tiempo 2 entre:',datestr(tiempoEstacion(2,1)), ...
    ' a  ',datestr(tiempoEstacion(2,2))]);

if (final < inicio)
    msgbox('las series de tiempo no se intersectan!!!');
    return
end
%*****************************************************
%corta el transmisor (!!pendiente??).

%*****************************************************
%corta la estacione remota.
%str=strread(fileEstRemota,'%s','delimiter','\\');
%destino = [path,'\',char(str(length(str)))];

%*****************************************************
%corta las estaciones IP.
    str=strread(Est1,'%s','delimiter','\\');
    destino = [path,'\',char(str(length(str))) 'x'];
    copy_TSN(Est1,destino,datestr(inicio),datestr(final));
    waitbar(1/2,hs);
    str=strread(Est2,'%s','delimiter','\\');
    destino = [path,'\',char(str(length(str))) 'x'];
    copy_TSN(Est2,destino,datestr(inicio),datestr(final));
    waitbar(1,hs);


%actualiza la lista de estaciones
%objLstEst = objLstEst_tmp; 
%toFile(objLstEst,archivo);
%actualizarListaEstaciones(objLstEst,handle);
%set(handles.ListaEstaciones,'String',ToString(objLstEst));
close(hs);