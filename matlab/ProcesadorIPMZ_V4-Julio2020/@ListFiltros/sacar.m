function X = sacar(X,indice)
    tmp = {};
    for i=1:(X.indice-1)
        if i<indice
            t=X.filtros{i};
            tmp{i}=t;
        else
            t=X.filtros{i+1};
            tmp{i}=t;
        end
    end
    X.filtros=tmp;
    X.indice = X.indice - 1;