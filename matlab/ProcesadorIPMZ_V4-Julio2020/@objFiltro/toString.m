function str = toString(X)
    % Retorna un arreglo de strings con el nombre y parametros del filtro
    c =';';
    str = X.nombre;
    for i=1:length(X.params);
        if ~isnumeric(X.params{i})
            str = [str,c,X.params{i}];
        else
            str = [str,c,num2str(X.params{i})];
        end
    end