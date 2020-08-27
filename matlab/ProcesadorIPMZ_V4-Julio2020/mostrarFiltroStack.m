function res = mostrarFiltroStack(X,handles)
% res = mostrarFiltroStack(X,handles) Muestra el filtro y stack de un 
% objeto.
% Si el objeto es un objeto Shot mustra el filtro y stack del primer filtro
% de la primera estación.
%Si el objeto es una estacion muestra sus filtros y su stack.
%Si el objeto es un filtro, muetra los valores del filtro.
%Si el objeto es un stack, muestra los valores del stack.

%Si es un objeto Shot
lista{1}='Mean 50 Hz';
lista{2}='Weak 50 Hz';
lista{3}='Hard 50 Hz';
lista{4}='Mean 60 Hz';
lista{5}='Weak 60 Hz';
lista{6}='Hard 60 Hz';

set(handles.ls50hz,'String',lista);
set(handles.ls50hz2,'String',lista);


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
            set(handles.pbFRuido2,'Value',1);
            set(handles.txImpedancia2,'String',params{1});
            set(handles.txHxch,'String',params{2});
            set(handles.txHych,'String',params{3});
            set(handles.txRGanancia2,'String',params{4});
            set(handles.txRFMin2,'String',params{5});
            set(handles.txRFMax2,'String',params{6});
            set(handles.txRFN,'String',params{7});
            set(handles.chRestarRuidoP,'Value',params{8});
            set(handles.rtEch,'String',params{9});
            set(handles.rt50Hz,'Value',params{10});
            set(handles.rt60Hz,'Value',params{11});
            set(handles.ftTaper,'Value',params{12});
  
%            params{1} = get(handles.txImpedancia2,'String');
%            params{2} = get(handles.txHxch,'String');
%            params{3} = get(handles.txHych,'String');
%            params{4} = get(handles.txRGanancia2,'String');
%            params{5} = get(handles.txRFMin2,'String');
%            params{6} = get(handles.txRFMax2,'String');
%            params{7} = get(handles.txRFN,'String');
%            params{8} = get(handles.chRestarRuidoP,'Value');
 
%            ruido = params{8};
%            if ~isnumeric(ruido)
%                ruido = str2num(ruido);
%            end
            set(handles.pnRuido2,'Visible','on');
            set(handles.pnWeiner2,'Visible','off');
            set(handles.pn50hz2,'Visible','off');
            set(handles.pnNivel2,'Visible','off');
            set(handles.pnBanda2,'Visible','off');
        case 'Weiner'
            set(handles.rbFWeiner2,'Value',1);
            set(handles.txVarianza2,'String',params{1});
            set(handles.pnRuido2,'Visible','off');
            set(handles.pnWeiner2,'Visible','on');
            set(handles.pn50hz2,'Visible','off');
            set(handles.pnNivel2,'Visible','off');
            set(handles.pnBanda2,'Visible','off');
        case '50 hz'
            set(handles.rbF502,'Value',1);
            set(handles.ls50hz2,'Value',str2num(params{1}));
            set(handles.pnRuido2,'Visible','off');
            set(handles.pnWeiner2,'Visible','off');
            set(handles.pn50hz2,'Visible','on');
            set(handles.pnNivel2,'Visible','off');
            set(handles.pnBanda2,'Visible','off');
        case 'Nivel'
            set(handles.rbFNivel2,'Value',1);
            set(handles.txLimSuperior2,'String',params{1});
            set(handles.txLimInferior2,'String',params{2});
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
                set(handles.btNivelVertical,'Value',1);
            else
                set(handles.btNivelHorizontal,'Value',1);
            end
            if co
                set(handles.rbCortarSenal,'Value',1);
            else
                set(handles.rbRellenarCeros,'Value',1);
            end
            set(handles.pnRuido2,'Visible','off');
            set(handles.pnWeiner2,'Visible','off');
            set(handles.pn50hz2,'Visible','off');
            set(handles.pnNivel2,'Visible','on');
            set(handles.pnBanda2,'Visible','off');
        case 'Banda'
            set(handles.rbFBanda2,'Value',1);
            set(handles.txF02,'String',params{1});
            set(handles.txF12,'String',params{2});
            set(handles.txF22,'String',params{3});
            set(handles.txF32,'String',params{4});
            set(handles.txG02,'String',params{5});
            set(handles.txG12,'String',params{6});
            set(handles.txG22,'String',params{7});
            set(handles.txG32,'String',params{8});
            valor = params{9};
            if ~isnumeric(valor)
                valor = str2num(valor);
            end 
            set(handles.chBandaRuido,'Value',valor);
            set(handles.pnRuido2,'Visible','off');
            set(handles.pnWeiner2,'Visible','off');
            set(handles.pn50hz2,'Visible','off');
            set(handles.pnNivel2,'Visible','off');
            set(handles.pnBanda2,'Visible','on');
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
            set(handles.txImpedancia2,'String',params{1});
            set(handles.txHxch,'String',params{2});
            set(handles.txHych,'String',params{3});
            set(handles.txRGanancia2,'String',params{4});
            set(handles.txRFMin2,'String',params{5});
            set(handles.txRFmax2,'String',params{6});
            set(handles.txRFN,'String',params{7});
            if ischar(params{8})
                c=str2num(params{8});
            else
                c=params{8};    
            end
            set(handles.chRestarRuidoP,'Value',c);
            set(handles.rtEch,'String',params{9});
            if ischar(params{10})
                c=str2num(params{10});
            else
                c=params{10};    
            end
            set(handles.rt50Hz,'Value',c);
            if ischar(params{11})
                c=str2num(params{11});
            else
                c=params{11};    
            end
            set(handles.rt60Hz,'Value',c);
            if ischar(params{12})
                c=str2num(params{12});
            else
                c=params{12};    
            end
            set(handles.ftTaper,'String',c);

            %set(handles.txHxcal,'String',params{9});
            %set(handles.txHycal,'String',params{10});

            
            set(handles.pbFRuido2,'Value',1);
