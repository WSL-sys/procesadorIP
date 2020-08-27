function res = mostrarFiltroStackP(X,handles)
% res = mostrarFiltroStack(X,handles) Muestra el filtro y stack de un 
% objeto.
% Si el objeto es un objeto Shot mustra el filtro y stack del primer filtro
% de la primera estación.
%Si el objeto es una estacion muestra sus filtros y su stack.
%Si el objeto es un filtro, muetra los valores del filtro.
%Si el objeto es un stack, muestra los valores del stack.



lista{1}='Mean 50 Hz';
lista{2}='Weak 50 Hz';
lista{3}='Hard 50 Hz';
lista{4}='Mean 60 Hz';
lista{5}='Weak 60 Hz';
lista{6}='Hard 60 Hz';

%set(handles.ls50hz,'String',lista);
set(handles.ls50hz,'String',lista);

%Si es un objeto Shot
if isa(X,'objShot')
    ests = X.objLstEst;
    est = get(ests,1);
    lstFiltros = get(est,'lstFiltros');
    filtros = lstFiltros.filtros;
    filtro = filtros{1};
    stack = get(est,'stack');
    params = filtro.params;
    switch filtro.nombre
        case 'Telurico'
%            set(handles.rbFRuido,'Value',1);
%            set(handles.txImpedancia,'String',params{1});
%            set(handles.txCRemoto,'String',params{2});
%            set(handles.txRGanancia,'String',params{3});
%            set(handles.txRFMax,'String',params{4});
%            set(handles.txRFMin,'String',params{5});
%            ruido = params{7};
%            if ~isnumeric(ruido)
%                ruido = str2num(ruido);
%            end
            set(handles.rbFRuido,'Value',1);
            set(handles.txImpedancia2x,'String',params{1});
            set(handles.txHxchx,'String',params{2});
            set(handles.txHychx,'String',params{3});
            set(handles.txRGanancia2x,'String',params{4});
            set(handles.txRFMin2x,'String',params{5});
            set(handles.txRFmax2x,'String',params{6});
            set(handles.txRFNx,'String',params{7});
            set(handles.chRestarRuidoPx,'Value',params{8});
            set(handles.rtEchx,'String',params{9});
            set(handles.rt50Hzx,'Value',params{10});
            set(handles.rt60Hzx,'Value',params{11});
            set(handles.ftTaperx,'String',params{12});

