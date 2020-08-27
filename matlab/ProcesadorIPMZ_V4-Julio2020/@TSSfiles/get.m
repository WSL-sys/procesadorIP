function value=get(X,option)
switch option
    case 'datos'
        value=X.datos;
    case 'tiempo'
        value=X.tiempo;
    case 'header'
        value=X.header;
end    