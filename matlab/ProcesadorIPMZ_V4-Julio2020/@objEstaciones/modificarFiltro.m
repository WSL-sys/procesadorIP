function est = modificarFiltro(est,name,params,indice)
file = 'File';
%tel = 'Telurico';
NA = 'NA';
if strncmp(name,file,length(file)) %(length(name) == length(file)) && (name == file)
    lstFiltros = get(est,'lstFiltros');
    fid = fopen(params,'rt');
    %tratar el filtro desde archivo
    fclose(fid);
else
%    if length(params) > 5 && ischar(params{1})
%        a = char(params{1})
%        params
%        if ~strcmp(a,NA)
%            if strncmp(name,tel,length(tel)) %(length(name) == length(tel)) && (name == tel)
%                arch = asociarImpedancia(est,char(params{1}));
%                params{6} = arch;
%            end
%        end
%    end
    lstFiltros = get(est,'lstFiltros');
    filtros = lstFiltros.filtros;
    filtros{indice} = crearFiltro(name,params);
    lstFiltros.filtros = filtros;
    est = set(est,'lstFiltros',lstFiltros);
end