%            set(handles.chRestarRuidoP,'Value',ruido);
            set(handles.pnRuido,'Visible','on');
            set(handles.pnWeiner,'Visible','off');
            set(handles.pn50hz,'Visible','off');
            set(handles.pnNivel,'Visible','off');
            set(handles.pnBanda,'Visible','off');
        case 'Weiner'
            set(handles.rbFWeiner,'Value',1);
            set(handles.txVarianza,'String',params{1});
            set(handles.pnRuido,'Visible','off');
            set(handles.pnWeiner,'Visible','on');
            set(handles.pn50hz,'Visible','off');
            set(handles.pnNivel,'Visible','off');
            set(handles.pnBanda,'Visible','off');
        case '50 hz'
            set(handles.rbF50,'Value',1);
            set(handles.ls50hz,'Value',str2num(params{1}));
            set(handles.pnRuido,'Visible','off');
            set(handles.pnWeiner,'Visible','off');
            set(handles.pn50hz,'Visible','on');
            set(handles.pnNivel,'Visible','off');
            set(handles.pnBanda,'Visible','off');
        case 'Nivel'
            set(handles.rbFNivel,'Value',1);
            set(handles.txLimSuperior,'String',params{1});
            set(handles.txLimInferior,'String',params{2});
            or = params{3};
            co = params{4};
            if ~isnumeric(or)
                or = str2num(or) - 1;
            else
                or = or - 1;
            end
            if ~isnumeric(co)
                co = str2num(co) - 1;
            else
                co = co - 1;
            end
            if or
                set(handles.rbNVertical,'Value',1);
            else
                set(handles.rbNHorizontal,'Value',1);
            end
            if co
                set(handles.rbNCorte,'Value',1);
            else
                set(handles.rbNCeros,'Value',1);
            end
            set(handles.pnRuido,'Visible','off');
            set(handles.pnWeiner,'Visible','off');
            set(handles.pn50hz,'Visible','off');
            set(handles.pnNivel,'Visible','on');
            set(handles.pnBanda,'Visible','off');
        case 'Banda'
            set(handles.rbFBanda,'Value',1);
            set(handles.txF0,'String',params{1});
            set(handles.txF1,'String',params{2});
            set(handles.txF2,'String',params{3});
            set(handles.txF3,'String',params{4});
            set(handles.txG0,'String',params{5});
            set(handles.txG1,'String',params{6});
            set(handles.txG2,'String',params{7});
            set(handles.txG3,'String',params{8});
            valor = params{9};
            if ~isnumeric(valor)
                valor = str2num(valor);
            end            
            set(handles.chRestarBandaP,'Value',params{9});
            set(handles.pnRuido,'Visible','off');
            set(handles.pnWeiner,'Visible','off');
            set(handles.pn50hz,'Visible','off');
            set(handles.pnNivel,'Visible','off');
            set(handles.pnBanda,'Visible','on');
    end
    params = stack.params;
    switch stack.nombre
        case 'Normal'
            set(handles.rbSNormal,'Value',1);
            set(handles.pnRobusto,'Visible','off');
            set(handles.pnTiempos,'Visible','off');
            set(handles.pnHalvelson,'Visible','off');
            set(handles.pnSFile,'Visible','off');
        case 'Robusto'
            set(handles.rbSRobusto,'Value',1);
            set(handles.txDecision,'String',params{1});
            set(handles.pnRobusto,'Visible','on');
            set(handles.pnTiempos,'Visible','off');
            set(handles.pnHalvelson,'Visible','off');
            set(handles.pnSFile,'Visible','off');
        case 'Tiempos'
            set(handles.rbSTiempos,'Value',1);
            set(handles.txTiempo,'String',params{1});
            set(handles.pnRobusto,'Visible','off');
            set(handles.pnTiempos,'Visible','on');
            set(handles.pnHalvelson,'Visible','off');
            set(handles.pnSFile,'Visible','off');
        case 'Halvelson'
            set(handles.rbSHalvelson,'Value',1);
            set(handles.txVentana,'String',params{1});
            set(handles.pnRobusto,'Visible','off');
            set(handles.pnTiempos,'Visible','off');
            set(handles.pnHalvelson,'Visible','on');
            set(handles.pnSFile,'Visible','off');
    end
end

if isa(X,'objFiltro')
    params = X.params;
    switch X.nombre
        case 'Telurico'
            set(handles.rbFRuido,'Value',1);
   
            set(handles.txImpedancia2x,'String',params{1});
            set(handles.txHxchx,'String',params{2});
            set(handles.txHychx,'String',params{3});
            set(handles.txRGanancia2x,'String',params{4});
            set(handles.txRFMin2x,'String',params{5});
            set(handles.txRFmax2x,'String',params{6});
            set(handles.txRFNx,'String',params{7});
            set(handles.chRestarRuidoPx,'Value',params{8});
            set(handles.rtEchx,'String',params{9});
            set(handles.rt50Hzx,'Value',params{10});
            set(handles.rt60Hzx,'Value',params{11});
            set(handles.ftTaperx,'String',params{12});

            
            
            
