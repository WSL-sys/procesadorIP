function actualizarPanel(X,panel,handles)
switch panel
    case 'shot'
        %actualizar el panel de shots
    case 'proceso'
        %actualiza el panel de proceso
        if X.largo > 0
            set(handles.lsPShot,'String',X.listarShots);
            shot = get(handles.lsPShot,'Value');
            %set(handles.lbFiltro,'String',getFiltro(X,shot));
            %set(handles.lbStack,'String',getStack(X,shot));
        end
    case 'editar'
        %actualiza el panel de edicion de proceso
    case 'resultados'
        %actualiza el panel de resultados
end