%            set(handles.txImpedancia2,'String',params{6});
%            set(handles.txCRemoto2,'String',params{2});
%            set(handles.txRGanancia2,'String',params{3});
%            set(handles.txRFMax2,'String',params{4});
%            set(handles.txRFMin2,'String',params{5});
%            ruido = params{7};
%            if ~isnumeric(ruido)
%                ruido = str2num(ruido);
%            end
%            set(handles.chRestarRuido,'Value',ruido);
            set(handles.pnRuido2,'Visible','on');
            set(handles.pnWeiner2,'Visible','off');
            set(handles.pn50hz2,'Visible','off');
            set(handles.pnNivel2,'Visible','off');
            set(handles.pnBanda2,'Visible','off');
        case 'Weiner'
            set(handles.rbFWeiner2,'Value',1);
            set(handles.txVarianza2,'String',params{1});
            set(handles.pnRuido2,'Visible','off');
            set(handles.pnWeiner2,'Visible','on');
            set(handles.pn50hz2,'Visible','off');
            set(handles.pnNivel2,'Visible','off');
            set(handles.pnBanda2,'Visible','off');
        case '50 hz'
            set(handles.rbF502,'Value',1);
            set(handles.ls50hz2,'Value',str2num(params{1}));
            set(handles.pnRuido2,'Visible','off');
            set(handles.pnWeiner2,'Visible','off');
            set(handles.pn50hz2,'Visible','on');
            set(handles.pnNivel2,'Visible','off');
            set(handles.pnBanda2,'Visible','off');
        case 'Nivel'
            set(handles.rbFNivel2,'Value',1);
            set(handles.txLimSuperior2,'String',params{1});
            set(handles.txLimInferior2,'String',params{2});
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
                set(handles.btNivelVertical,'Value',1);
            else
                set(handles.btNivelHorizontal,'Value',1);
            end
            if co
                set(handles.rbCortarSenal,'Value',1);
            else
                set(handles.rbRellenarCeros,'Value',1);
            end
            set(handles.pnRuido2,'Visible','off');
            set(handles.pnWeiner2,'Visible','off');
            set(handles.pn50hz2,'Visible','off');
            set(handles.pnNivel2,'Visible','on');
            set(handles.pnBanda2,'Visible','off');
        case 'Banda'
            set(handles.rbFBanda2,'Value',1);
            set(handles.txF02,'String',params{1});
            set(handles.txF12,'String',params{2});
            set(handles.txF22,'String',params{3});
            set(handles.txF32,'String',params{4});
            set(handles.txG02,'String',params{5});
            set(handles.txG12,'String',params{6});
            set(handles.txG22,'String',params{7});
            set(handles.txG32,'String',params{8});
            valor = params{9};
            if ~isnumeric(valor)
                valor = str2num(valor);
            end 
            set(handles.chBandaRuido,'Value',valor);
            set(handles.pnRuido2,'Visible','off');
            set(handles.pnWeiner2,'Visible','off');
            set(handles.pn50hz2,'Visible','off');
            set(handles.pnNivel2,'Visible','off');
            set(handles.pnBanda2,'Visible','on');
    end
end

if isa(X,'objStack')
    params = X.params;
    switch X.nombre
        case 'Normal'
            set(handles.rbSNormal2,'Value',1);
            set(handles.pnRobusto2,'Visible','off');
            set(handles.pnTiempos2,'Visible','off');
            set(handles.pnHalvelson2,'Visible','off');
            set(handles.pnSFile2,'Visible','off');
            if length(params) > 1
                set(handles.edit77,'String',params{2});
            else
                set(handles.edit77,'String','0');
            end
            
        case 'Robusto'
            set(handles.rbSRobusto2,'Value',1);
            set(handles.txDecision2,'String',params{1});
            if length(params) > 1
                set(handles.edit77,'String',params{2});
            else
                set(handles.edit77,'String','0');
            end
            
            set(handles.pnRobusto2,'Visible','on');
            set(handles.pnTiempos2,'Visible','off');
            set(handles.pnHalvelson2,'Visible','off');
            set(handles.pnSFile2,'Visible','off');
%         case 'Tiempos'
%             set(handles.rbSTiempos2,'Value',1);
%             set(handles.txTiempo2,'String',params{1});
%             set(handles.pnRobusto2,'Visible','off');
%             set(handles.pnTiempos2,'Visible','on');
%             set(handles.pnHalvelson2,'Visible','off');
%             set(handles.pnSFile2,'Visible','off');
%         case 'Halvelson'
%             set(handles.rbSHalvelson2,'Value',1);
%             set(handles.txVentana2,'String',params{1});
%             set(handles.pnRobusto2,'Visible','off');
%             set(handles.pnTiempos2,'Visible','off');
%             set(handles.pnHalvelson2,'Visible','on');
%             set(handles.pnSFile2,'Visible','off');
    end
end