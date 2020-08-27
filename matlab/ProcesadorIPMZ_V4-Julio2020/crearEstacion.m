function X=crearEstacion(handles);
    %Crea una Estacion y devuelve un objeto de esta.
    X=objEstaciones;
    X=set(X,'file',get(handles.txTExam,'String'));
    X=set(X,'serie',str2num(get(handles.txTSerie,'String')));
    X=set(X,'canal',str2num(get(handles.txTCanal,'String')));
    X=set(X,'ganancia',str2num(get(handles.txTGanancia,'String')));
    X=set(X,'Xr1',str2num(get(handles.txTXr1,'String')));
    X=set(X,'Xr2',str2num(get(handles.txTXr2,'String')));
    X=set(X,'frecuencia',str2num(get(handles.txTFrecuencia,'String')));
    X=set(X,'corriente',str2num(get(handles.txTCorriente,'String')));
    X=set(X,'delta_e',str2num(get(handles.txTDelta,'String')));
    X=set(X,'Xt1',str2num(get(handles.txTXt1,'String')));
    X=set(X,'Xt2',str2num(get(handles.txTXt2,'String')));
    X=set(X,'calibracion',get(handles.txTcalibracion,'String'));
    X=set(X,'calibracionHx',get(handles.txTcalibracionHx,'String'));
    X=set(X,'calibracionHy',get(handles.txTcalibracionHy,'String'));
    X=set(X,'azimut',0);
    X=set(X,'arreglo_IP','polo-dipolo');
    str=strread(get(X,'file'),'%s','delimiter','\\');
%     if get(handles.rbTRemota,'Value') ~= 1
        X=set(X,'filename',char(str(length(str))));
%     else
%         X=set(X,'filename',['Rem_',char(str(length(str)))]); % CAMBIO
%     end
%     global objLstEst;
%     if length(getTransmisor(objLstEst)) < 1
%     else
%         tr = getTransmisor(objLstEst);
%         X=set(X,'frecuencia',get(tr,'frecuencia'));
%         X=set(X,'corriente',get(tr,'corriente'));
%         X=set(X,'Xt1',get(tr,'Xt1'));
%         X=set(X,'Xt2',get(tr,'Xt2'));
%     end