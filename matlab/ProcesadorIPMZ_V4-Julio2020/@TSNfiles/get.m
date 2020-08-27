function value=get(X,option)
switch option
    case 'datos'
        value=X.datos;
    case 'tiempo'
        value=X.tiempo;
    case 'header'
        value=X.header;
    case 'largo'
        value=X.largo;
    case 'fid'
        value=X.fid;
    case 'hot'
        value=X.hot;
end    