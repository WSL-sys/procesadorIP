function X=subsref(A,S)
switch S.type
    case '.'
        switch S.subs
            case 'nombre'
                X = A.nombre;
            case 'params'
                X = A.params;
            case 'largo'
                X = indexParams;
        end
end