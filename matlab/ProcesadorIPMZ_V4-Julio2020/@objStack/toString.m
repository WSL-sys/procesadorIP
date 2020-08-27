function str = toString(X)
    % Retorna un arreglo de strings con el nombre y parametros del filtro
    c =';';
    str = X.nombre;
    for i=1:length(X.params);
        str = [str,c,X.params{i}];
    end