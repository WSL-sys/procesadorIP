function actualizarDatos(obj,index,handles)
%Actualiza el contenido de Estacion con respecto al ListBox


%obtiene el tipo de estacion
optEstacionIP = get(handles.rbTIP,'Value');
optEstacionRemota = get(handles.rbTRemota,'Value');
optTransmisor = get(handles.rbTTransmisor,'Value');
opcion = optEstacionIP + optEstacionRemota*2 + optTransmisor*3;

%obtiene los datos de la estacionen Index.
switch opcion
    case 1 
        objEst = get(obj,index);
    case 2 
        objEst = getEstRemota(obj);
    case 3 
        objEst = getTransmisor(obj);
end
    
str = get(objEst,'file');
set(handles.txTExam,'String',str);
str = get(objEst,'serie');
set(handles.txTSerie,'String',num2str(str));
str = get(objEst,'Xt1');
set(handles.txTXt1,'String',num2str(str));
str = get(objEst,'Xt2');
set(handles.txTXt2,'String',num2str(str));
str = get(objEst,'Xr1');
set(handles.txTXr1,'String',num2str(str));
str = get(objEst,'Xr2');
set(handles.txTXr2,'String',num2str(str));
str = get(objEst,'canal');
set(handles.txTCanal,'String',num2str(str));
str = get(objEst,'ganancia');
set(handles.txTGanancia,'String',num2str(str));
str = get(objEst,'frecuencia');
set(handles.txTFrecuencia,'String',num2str(str));
str = get(objEst,'delta_e');
set(handles.txTDelta,'String',num2str(str));
str = get(objEst,'corriente');
set(handles.txTCorriente,'String',str);
str = get(objEst,'calibracion');
set(handles.txTcalibracion,'String',str);
str = get(objEst,'calibracionHx');
set(handles.txTcalibracionHx,'String',str);
str = get(objEst,'calibracionHy');
set(handles.txTcalibracionHy,'String',str);
