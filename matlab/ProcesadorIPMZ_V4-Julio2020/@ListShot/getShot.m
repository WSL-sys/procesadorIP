function obj = getShot(X,indice)
    if indice <= X.largo
        obj = X.Shots{indice};
    else
        obj = 0;
    end