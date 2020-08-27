function str = listarShots(X)
    if X.indice > 0
        for i=1:X.indice
            str(i)=cellstr(X.Shots{i}.filename);
        end
    else
        str = 'Archivos Shots';
    end