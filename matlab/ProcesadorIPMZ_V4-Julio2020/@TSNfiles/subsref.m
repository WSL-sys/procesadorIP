function value=subsref(X,option)

switch option.subs
     case 'datos'
        value = X.datos;
    case 'tiempo'
        value = X.tiempo;
    case 'header'
        value = X.header;
    case 'n_paginas'
        value = X.n_paginas;
    case 'largo'
        value=X.largo;
    case 'fid'
        value=X.fid;
    case 'hot'
        value=X.hot;
end    