%            set(handles.rbFRuido,'Value',1);
%            set(handles.txImpedancia,'String',params{1});
%            set(handles.txCRemoto,'String',params{2});
%            set(handles.txRGanancia,'String',params{3});
%            set(handles.txRFMax,'String',params{4});
%            set(handles.txRFMin,'String',params{5});
%            ruido = params{7};
%            if ~isnumeric(ruido)
%                ruido = str2num(ruido);
%            end
            
            
%            set(handles.chRestarRuidoP,'Value',ruido);
            set(handles.pnRuido,'Visible','on');
            set(handles.pnWeiner,'Visible','off');
            set(handles.pn50hz,'Visible','off');
            set(handles.pnNivel,'Visible','off');
            set(handles.pnBanda,'Visible','off');
        case 'Weiner'
            set(handles.rbFWeiner,'Value',1);
            set(handles.txVarianza,'String',params{1});
            set(handles.pnRuido,'Visible','off');
            set(handles.pnWeiner,'Visible','on');
            set(handles.pn50hz,'Visible','off');
            set(handles.pnNivel,'Visible','off');
            set(handles.pnBanda,'Visible','off');
        case '50 hz'
            set(handles.rbF50,'Value',1);
            set(handles.ls50hz,'Value',str2num(params{1}));
            set(handles.pnRuido,'Visible','off');
            set(handles.pnWeiner,'Visible','off');
            set(handles.pn50hz,'Visible','on');
            set(handles.pnNivel,'Visible','off');
            set(handles.pnBanda,'Visible','off');
        case 'Nivel'
            set(handles.rbFNivel,'Value',1);
            set(handles.txLimSuperior,'String',params{1});
            set(handles.txLimInferior,'String',params{2});
            or = params{3};
            co = params{4};
            if ~isnumeric(or)
                or = str2num(or) - 1;
            else
                or = or - 1;
            end
            if ~isnumeric(co)
                co = str2num(co) - 1;
            else
                co = co - 1;
            end
            if or
                set(handles.rbNVertical,'Value',1);
            else
                set(handles.rbNHorizontal,'Value',1);
            end
            if co
                set(handles.rbNCorte,'Value',1);
            else
                set(handles.rbNCeros,'Value',1);
            end
            set(handles.pnRuido,'Visible','off');
            set(handles.pnWeiner,'Visible','off');
            set(handles.pn50hz,'Visible','off');
            set(handles.pnNivel,'Visible','on');
            set(handles.pnBanda,'Visible','off');
        case 'Banda'
            set(handles.rbFBanda,'Value',1);
            set(handles.txF0,'String',params{1});
            set(handles.txF1,'String',params{2});
            set(handles.txF2,'String',params{3});
            set(handles.txF3,'String',params{4});
            set(handles.txG0,'String',params{5});
            set(handles.txG1,'String',params{6});
            set(handles.txG2,'String',params{7});
            set(handles.txG3,'String',params{8});
            valor = params{9};
            if ~isnumeric(valor)
                valor = str2num(valor);
            end            
            set(handles.chRestarBandaP,'Value',valor);            
            set(handles.pnRuido,'Visible','off');
            set(handles.pnWeiner,'Visible','off');
            set(handles.pn50hz,'Visible','off');
            set(handles.pnNivel,'Visible','off');
            set(handles.pnBanda,'Visible','on');
    end
end

if isa(X,'objStack')
    params = X.params;
    switch X.nombre
        case 'Normal'
            set(handles.rbSNormal,'Value',1);
            set(handles.pnRobusto,'Visible','off');
            set(handles.pnTiempos,'Visible','off');
            set(handles.pnHalvelson,'Visible','off');
            set(handles.pnSFile,'Visible','off');
        case 'Robusto'
            set(handles.rbSRobusto,'Value',1);
            set(handles.txDecision,'String',params{1});
            set(handles.pnRobusto,'Visible','on');
            set(handles.pnTiempos,'Visible','off');
            set(handles.pnHalvelson,'Visible','off');
            set(handles.pnSFile,'Visible','off');
        case 'Tiempos'
            set(handles.rbSTiempos,'Value',1);
            set(handles.txTiempo,'String',params{1});
            set(handles.pnRobusto,'Visible','off');
            set(handles.pnTiempos,'Visible','on');
            set(handles.pnHalvelson,'Visible','off');
            set(handles.pnSFile,'Visible','off');
        case 'Halvelson'
            set(handles.rbSHalvelson,'Value',1);
            set(handles.txVentana,'String',params{1});
            set(handles.pnRobusto,'Visible','off');
            set(handles.pnTiempos,'Visible','off');
            set(handles.pnHalvelson,'Visible','on');
            set(handles.pnSFile,'Visible','off');
    end
end