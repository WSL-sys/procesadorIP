function X = sacar(X,indice)
    tmp = {};
    for i=1:(X.indice-1)
        if i<indice
            t=X.Shots{i};
            tmp{i}=t;
        else
            t=X.Shots{i+1};
            tmp{i}=t;
        end
    end
    X.Shots=tmp;
    X.indice = X.indice - 1;