function str=toString(X)
%str=toString(est)
%crea un arreglo de celdas strings con los filtros que contiene la lista de
%filtros
largo = length(X.filtros);
if largo > 0
    for i=1:largo
        filtro = X.filtros{i};
        s = filtro.nombre;
        str(i) = cellstr(s);
    end
end