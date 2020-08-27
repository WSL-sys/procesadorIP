function X=subsasgn(X,option,value)
%X=Set(X,option,value)
% 

switch option.subs
    case 'datos'
        X.datos = value;
    case 'tiempo'
        X.tiempo = value;
    case 'header'
        X.header = value;
    case 'n_paginas'
        X.n_paginas = value;
end    






