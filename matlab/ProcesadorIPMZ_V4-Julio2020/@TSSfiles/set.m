function X=set(X,option,value)
%X=Set(X,option,value)
% 

switch option
    case 'datos'
        X.datos = value;
    case 'tiempo'
        X.tiempo = value;
    case 'header'
        X.header = value;
end    






