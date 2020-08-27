function res = verificacion(lugar,handles)
switch lugar
    case 'archivoTSN' %%%CASO ARCHIVOTSN%%%
        caja = get(handles.txTExam,'String'); % Archivo TSn
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Serie de tiempo no puede estar vacio','Campos Vacios','modal');
            return
        end
        
       caja = get(handles.txTCanal,'String'); % canal
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Canal no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTGanancia,'String'); % ganancia
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Ganancia no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTXr1,'String'); %xr1
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Xr1 no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTXr2,'String'); %xr2
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Xr2 no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTXt1,'String'); %xt1
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Xt1 no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTXt2,'String'); %xt2
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Xt2 no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTFrecuencia,'String'); % frecuencia
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Frecuencia no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTCorriente,'String'); % corriente
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Corriente no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTDelta,'String'); % delta
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Delta no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTcalibracion,'String'); % calibracion
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Calibracion no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTcalibracionHx,'String'); % calibracionHx
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('CalibracionHx no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txTcalibracionHy,'String'); % calibracionHy
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('CalibracionHy no puede estar vacio','Campos Vacios','modal');
            return
        end
        
    case 'archivoShot' %%%CASO ARCHIVOSHOT%%%
        caja = get(handles.txSTrans,'String'); % transmisor
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Transmisor no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.txSRem,'String'); % Est remota
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Estacion Remota no puede estar vacio','Campos Vacios','modal');
            return
        end
        
        caja = get(handles.lsSIP,'String'); % est IP
        if isempty(caja) | isspace(caja)
            res = 0;
            errordlg('Estacion IP no puede estar vacio','Campos Vacios','modal');
            return
        end
end
res = 1;