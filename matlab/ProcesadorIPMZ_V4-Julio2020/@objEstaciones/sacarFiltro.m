function est = sacarFiltro(est,indice);
lstFiltros = est.lstFiltros;
filtros = lstFiltros.filtros;
tmp = {};
for i=1:(length(filtros)-1)
    if i < indice
        tmp{i} = filtros{i};
    else
        tmp{i} = filtros{i+1};
    end
end
filtros
tmp
lstFiltros.filtros = tmp;
est.lstFiltros = lstFiltros;