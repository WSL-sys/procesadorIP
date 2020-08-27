function est = setFiltro(est,name,params)
% Asocia un unico filtro a la estacion ocupado solamente en el preproceso
% de la señal
file = 'File';
if (length(name) == length(file)) & (name == file)
    lstFiltros = get(est,'lstFiltros');
    fid = fopen(params,'rt');
    %tratar el filtro desde archivo
    fclose(fid);
else
    lstFiltros = get(est,'lstFiltros');
    filtros{1} = crearFiltro(name,params);
    lstFiltros.filtros = filtros;
    est = set(est,'lstFiltros',lstFiltros);
end