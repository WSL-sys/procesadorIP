function A = subsasgn(A,S,B)

switch S.type
    case '.'
        switch S.subs
            case 'nombre'
                A.nombre = B;
            case 'params'
                A.params = B;
            case 'largo'
                A.indexParams = B;
        end
end