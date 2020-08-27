function estFilt = procesar(lstFiltros,est)
    if length(lstFiltros.filtros) > 0
        estFilt=execute(lstFiltros.filtros{1},est);
        for i=2:length(lstFiltros.filtros)
            estFilt=execute(lstFiltros.filtros{i},estFilt);
        end
    end
        