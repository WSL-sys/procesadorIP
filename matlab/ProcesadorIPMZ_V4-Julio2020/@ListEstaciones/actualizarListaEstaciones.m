function actualizarListaEstaciones(objLstEst,handles,opcion)
%agrega una estacion + canal en la lista de estaciones de la 
%interfaz.

switch opcion
    case 3
        set(handles.lsSIP,'String',ToString(objLstEst));
    case 1
        %lista = ToString(objLstEst);
        set(handles.txSTrans,'String',ToStringTrans(getTransmisor(objLstEst)));
    case 2
        set(handles.txSRem,'String',ToStringRem(getEstRemota(objLstEst)));
    case 4
        set(handles.popEstacion,'Value',1);
        %set(handles.popEstacion,'String',conRemota(objLstEst));
        %set(handles.popEstacion,'Value',2);
        set(handles.popEstacion,'String',ToString(objLstEst)); 
    otherwise
        set(handles.lsSIP,'String',ToString(objLstEst));
        set(handles.txSTrans,'String',ToStringTrans(getTransmisor(objLstEst)));
        set(handles.txSRem,'String',ToStringRem(getEstRemota(objLstEst)));
end

function str = conRemota(objLstEst)
str = ToString(objLstEst);
s = ['Remota: ',ToStringRem(getEstRemota(objLstEst))];
str(end + 1) = cellstr(s);
%x=lista(6:getLargo(objLstEst));
%x(1)
%x(2)
%x=lista(6:getLargo(objLstEst));
%set(handles.lsSIP,'String',x);