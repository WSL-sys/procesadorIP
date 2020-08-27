function objFiltro = getFiltro(est,indice)
% objFiltro = getFiltro(est,indice) 
% devuelve el objeto Filtro requerido segun el indice 
% de la lista de filtros de la estacion est.

lstFiltros = est.lstFiltros;
filtros = lstFiltros.filtros;
objFiltro = filtros{indice};