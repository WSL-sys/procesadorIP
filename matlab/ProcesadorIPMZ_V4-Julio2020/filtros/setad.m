function setad(handles,est)
num2str(get(est,'Xt1'))
set(handles.adXc1,'String',num2str(get(est,'Xt1')));
set(handles.adXc2,'String',num2str(get(est,'Xt2')));
set(handles.adXr1,'String',num2str(get(est,'Xr1')));
set(handles.adXr2,'String',num2str(get(est,'Xr2')));
set(handles.adRapp,'String',num2str(get(est,'res')));
set(handles.adCarg,'String',num2str(get(est,'carg')));
set(handles.adSp,'String',num2str(get(est,'SP')*1000));
set(handles.adVolt,'String',num2str(get(est,'V')*1000));
a=abs(get(est,'Xr2')-get(est,'Xr1'));
b=abs(get(est,'Xt1')-get(est,'Xr1'));
set(handles.adN,'String',num2str(b/a));
set(handles.pushbutton260,'Value',get(est,'QC'));
if get(handles.pushbutton260,'Value')
set(handles.pushbutton260,'BackgroundColor',[0 1 0]);
set(handles.pushbutton260,'String','OK :D');
else
set(handles.pushbutton260,'BackgroundColor',[1 0 0]);
set(handles.pushbutton260,'String','KILL :C');
end


% switch option
%     case 'filename'
%         X.filename = value;
%     case 'file'
%         X.file = value;
%     case 'serie'
%         X.serie = value;
%     case 'ganancia'
%         X.ganancia = value;
%     case 'azimut'
%         X.azimut = value;
%     case 'impedancia'
%         X.impedancia = value;
%     case 'canal'
%         X.canal = value;
%     case 'canal_remoto'
%         X.canal_remoto = value;
%     case 'Xr1'
%         X.Xr1 = value;
%     case 'Xr2'
%         X.Xr2 = value;
%     case 'Xt1'
%         X.Xt1 = value;
%     case 'Xt2'    
%         X.Xt2 = value;
%     case 'frecuencia'    
%         X.frecuencia = value;    
%     case 'calibracion'
%         X.calibracion = value;
%     case 'calibracionHx'
%         X.calibracionHx = value;
%     case 'calibracionHy'
%         X.calibracionHy = value;
%     case 'calibracionHz'
%         X.calibracionHz = value; 
%     case 'delta_e'
%         X.delta_e = value;     
%     case 'tipo_arreglo'
%         X.tipo_arreglo = value;     
%     case 'corriente'
%         X.corriente = value;     
%     case 'X'
%         X.X=value;     
%     case 'carg'
%         X.carg=value;
%     case 'res'
%         X.res=value;
%     case 'cargAnt'
%         X.cargAnt=value;
%     case 'resAnt'
%         X.resAnt=value;
%     case 'stack'
%         X.stack=value;
%     case 'mini_stack'
%         X.mini_stack=value;
%     case 'curva_IP'
%         X.curva_IP=value;
%     case 'mini_stackAnt'
%         X.mini_stackAnt=value;
%     case 'curva_IPAnt'
%         X.curva_IPAnt=value;
%     case 'corte'
%         X.corte=value;
%     case 'senalFiltrada'
%         X.senalFiltrada=value;
%     case 'senalFiltradaAnt'
%         X.senalFiltradaAnt=value;
%     case 'senalStackeada'
%         X.senalStackeada=value;
%     case 'senalStackeadaAnt'
%         X.senalStackeadaAnt=value;
%     case 'ruidoTelurico'
%         X.ruidoTelurico=value;
%     case 'lstFiltros'
%         X.lstFiltros=value;
%     case 'stack'
%         X.stack=value;
%     case 'fileFiltrada'
%         X.fileFiltrada = value;
%     case 'fileStackeada'
%         X.fileStackeada = value;
%     case 'fileIP'
%         X.fileIP = value;
%     case 'fileMiniStackeada'
%         X.fileMiniStackeada = value;
%     case 'fileRuidoTelurico'
%         X.fileRuidoTelurico = value;
% end    

global psreshnd;

if(~isempty(psreshnd)); 
    ns=get(handles.popShot,'Value');
    ne=get(handles.popEstacion,'Value');
    get_estacion(ns,ne);
            Xt2=get(est,'Xt2');
            Xt1=get(est,'Xt1');
            Xr2=get(est,'Xr2');
            Xr1=get(est,'Xr1');
        if Xt1==Xt2
            x=(Xr1+Xt1)/2;
            y=-abs(-Xr1+Xt1)/2;
        else
            x=(Xt1+Xr1)/2;
            y=-abs(-Xt1+Xt2)/2;    
        end
    hold(psreshnd.axes1,'off');
    global imres;
    [XX,YY]=plotdata(imres,psreshnd);
    hold(psreshnd.axes1,'on');
    [a,nx]=min(abs(x-XX));
    [a,ny]=min(abs(y-YY));
    dX=XX(2)-XX(1);
    dY=YY(2)-YY(1);
    plot(psreshnd.axes1,XX(nx)+dX/2,YY(ny)+dY/2,'xk');
    hold(psreshnd.axes1,'off');
end

global pscarhnd;
if(~isempty(pscarhnd)); 
    ns=get(handles.popShot,'Value');
    ne=get(handles.popEstacion,'Value');
    get_estacion(ns,ne);
            Xt2=get(est,'Xt2');
            Xt1=get(est,'Xt1');
            Xr2=get(est,'Xr2');
            Xr1=get(est,'Xr1');
        if Xt1==Xt2
            x=(Xr1+Xt1)/2;
            y=-abs(-Xr1+Xt1)/2;
        else
            x=(Xt1+Xr1)/2;
            y=-abs(-Xt1+Xt2)/2;    
        end
    hold(pscarhnd.axes1,'off');
    global imcarg;
    [XX,YY]=plotdatacarg(imcarg,pscarhnd);
    hold(pscarhnd.axes1,'on');
    [a,nx]=min(abs(x-XX));
    [a,ny]=min(abs(y-YY));
    dX=XX(2)-XX(1);
    dY=YY(2)-YY(1);
    plot(pscarhnd.axes1,XX(nx)+dX/2,YY(ny)+dY/2,'xk');
    hold(pscarhnd.axes1,'off');
end
    

