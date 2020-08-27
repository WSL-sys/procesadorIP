function est = agregarFiltro(est,name,params)
% agrega un filtro a la estacion en el final de la lista de filtros
file = 'File';
tel = 'Telurico';
NA = 'NA';
if (length(name) == length(file)) & (name == file)
    lstFiltros = get(est,'lstFiltros');
    fid = fopen(params,'rt');
    %tratar el filtro desde archivo
    fclose(fid);
else
%    if length(params) > 5 & ischar(params{1})
%        a = char(params{1})
%        if ~strcmp(a,NA)
%            if (length(name) == length(tel)) & (name == tel)
%                arch = asociarImpedancia(est,char(params{1}));
%                params{6} = arch
%            end
%        end
%    end
    lstFiltros = get(est,'lstFiltros');
    filtros = lstFiltros.filtros;
    indice = length(filtros);
    filtros{indice+1} = crearFiltro(name,params);
    lstFiltros.filtros = filtros;
    est = set(est,'lstFiltros',lstFiltros);
end